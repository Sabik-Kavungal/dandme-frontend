# Reschedule API - mo_id NULL Scan Error Fix

## Error
```
Request failed with status 500: {
  "details": "sql: Scan error on column index 2, name \"mo_id\": converting NULL to string is unsupported",
  "error": "Failed to retrieve updated appointment"
}
```

## Location
**File:** `services/appointment-service/controllers/appointment_list_simple.controller.go`  
**Function:** `RescheduleAppointmentDetails()` - After UPDATE, when retrieving the updated appointment

## Root Cause
After successfully updating the appointment, the API tries to retrieve and return the updated appointment details. During the SELECT query, it attempts to scan the `mo_id` column (which is NULL in the database) into a Go `string` type, which is not supported.

## The Issue

### Current Code (Incorrect)
```go
// After successful UPDATE transaction...
// Retrieve updated appointment to return to client
err = tx.QueryRow(`
    SELECT 
        a.id,
        a.token_number,
        a.mo_id,           -- ❌ NULL value
        a.booking_number,
        ...
    FROM appointments a
    WHERE a.id = $1
`, appointmentID).Scan(
    &appointment.ID,
    &appointment.TokenNumber,
    &appointment.MoID,  -- ❌ Trying to scan NULL into string - FAILS
    &appointment.BookingNumber,
    ...
)
```

## Solution

### Option 1: Use sql.NullString (Recommended)

```go
// Struct definition
type AppointmentSimple struct {
    ID           string  `json:"id"`
    TokenNumber  *int    `json:"token_number,omitempty"`
    MoID         *string `json:"mo_id,omitempty"`  // ✅ Use pointer
    BookingNumber *string `json:"booking_number,omitempty"`
    // ... other fields
}

// In the query scan
var (
    tokenNumber   sql.NullInt64
    moID          sql.NullString  // ✅ Use sql.NullString
    bookingNumber sql.NullString
)

err = tx.QueryRow(`
    SELECT 
        a.id,
        a.token_number,
        a.mo_id,
        a.booking_number,
        ...
    FROM appointments a
    WHERE a.id = $1
`, appointmentID).Scan(
    &appointment.ID,
    &tokenNumber,
    &moID,           // ✅ Scan into sql.NullString
    &bookingNumber,
    ...
)

if err != nil {
    tx.Rollback()
    return nil, fmt.Errorf("failed to retrieve updated appointment: %w", err)
}

// Convert sql.NullString to *string
if tokenNumber.Valid {
    tn := int(tokenNumber.Int64)
    appointment.TokenNumber = &tn
}
if moID.Valid {
    appointment.MoID = &moID.String
}
if bookingNumber.Valid {
    appointment.BookingNumber = &bookingNumber.String
}
```

### Option 2: Use COALESCE in SQL

```go
err = tx.QueryRow(`
    SELECT 
        a.id,
        COALESCE(a.token_number, 0) as token_number,
        COALESCE(a.mo_id, '') as mo_id,           -- ✅ NULL becomes empty string
        COALESCE(a.booking_number, '') as booking_number,
        COALESCE(a.consultation_type, 'offline') as consultation_type,
        a.appointment_date,
        a.appointment_time,
        COALESCE(a.duration_minutes, 15) as duration_minutes,
        COALESCE(a.session_type, '') as session_type,
        a.status,
        COALESCE(a.fee_amount, 0) as fee_amount,
        COALESCE(a.payment_status, 'pending') as payment_status,
        COALESCE(a.payment_method, '') as payment_method,
        COALESCE(a.notes, '') as notes,
        COALESCE(a.cancellation_reason, '') as cancellation_reason,
        a.created_at,
        -- Patient
        COALESCE(cp.first_name || ' ' || cp.last_name, '') as patient_name,
        -- Doctor  
        COALESCE(d.first_name || ' ' || d.last_name, '') as doctor_name,
        -- Department
        dept.name as department
    FROM appointments a
    LEFT JOIN clinic_patients cp ON a.patient_id = cp.id
    LEFT JOIN doctors d ON a.doctor_id = d.id
    LEFT JOIN departments dept ON a.department_id = dept.id
    WHERE a.id = $1
`, appointmentID).Scan(
    &appointment.ID,
    &appointment.TokenNumber,
    &appointment.MoID,  // ✅ Now receives empty string instead of NULL
    &appointment.BookingNumber,
    ...
)
```

## Which Solution to Use?

### Use Option 1 (sql.NullString) If:
- ✅ You want to distinguish between NULL and empty string
- ✅ You want proper JSON representation (`"mo_id": null` vs `"mo_id": ""`)
- ✅ You prefer type-safe code
- ✅ You want to follow Go best practices

### Use Option 2 (COALESCE) If:
- ✅ You want simpler code
- ✅ You don't need to distinguish NULL from empty
- ✅ You want a quick fix with minimal code changes
- ✅ Empty strings are acceptable for missing data

## Testing After Fix

### Test Reschedule
```bash
curl -X POST "http://localhost:8082/api/v1/appointments/simple/APPOINTMENT_ID/reschedule" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "doctor_id": "DOCTOR_ID",
    "individual_slot_id": "SLOT_ID",
    "appointment_date": "2024-10-20",
    "appointment_time": "2024-10-20 10:30:00"
  }'
```

### Expected Response (Should Work Now)
```json
{
  "success": true,
  "message": "Appointment rescheduled successfully",
  "appointment": {
    "id": "appointment-id",
    "token_number": 1,
    "mo_id": null,  // ✅ Should work with Option 1
    // or
    "mo_id": "",    // ✅ Should work with Option 2
    "booking_number": "BK20241017001",
    "patient_name": "John Doe",
    "doctor_name": "Dr. Smith",
    "appointment_date_time": "2024-10-20T00:00:00Z 10:30:00",
    "status": "confirmed"
  }
}
```

## Frontend Compatibility

The Flutter frontend is already configured to handle both NULL and empty string:

```dart
// From AppointmentDetails model
@JsonKey(name: "mo_id") String? moId,  // ✅ Nullable

// Usage in UI
appointment?.moId ?? 'N/A'  // ✅ Handles null or empty
```

## Status
⚠️ **BACKEND FIX REQUIRED**

The reschedule API works correctly for updating the appointment, but fails when trying to return the updated appointment details due to the `mo_id` NULL scan error.

**Quick Fix:** Apply Option 2 (COALESCE) in the SELECT query after UPDATE  
**Proper Fix:** Apply Option 1 (sql.NullString) for all nullable columns

---

**Error Location:** After successful reschedule UPDATE, during SELECT to return updated appointment  
**Cause:** `mo_id` column contains NULL, cannot scan into Go string  
**Solution:** Use `sql.NullString` or `COALESCE` in SELECT query  
**Status:** ⚠️ Backend fix needed

**Date:** October 18, 2025


