# Add Follow-Up Info to Appointment List API

## Current Status

The appointment list API currently returns:
```json
{
  "appointments": [
    {
      "id": "...",
      "appointment_date_time": "...",
      "status": "...",
      "fee_amount": 0.00,
      "payment_status": "...",
      "patient_name": "...",
      "doctor_name": "..."
    }
  ]
}
```

## What Needs to Be Added

Add `follow_up_info` and `renewal_options` to each appointment:

```json
{
  "appointments": [
    {
      "id": "...",
      "appointment_date_time": "...",
      "status": "...",
      "fee_amount": 0.00,
      "payment_status": "...",
      "patient_name": "...",
      "doctor_name": "...",
      
      // ✅ NEW: Follow-up info
      "follow_up_info": {
        "has_followup": true,
        "is_free": true,
        "followup_id": "fup-xxx",
        "valid_until": "2025-01-30",
        "days_remaining": 3,
        "status": "active"
      },
      
      // ✅ NEW: Renewal options
      "renewal_options": {
        "can_renew": true,
        "previous_followup_id": "fup-old",
        "renewal_message": "Book new regular appointment to get free follow-up"
      }
    }
  ]
}
```

## Implementation Steps

### 1. Update Struct in `appointment_list_simple.controller.go`

Add new fields:
```go
type FollowUpInfo struct {
    HasFollowUp    bool   `json:"has_followup"`
    IsFree         bool   `json:"is_free"`
    FollowupID     string `json:"followup_id,omitempty"`
    ValidUntil     string `json:"valid_until,omitempty"`
    DaysRemaining  int    `json:"days_remaining,omitempty"`
    Status         string `json:"status,omitempty"`
}

type RenewalOptions struct {
    CanRenew       bool   `json:"can_renew"`
    PreviousFollowupID string `json:"previous_followup_id,omitempty"`
    RenewalMessage string `json:"renewal_message,omitempty"`
}

type AppointmentListItem struct {
    // ... existing fields ...
    FollowUpInfo   *FollowUpInfo   `json:"follow_up_info,omitempty"`
    RenewalOptions *RenewalOptions `json:"renewal_options,omitempty"`
}
```

### 2. Query Follow-Up Data

For each appointment, query the follow_ups table:

```go
func populateFollowUpInfo(appointment *AppointmentListItem, db *sql.DB) error {
    // Query follow_ups table for this appointment
    query := `
        SELECT 
            follow_up_id,
            status,
            is_free,
            valid_until,
            used_appointment_id
        FROM follow_ups
        WHERE source_appointment_id = $1
        AND status = 'active'
        ORDER BY created_at DESC
        LIMIT 1
    `
    
    var followUpID, status string
    var isFree bool
    var validUntil sql.NullString
    
    err := db.QueryRow(query, appointment.ID).Scan(
        &followUpID, &status, &isFree, &validUntil,
    )
    
    if err != nil && err != sql.ErrNoRows {
        return err
    }
    
    if err == nil {
        // Found active follow-up
        appointment.FollowUpInfo = &FollowUpInfo{
            HasFollowUp: true,
            IsFree: isFree,
            FollowupID: followUpID,
            ValidUntil: validUntil.String,
            Status: status,
        }
        
        // Calculate days remaining
        if validUntil.Valid {
            days := calculateDaysRemaining(validUntil.String)
            appointment.FollowUpInfo.DaysRemaining = days
        }
    }
    
    return nil
}
```

### 3. Check for Renewal Opportunities

```go
func populateRenewalOptions(appointment *AppointmentListItem, db *sql.DB) error {
    // Check if this is a regular appointment (not follow-up)
    if strings.Contains(appointment.ConsultationType, "follow-up") {
        return nil // Not applicable for follow-up appointments
    }
    
    // Check if patient has expired follow-ups for this doctor+department
    query := `
        SELECT follow_up_id
        FROM follow_ups
        WHERE clinic_patient_id = $1
        AND doctor_id = $2
        AND department_id = $3
        AND status = 'expired'
        ORDER BY valid_until DESC
        LIMIT 1
    `
    
    var expiredFollowupID sql.NullString
    err := db.QueryRow(query, 
        appointment.PatientID, 
        appointment.DoctorID,
        appointment.DepartmentID,
    ).Scan(&expiredFollowupID)
    
    if err == nil && expiredFollowupID.Valid {
        appointment.RenewalOptions = &RenewalOptions{
            CanRenew: true,
            PreviousFollowupID: expiredFollowupID.String,
            RenewalMessage: "You have an expired follow-up. Book this appointment to get a new free follow-up!",
        }
    }
    
    return nil
}
```

### 4. Call in Main Query Loop

```go
// In your main appointment listing function
for _, appointment := range appointments {
    // Populate follow-up info
    if err := populateFollowUpInfo(&appointment, db); err != nil {
        log.Printf("Error populating follow-up info: %v", err)
    }
    
    // Populate renewal options
    if err := populateRenewalOptions(&appointment, db); err != nil {
        log.Printf("Error populating renewal options: %v", err)
    }
}
```

## Helper Functions

```go
func calculateDaysRemaining(validUntil string) int {
    validDate, err := time.Parse("2006-01-02", validUntil)
    if err != nil {
        return 0
    }
    
    now := time.Now()
    diff := validDate.Sub(now)
    
    if diff < 0 {
        return 0 // Expired
    }
    
    return int(diff.Hours() / 24)
}
```

## Testing

After implementation, test with:

```bash
GET /api/appointments/simple-list?clinic_id={id}

# Verify response includes:
{
  "appointments": [
    {
      "id": "...",
      "follow_up_info": {
        "has_followup": true,
        "is_free": true,
        "days_remaining": 3
      },
      "renewal_options": {
        "can_renew": true
      }
    }
  ]
}
```

---

## Estimated Work

- **Time:** 2-3 hours
- **Files to Modify:** 2-3 files
- **Complexity:** Low-Medium
- **Risk:** Low (additive changes)

## Priority

- **Required for Core Functionality:** ❌ NO (nice-to-have)
- **User Value:** Medium (better UX)
- **Can be added later:** ✅ YES

---

**Recommendation:** The appointment list API is working fine without this. This is an optional enhancement that can be added when convenient. The core follow-up tracking is already complete in the patient API. ✅
