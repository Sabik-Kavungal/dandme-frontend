# How to Display Clinic Logo in Sidebar

## Current Implementation

The clinic logo is **already implemented** in the sidebar! Here's how it works:

### Location
The logo is displayed in the `_HospitalInfoCard` component located in:
```
lib/core/responsive/universal_responsive_layout.dart
```

### How It Works

1. **Data Source**: The logo is fetched from the authenticated user's data:
   ```dart
   final authViewModel = Provider.of<AuthViewModel>(context);
   final user = authViewModel.user;
   final clinicLogo = user?.logo;
   ```

2. **Display Logic**: The component shows either:
   - **Clinic Logo** (if available): Loaded from network using `NetworkImage`
   - **Fallback Icon**: Hospital icon if logo is not available

3. **Code Implementation** (lines 208-246):
   ```dart
   Container(
     width: isCompact ? 28 : 32,
     height: isCompact ? 28 : 32,
     decoration: BoxDecoration(
       color: clinicLogo != null ? Colors.white : null,
       borderRadius: BorderRadius.circular(8),
       image: clinicLogo != null && clinicLogo.isNotEmpty
           ? DecorationImage(
               image: NetworkImage(clinicLogo),
               fit: BoxFit.contain,
             )
           : null,
     ),
     child: clinicLogo == null || clinicLogo.isEmpty
         ? Icon(
             Icons.local_hospital_rounded,
             color: Colors.white,
             size: isCompact ? 14 : 16,
           )
         : null,
   ),
   ```

## How to Set the Clinic Logo

### Backend Setup

1. **Upload Logo**: Use the clinic settings API to upload a logo
   ```
   POST /api/clinics/:id/logo
   ```

2. **Logo Storage**: The logo is stored in:
   ```
   services/organization-service/uploads/clinics/
   ```

3. **Logo URL**: The logo URL is returned in the user object after login

### Frontend Display

The logo will **automatically appear** in the sidebar once:
1. The clinic has uploaded a logo via the settings page
2. The user logs in (the logo URL is included in the user object)
3. The `AuthViewModel` stores the user data with the logo URL

## Logo Display Locations

The clinic logo appears in:
1. **Sidebar Header** (Desktop/Tablet): Top of the navigation sidebar
2. **Mobile Header**: In the app bar when sidebar is collapsed
3. **Settings Page**: In the clinic settings form

## Troubleshooting

### Logo Not Showing?

1. **Check if logo is uploaded**:
   - Go to Settings → Clinic Settings
   - Upload a logo image
   - Save changes

2. **Check user data**:
   - The `user.logo` field should contain the logo URL
   - Format: `uploads/clinics/logo_filename.png`

3. **Check CORS** (for web):
   - Ensure the Kong gateway serves `/uploads/*` with proper CORS headers
   - This was fixed in the recent CORS update

4. **Check image URL**:
   - Logo URL should be: `http://192.168.1.2:8000/uploads/clinics/your_logo.png`
   - The Kong gateway handles the routing

## Customization

### Change Logo Size

Edit the `_HospitalInfoCard` component:
```dart
Container(
  width: 40,  // Change this
  height: 40, // Change this
  // ... rest of code
)
```

### Change Logo Shape

Modify the `borderRadius`:
```dart
borderRadius: BorderRadius.circular(8), // Square with rounded corners
// or
borderRadius: BorderRadius.circular(20), // More rounded
// or for circle:
shape: BoxShape.circle,
```

### Add Logo Border

```dart
decoration: BoxDecoration(
  // ... existing code
  border: Border.all(
    color: Colors.grey.shade300,
    width: 2,
  ),
),
```

## Summary

✅ **Logo functionality is already implemented**
✅ **Displays automatically when logo is uploaded**
✅ **Has fallback icon when no logo exists**
✅ **Works across all screen sizes (mobile, tablet, desktop)**
✅ **CORS issues are fixed for web deployment**

**Next Steps**:
1. Upload your clinic logo via the Settings page
2. The logo will appear automatically in the sidebar
3. No code changes needed!
