# Backend Fix: NULL mo_id Scan Error

## Issue
```
Request failed with status 404:
{
  "details": "sql: Scan error on column index 2, name \"mo_id\": converting NULL to string is unsupported",
  "error": "Appointment not found"
}
```

## Root Cause
The backend Go code is trying to scan a NULL database value into a Go `string` type, which is not supported. In Go, you need to use `sql.NullString` for nullable string columns.

## Location
File: `services/appointment-service/controllers/appointment_list_simple.controller.go`
Function: `GetSimpleAppointmentDetails()`

## Fix Required

### Current Code (Incorrect)
```go
type AppointmentSimple struct {
    ID                  string    `json:"id"`
    TokenNumber         string    `json:"token_number"`
    MoID                string    `json:"mo_id"`  // ❌ This can be NULL in DB
    BookingNumber       string    `json:"booking_number"`
    ConsultationType    string    `json:"consultation_type"`
    AppointmentDateTime string    `json:"appointment_date_time"`
    // ... other fields
}

// In the scan:
err := row.Scan(
    &appointment.ID,
    &appointment.TokenNumber,
    &appointment.MoID,  // ❌ Fails when NULL
    &appointment.BookingNumber,
    // ... other fields
)
```

### Fixed Code (Correct)
```go
type AppointmentSimple struct {
    ID                  string     `json:"id"`
    TokenNumber         *string    `json:"token_number,omitempty"`  // ✅ Use pointer for nullable
    MoID                *string    `json:"mo_id,omitempty"`         // ✅ Use pointer for nullable
    BookingNumber       *string    `json:"booking_number,omitempty"` // ✅ Use pointer for nullable
    ConsultationType    *string    `json:"consultation_type,omitempty"`
    AppointmentDateTime string     `json:"appointment_date_time"`
    DurationMinutes     *int       `json:"duration_minutes,omitempty"`
    SessionType         *string    `json:"session_type,omitempty"`
    Status              string     `json:"status"`
    FeeAmount           *float64   `json:"fee_amount,omitempty"`
    PaymentStatus       *string    `json:"payment_status,omitempty"`
    PaymentMethod       *string    `json:"payment_method,omitempty"`
    Notes               *string    `json:"notes,omitempty"`
    CancellationReason  *string    `json:"cancellation_reason,omitempty"`
    CreatedAt           string     `json:"created_at"`
    UpdatedAt           string     `json:"updated_at"`
    
    // Nested objects
    Patient    *PatientSimple    `json:"patient,omitempty"`
    Doctor     *DoctorSimple     `json:"doctor,omitempty"`
    Department *DepartmentSimple `json:"department,omitempty"`
    Clinic     *ClinicSimple     `json:"clinic,omitempty"`
    SlotDetails *SlotDetailsSimple `json:"slot_details,omitempty"`
}

// In the scan - use sql.NullString:
var (
    tokenNumber      sql.NullString
    moID             sql.NullString
    bookingNumber    sql.NullString
    consultationType sql.NullString
    durationMinutes  sql.NullInt64
    sessionType      sql.NullString
    feeAmount        sql.NullFloat64
    paymentStatus    sql.NullString
    paymentMethod    sql.NullString
    notes            sql.NullString
    cancellationReason sql.NullString
)

err := row.Scan(
    &appointment.ID,
    &tokenNumber,
    &moID,
    &bookingNumber,
    &consultationType,
    &appointment.AppointmentDateTime,
    &durationMinutes,
    &sessionType,
    &appointment.Status,
    &feeAmount,
    &paymentStatus,
    &paymentMethod,
    &notes,
    &cancellationReason,
    &appointment.CreatedAt,
    &appointment.UpdatedAt,
    // ... patient, doctor, department, clinic fields
)

if err != nil {
    return nil, fmt.Errorf("failed to scan appointment: %w", err)
}

// Convert sql.NullString to *string
if tokenNumber.Valid {
    appointment.TokenNumber = &tokenNumber.String
}
if moID.Valid {
    appointment.MoID = &moID.String
}
if bookingNumber.Valid {
    appointment.BookingNumber = &bookingNumber.String
}
if consultationType.Valid {
    appointment.ConsultationType = &consultationType.String
}
if durationMinutes.Valid {
    minutes := int(durationMinutes.Int64)
    appointment.DurationMinutes = &minutes
}
if sessionType.Valid {
    appointment.SessionType = &sessionType.String
}
if feeAmount.Valid {
    appointment.FeeAmount = &feeAmount.Float64
}
if paymentStatus.Valid {
    appointment.PaymentStatus = &paymentStatus.String
}
if paymentMethod.Valid {
    appointment.PaymentMethod = &paymentMethod.String
}
if notes.Valid {
    appointment.Notes = &notes.String
}
if cancellationReason.Valid {
    appointment.CancellationReason = &cancellationReason.String
}
```

## Alternative Solution: Using COALESCE in SQL

Instead of using `sql.NullString`, you can use SQL's `COALESCE` function to provide default values:

```sql
SELECT 
    a.id,
    COALESCE(a.token_number, '') as token_number,
    COALESCE(a.mo_id, '') as mo_id,
    COALESCE(a.booking_number, '') as booking_number,
    COALESCE(a.consultation_type, 'in-person') as consultation_type,
    a.appointment_date_time,
    COALESCE(a.duration_minutes, 15) as duration_minutes,
    COALESCE(a.session_type, '') as session_type,
    a.status,
    COALESCE(a.fee_amount, 0) as fee_amount,
    COALESCE(a.payment_status, 'pending') as payment_status,
    COALESCE(a.payment_method, '') as payment_method,
    COALESCE(a.notes, '') as notes,
    COALESCE(a.cancellation_reason, '') as cancellation_reason,
    -- ... rest of the query
```

This way, you can keep using regular `string` types in Go, and NULL values will be converted to empty strings.

## Recommended Approach

**Option 1: Use Pointers (Preferred)**
- ✅ More semantically correct (NULL = absent value)
- ✅ Frontend can distinguish between empty string and no value
- ✅ Follows JSON best practices with `omitempty`
- ❌ Slightly more code to handle pointers

**Option 2: Use COALESCE**
- ✅ Simpler Go code
- ✅ No null handling needed
- ❌ Cannot distinguish between empty string and NULL
- ❌ May provide misleading default values

## Testing

After fixing, test with:

```bash
curl -X GET "http://localhost:8080/api/v1/appointments/simple/{appointment_id}" \
  -H "Authorization: Bearer {token}"
```

Expected response:
```json
{
  "success": true,
  "appointment": {
    "id": "uuid",
    "token_number": "12345",
    "mo_id": null,  // ✅ Should work now
    "booking_number": "BK001",
    "consultation_type": "in-person",
    "appointment_date_time": "2024-10-17 10:30:00",
    // ... rest of fields
  }
}
```

## Frontend Compatibility

The Flutter frontend is already configured to handle nullable fields:

```dart
// From appointment_model.dart
class AppointmentDetails with _$AppointmentDetails {
  const factory AppointmentDetails({
    String? id,
    @JsonKey(name: "token_number") String? tokenNumber,
    @JsonKey(name: "mo_id") String? moId,  // ✅ Already nullable
    // ... all fields are nullable
  }) = _AppointmentDetails;
}
```

So once the backend is fixed to properly send `null` values (or use pointers with `omitempty`), the frontend will work correctly.

## Status
⚠️ **REQUIRES BACKEND FIX**

This is a backend issue that needs to be resolved in the Go appointment service. The frontend is already properly configured to handle nullable fields.

---
**Issue Identified**: October 18, 2025  
**Status**: Awaiting backend fix

