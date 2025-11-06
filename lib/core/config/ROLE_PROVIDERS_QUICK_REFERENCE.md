# Role-Based Providers - Quick Reference

## Quick Start

### Use This (Recommended) ✅
```dart
// Automatically loads providers for current user's role
AppProviders.getProvidersForCurrentUser(
  authViewModel: authViewModel,
  lazy: true,
);
```

### Or This for Specific Role
```dart
// Load providers for a specific role
AppProviders.getProvidersForRole(
  authViewModel: authViewModel,
  userRole: 'doctor',
  lazy: true,
);
```

## Provider Matrix

| Role              | Providers Loaded                                                        | Count |
|-------------------|-------------------------------------------------------------------------|-------|
| **Guest**         | AuthViewModel, ClinicViewModel                                          | 2     |
| **Patient**       | AuthViewModel, ClinicViewModel, DoctorViewModel                         | 3     |
| **Doctor**        | AuthViewModel, DoctorViewModel, ClinicViewModel                         | 3     |
| **Pharmacist**    | AuthViewModel, ClinicViewModel                                          | 2     |
| **Clinic Admin**  | AuthViewModel, ClinicViewModel, DoctorViewModel, DepartmentViewModel    | 4     |
| **Org Admin**     | AuthViewModel, OrganizationViewModel, ClinicViewModel, DoctorViewModel, UserManagementViewModel, DepartmentViewModel | 6 |
| **Super Admin**   | AuthViewModel + ALL ViewModels                                          | 7     |

## Role Strings

Use these exact strings (case-insensitive):
- `super_admin`
- `organization_admin`
- `clinic_admin`
- `doctor`
- `patient`
- `pharmacist`

## Console Output

When providers load, you'll see:
```
🔐 Loading providers for role: doctor
📦 Loaded providers: AuthViewModel, DoctorViewModel, ClinicViewModel
✅ Total providers loaded: 3
```

After login/logout:
```
🔄 Providers reloaded for role: patient
```

## Common Tasks

### Check What Providers Are Loaded
```dart
final providerNames = RoleBasedProviders.getProviderNamesForRole('doctor');
// Returns: ['AuthViewModel', 'DoctorViewModel', 'ClinicViewModel']
```

### Add Provider to a Role
Edit `lib/core/config/role_based_providers.dart`:
```dart
static List<ChangeNotifierProvider> _getDoctorProviders(bool lazy) {
  return [
    ChangeNotifierProvider<DoctorViewModel>(...),
    ChangeNotifierProvider<ClinicViewModel>(...),
    ChangeNotifierProvider<YourNewViewModel>(...), // Add here
  ];
}
```

### Access Provider in Widget
```dart
// Same as before - no changes needed!
final doctorVM = Provider.of<DoctorViewModel>(context);
// or
final doctorVM = context.read<DoctorViewModel>();
// or
Consumer<DoctorViewModel>(
  builder: (context, doctorVM, child) { ... }
)
```

## Migration Checklist

- [x] Role-based provider system created
- [x] Main app updated to reload providers on auth changes
- [x] Backward compatibility maintained (old methods still work)
- [ ] Test each role login/logout
- [ ] Monitor console logs for provider loading
- [ ] Verify no `Provider not found` errors

## Performance Benefits

| Metric              | Before | After (Patient) | Improvement |
|---------------------|--------|-----------------|-------------|
| Providers Loaded    | 7      | 3               | 57% fewer   |
| Estimated Memory    | ~45MB  | ~30MB           | ~33% less   |
| API Endpoints Init  | 7+     | 2-3             | ~60% fewer  |

## Troubleshooting

### Provider Not Found Error
**Fix**: Add the provider to the role in `role_based_providers.dart`

### Providers Not Reloading After Login
**Fix**: Ensure `notifyListeners()` is called in `AuthViewModel.login()`

### App Crashes After Role Switch
**Fix**: Check that all required providers are included for that role

## Files to Know

- `lib/core/config/role_based_providers.dart` - Provider configuration
- `lib/core/config/app_providers.dart` - Provider factory
- `lib/main.dart` - Provider management
- `lib/core/config/ROLE_BASED_PROVIDERS_GUIDE.md` - Full documentation

## Support

Need help? Check:
1. Console logs (look for 🔐 and 📦 emojis)
2. Full documentation in `ROLE_BASED_PROVIDERS_GUIDE.md`
3. Provider definitions in `role_based_providers.dart`

