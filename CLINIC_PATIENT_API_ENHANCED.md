# Enhanced Clinic Patient API Integration

## Overview
The clinic patient API has been successfully updated to include all fields from the comprehensive patient form. This includes personal information, address details, lifestyle information, and physical measurements.

## 📋 New Fields Added

### Personal Information
- `age` (int?): Patient age in years (0-150)
- `address1` (String?): Primary address line (max 200 chars)
- `address2` (String?): Secondary address line (max 200 chars)  
- `district` (String?): Patient district (max 100 chars)
- `state` (String?): Patient state (max 100 chars)

### Lifestyle Information
- `smokingStatus` (String?): Smoking status (Yes/No, max 20 chars)
- `alcoholUse` (String?): Alcohol use status (Yes/No, max 20 chars)

### Physical Measurements
- `heightCm` (int?): Patient height in centimeters (0-300)
- `weightKg` (int?): Patient weight in kilograms (0-500)

## 🔧 Updated Files

### 1. Model: `clinic_patient_model.dart`

#### ClinicPatient Model
```dart
@freezed
class ClinicPatient with _$ClinicPatient {
  const factory ClinicPatient({
    required String id,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,                                    // NEW
    String? gender,
    String? address1,                            // NEW
    String? address2,                            // NEW
    String? district,                            // NEW
    String? state,                               // NEW
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,     // NEW
    @JsonKey(name: 'alcohol_use') String? alcoholUse,           // NEW
    @JsonKey(name: 'height_cm') int? heightCm,                  // NEW
    @JsonKey(name: 'weight_kg') int? weightKg,                  // NEW
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ClinicPatient;

  factory ClinicPatient.fromJson(Map<String, dynamic> json) =>
      _$ClinicPatientFromJson(json);
}
```

#### CreateClinicPatientInput Model
```dart
@freezed
class CreateClinicPatientInput with _$CreateClinicPatientInput {
  const factory CreateClinicPatientInput({
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,                                    // NEW
    String? gender,
    String? address1,                            // NEW
    String? address2,                            // NEW
    String? district,                            // NEW
    String? state,                               // NEW
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,     // NEW
    @JsonKey(name: 'alcohol_use') String? alcoholUse,           // NEW
    @JsonKey(name: 'height_cm') int? heightCm,                  // NEW
    @JsonKey(name: 'weight_kg') int? weightKg,                  // NEW
  }) = _CreateClinicPatientInput;

  factory CreateClinicPatientInput.fromJson(Map<String, dynamic> json) =>
      _$CreateClinicPatientInputFromJson(json);
}
```

### 2. Repository: `clinic_patient_repository.dart`

#### Updated createPatient Method
```dart
Future<CreateClinicPatientResponse?> createPatient({
  required String token,
  required String clinicId,
  required String firstName,
  required String lastName,
  required String phone,
  String? email,
  String? dateOfBirth,
  int? age,                    // NEW
  String? gender,
  String? address1,            // NEW
  String? address2,            // NEW
  String? district,            // NEW
  String? state,               // NEW
  String? moId,
  String? medicalHistory,
  String? allergies,
  String? bloodGroup,
  String? smokingStatus,       // NEW
  String? alcoholUse,          // NEW
  int? heightCm,               // NEW
  int? weightKg,               // NEW
}) async {
  // Implementation includes all new fields
}
```

## 💡 Usage Examples

### Example 1: Create Patient with All Details
```dart
final repository = ClinicPatientRepository(serviceRepo);

final response = await repository.createPatient(
  token: authToken,
  clinicId: clinicId,
  firstName: 'Safeer',
  lastName: 'Ameen',
  phone: '+91 476738737',
  email: 'safeer@example.com',
  age: 36,
  gender: 'Male',
  address1: '123 Main Street',
  address2: 'Apt 4B',
  district: 'Malappuram',
  state: 'Kerala',
  bloodGroup: 'O+',
  smokingStatus: 'No',
  alcoholUse: 'No',
  heightCm: 165,
  weightKg: 69,
  medicalHistory: 'No significant history',
  allergies: 'None known',
);

if (response != null) {
  print('Patient created: ${response.patient.fullName}');
  print('Age: ${response.patient.age}');
  print('District: ${response.patient.district}');
}
```

### Example 2: Create Patient with Minimal Details (Quick Registration)
```dart
final response = await repository.createPatient(
  token: authToken,
  clinicId: clinicId,
  firstName: 'John',
  lastName: 'Doe',
  phone: '+91 9876543210',
);
```

### Example 3: Update Patient Address and Measurements
```dart
final updatedPatient = await repository.updatePatient(
  token: authToken,
  patientId: patientId,
  updates: {
    'address1': '456 New Street',
    'address2': 'Suite 10',
    'district': 'Updated District',
    'state': 'Updated State',
    'height_cm': 166,
    'weight_kg': 70,
  },
);
```

### Example 4: Search Patients by District
```dart
final searchResults = await repository.searchPatients(
  token: authToken,
  clinicId: clinicId,
  searchQuery: 'Malappuram',  // Now searches address fields too!
);

if (searchResults != null) {
  for (var patient in searchResults.patients) {
    print('${patient.fullName} - ${patient.district}');
  }
}
```

## 🔍 Enhanced Search Functionality

The search now includes the new address fields:
- First name
- Last name  
- Phone number
- MO ID
- **Address 1** (NEW)
- **District** (NEW)
- **State** (NEW)

## ✅ Field Validation

### Integer Fields
- `age`: 0-150 (validated by backend)
- `heightCm`: 0-300 (validated by backend)
- `weightKg`: 0-500 (validated by backend)

### String Fields
All string fields are optional and have maximum length validation on backend:
- `address1`: max 200 characters
- `address2`: max 200 characters
- `district`: max 100 characters
- `state`: max 100 characters
- `smokingStatus`: max 20 characters
- `alcoholUse`: max 20 characters

## 🎯 API Endpoints

### POST `/clinic-specific-patients`
Create new patient with all fields

### GET `/clinic-specific-patients?clinic_id=uuid&search=term`
List/search patients (now searches address fields)

### GET `/clinic-specific-patients/:id`
Get single patient with all details

### PUT `/clinic-specific-patients/:id`
Update patient (all fields optional)

### DELETE `/clinic-specific-patients/:id`
Soft delete patient

## 📊 Response Example

```json
{
  "message": "Patient created successfully for this clinic",
  "patient": {
    "id": "uuid",
    "clinic_id": "clinic-uuid",
    "first_name": "Safeer",
    "last_name": "Ameen",
    "phone": "+91 476738737",
    "email": "safeer@example.com",
    "date_of_birth": "1988-01-01",
    "age": 36,
    "gender": "Male",
    "address1": "123 Main Street",
    "address2": "Apt 4B",
    "district": "Malappuram",
    "state": "Kerala",
    "mo_id": "CLINIC001",
    "medical_history": "No significant history",
    "allergies": "None known",
    "blood_group": "O+",
    "smoking_status": "No",
    "alcohol_use": "No",
    "height_cm": 165,
    "weight_kg": 69,
    "is_active": true,
    "created_at": "2024-01-01T10:00:00Z",
    "updated_at": "2024-01-01T10:00:00Z"
  }
}
```

## 🔄 Migration Notes

1. **Backward Compatible**: All new fields are optional, existing code continues to work
2. **Freezed Generated**: Run `dart run build_runner build` after model changes
3. **Existing Patients**: Will return null for new fields until updated
4. **Form Integration**: Forms can now capture and submit all patient details in one request

## 🚀 Next Steps

To fully integrate these fields into your UI:

1. **Update Patient Form**: Add UI fields for:
   - Age input
   - Address fields (address1, address2, district, state)
   - Lifestyle checkboxes/dropdowns (smoking, alcohol)
   - Physical measurement inputs (height, weight)

2. **Update ViewModel**: Modify patient creation/update logic to include new fields

3. **Update Patient Display**: Show new fields in patient details view

4. **Update Patient List**: Consider showing district/state in patient list items

5. **Update Search**: Leverage enhanced search to filter by location

## 🎨 UI Suggestions

### Patient Form Layout
```
┌─────────────────────────────────────┐
│ Personal Information                │
│ • First Name, Last Name             │
│ • Phone, Email                      │
│ • Age, Gender, Date of Birth        │
├─────────────────────────────────────┤
│ Address Information                 │
│ • Address Line 1                    │
│ • Address Line 2                    │
│ • District, State                   │
├─────────────────────────────────────┤
│ Medical Information                 │
│ • Blood Group, Allergies            │
│ • Medical History                   │
├─────────────────────────────────────┤
│ Lifestyle & Physical                │
│ • Smoking Status, Alcohol Use       │
│ • Height (cm), Weight (kg)          │
└─────────────────────────────────────┘
```

## ✨ Benefits

1. **Complete Patient Profile**: Capture all patient information in one go
2. **Better Search**: Find patients by location (district/state)
3. **Health Tracking**: Monitor patient measurements (height/weight)
4. **Lifestyle Awareness**: Track smoking and alcohol habits
5. **Flexible Forms**: Can use quick registration or full registration

## 📝 Notes

- All new fields are nullable and optional
- Backend validates ranges for numeric fields
- Search functionality automatically includes new address fields
- Update operations support partial updates (only changed fields)
- The API maintains full backward compatibility

