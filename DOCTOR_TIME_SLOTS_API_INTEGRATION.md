# Doctor Time Slots API Integration

## Overview
This document describes the integration of the doctor time slots API endpoint in the clinic module's new appointment section.

## API Endpoint
```
GET http://localhost:8081/api/organizations/doctor-time-slots
```

### Query Parameters
- `doctor_id` - UUID of the doctor (required)
- `clinic_id` - UUID of the clinic (required)
- `only_active` - Boolean to filter active slots only (default: true)
- `slot_type` - Filter by slot type: 'online' or 'offline' (optional)
- `day_of_week` - Filter by day of week (1-7) (optional)

### Response Structure
```json
{
  "time_slots": [
    {
      "id": "4219f703-7326-41cc-b239-c4729b8d5d52",
      "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
      "doctor_name": "mmman ggg",
      "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
      "clinic_name": "alamala",
      "day_of_week": 2,
      "day_name": "Tuesday",
      "slot_type": "online",
      "start_time": "09:00",
      "end_time": "17:00",
      "is_active": true,
      "max_patients": 10,
      "created_at": "2025-10-11T19:22:00.806407Z",
      "updated_at": "2025-10-11T19:22:00.806407Z"
    }
  ],
  "total_count": 2
}
```

## Implementation Details

### 1. Model Layer
**File:** `lib/modules/clinic/models/doctor_time_slot_model.dart`

The following models are defined:
- `DoctorTimeSlotResponse` - Full time slot information from API
- `AvailableSlot` - Simplified slot model for UI
- `ListTimeSlotsResponse` - Response wrapper for list endpoint

### 2. Repository Layer
**File:** `lib/modules/clinic/repositories/doctor_time_slot_repository.dart`

Key method: `listTimeSlots()`
```dart
Future<ListTimeSlotsResponse?> listTimeSlots({
  required String token,
  String? doctorId,
  String? clinicId,
  int? dayOfWeek,
  String? slotType,
  bool onlyActive = true,
})
```

This method:
- Builds query parameters dynamically
- Calls the `organizations/doctor-time-slots` endpoint
- Returns parsed `ListTimeSlotsResponse`

### 3. ViewModel Layer
**File:** `lib/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart`

Key method: `loadDoctorTimeSlots(String doctorId)`

**Updated Flow:**
1. Fetches time slots using `listTimeSlots()` method
2. Converts `DoctorTimeSlotResponse` to `AvailableSlot` format
3. Filters slots based on selected consultation type (online/offline)
4. Groups slots by day of week for UI display
5. Updates the `_doctorTimeSlots` list and notifies UI

**Key Features:**
- Automatically filters by consultation type (online vs offline)
- Only shows active time slots
- Uses logged-in user's clinic ID
- Provides detailed debug logging
- Handles empty states gracefully

### 4. View Layer
**File:** `lib/modules/clinic/views/appointments/new_appointment_view.dart`

The view displays time slots in two ways:
- **Web Layout:** `_buildDynamicTimeSlotSections()`
- **Mobile Layout:** `_buildDynamicMobileTimeSlotSections()`

Both layouts:
- Group slots by day name (Monday, Tuesday, etc.)
- Display time ranges (e.g., "09:00 - 17:00")
- Show loading indicator while fetching
- Display helpful message when no slots available

## User Flow

1. **Select Doctor:** When a doctor is selected from the dropdown:
   - `setDoctor(String doctor)` is called
   - Doctor ID is extracted from `_clinicDoctors` list
   - `loadDoctorTimeSlots(doctorId)` is triggered automatically

2. **Change Consultation Type:** When switching between online/offline:
   - `setConsultationType(String type)` is called
   - Time slots are reloaded and filtered
   - Only matching slot types are displayed

3. **View Time Slots:** The UI displays:
   - Day-wise grouped time slots
   - Start and end times
   - Loading state during API call
   - Empty state with helpful message

## Slot Type Mapping

The system maps consultation types to slot types:

| Consultation Type | Slot Type |
|-------------------|-----------|
| `video`           | `online`  |
| `online`          | `online`  |
| `in-person`       | `offline` |
| `walk-in`         | `offline` |

This mapping is handled in the `slotType` getter in the ViewModel.

## Error Handling

The implementation includes comprehensive error handling:
- Authentication token validation
- Null safety checks
- Try-catch blocks with detailed logging
- User-friendly error messages
- Graceful empty state handling

## Testing the Integration

To test the API integration:

1. **Select a Doctor:**
   - Open new appointment screen
   - Choose a doctor from the dropdown
   - Console will show debug logs

2. **Change Consultation Type:**
   - Switch between "Video" and "In-Person"
   - Time slots should update automatically
   - Only matching slot types will appear

3. **Verify Data:**
   - Check console logs for API calls
   - Verify correct doctor_id and clinic_id are sent
   - Confirm response parsing is successful

## Console Debug Logs

The implementation provides detailed console logs:
```
╔════════════════════════════════════════════════════════════════╗
║     LOADING DOCTOR TIME SLOTS                                  ║
╚════════════════════════════════════════════════════════════════╝
👨‍⚕️ Doctor ID: 3fd28e6d-7f9a-4dde-8172-d14a74a9b02d
🏥 Clinic ID: 7a6c1211-c029-4923-a1a6-fe3dfe48bdf2
🎯 Slot Type: online

📊 Total slots fetched: 2
   Total converted slots: 2
   Offline: 1
   Online: 1
🎯 Filtered slots for online: 1
✅ Loaded 1 time slots for NEW APPOINTMENT
📅 Slots grouped by day:
   Tuesday: 1 slots
      • 09:00 - 17:00 (online)
```

## Future Enhancements

Potential improvements:
1. Date-based filtering for specific appointment dates
2. Real-time availability checking
3. Slot capacity indicator (showing remaining spots)
4. Time slot booking lock/unlock mechanism
5. Recurring slot pattern visualization

## Related Files

- Model: `lib/modules/clinic/models/doctor_time_slot_model.dart`
- Repository: `lib/modules/clinic/repositories/doctor_time_slot_repository.dart`
- ViewModel: `lib/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart`
- View: `lib/modules/clinic/views/appointments/new_appointment_view.dart`

