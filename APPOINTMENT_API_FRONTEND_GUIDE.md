# Frontend Integration Guide: Appointment Service Updates

This document outlines the changes made to the Appointment Service APIs and the required updates for the frontend application (Flutter/React).

## 1. Appointment List (`GET /api/v1/appointments/simple-list`)

### Changes
- **New Field**: `clinic_patient_id` matches the patient's ID in the context of the clinic.

### Required Frontend Update
Update your Appointment List Item model to include `clinic_patient_id`. This ID is required when navigating to the **Patient Details** or **Vitals** screens from the list.

**JSON Response Example:**
```json
{
  "appointments": [
    {
      "id": "appt_123",
      "clinic_patient_id": "cp_456",  // <-- NEW CRITICAL FIELD
      "patient_name": "John Doe",
      "status": "scheduled",
      "payment_status": "paid",
      // ... other existing fields
    }
  ]
}
```

---

## 2. Appointment Details (`GET /api/v1/appointments/simple/:id`)

### Changes
The details API has been significantly enhanced to support the **Follow-up System**.

### Required Frontend Update
Update your Appointment Details model to handle the following new objects. All new objects are **optional** (nullable), so check for `null` before accessing properties.

#### New Response Structure

```json
{
  "success": true,
  "appointment": {
    "id": "appt_123",
    "clinic_patient_id": "cp_456", // <-- NEW CRITICAL FIELD
    // ... existing appointment fields
  },
  
  // 1. Follow-Up Info (Present if active follow-up exists)
  "follow_up_info": {
    "id": "fu_789",
    "days_remaining": 4,
    "valid_until": "2023-10-30",
    "is_free": true
  },

  // 2. Renewal Options (Present if an expired follow-up exists)
  "renewal_options": {
    "can_renew": true,
    "message": "Renewal available",
    "previous_followup_id": "fu_old_123"
  },

  // 3. Status Flags
  "is_regular_appointment": true,  // True if visit, video, or in-person
  "followup_granted": true,        // True if this appointment granted a free follow-up
  "followup_valid_until": "2023-11-05"
}
```

### UI Logic Updates

1.  **Patient Navigation**:
    *   Use `appointment.clinic_patient_id` when clicking on the patient name or "View Patient" button.

2.  **Follow-up Status Display**:
    *   If `follow_up_info` is present AND `is_free` is `true`:
        *   Show a badge: **"Free Follow-up Available"**.
        *   Display: "Expires in `days_remaining` days (`valid_until`)".

3.  **Renewal Flow**:
    *   If `renewal_options` is present AND `can_renew` is `true`:
        *   Show a **"Renew Follow-up"** button.
        *   Action: Call the booking API with `consultation_type = "follow_up"` (logic depends on your booking flow).

4.  **Completed Appointment View**:
    *   If `followup_granted` is `true`:
        *   Show message: "This visit granted a free follow-up valid until `followup_valid_until`".
