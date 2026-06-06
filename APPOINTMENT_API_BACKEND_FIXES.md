# Backend API Fixes & Requirements

This document outlines the required API response structures and recent fixes needed for the Appointment module to function correctly with the frontend.

## 1. Appointment List API

**Endpoint:** `GET /api/v1/appointments/simple-list`

### **Required Fix:**
The `clinic_patient_id` field must be included in each appointment object in the list. This ID is critical for navigating to the patient details and appointment details screens.

### **JSON Structure:**

```json
{
  "total": 10,
  "appointments": [
    {
      "id": "appt_12345",
      "clinic_patient_id": "cp_67890", // <--- CRITICAL: MUST BE PRESENT
      "clinic_id": "clinic_123",
      "doctor_id": "doc_456",
      "booking_number": "BK-2023-001",
      "token_number": 1,
      "appointment_date": "2023-10-27",
      "appointment_time": "09:00:00",
      "consultation_type": "clinic_visit",
      "status": "arrived",
      "patient_name": "John Doe",
      "doctor_name": "Dr. Smith"
      // ... other fields
    }
  ]
}
```

## 2. Appointment Detail API

**Endpoint:** `GET /api/v1/appointments/simple/:id`

### **Required Fix:**
The response must include `clinic_patient_id` and the new follow-up and renewal fields.

### **JSON Structure:**

```json
{
  "message": "Appointment details fetched successfully",
  "appointment": {
    "id": "appt_12345",
    "clinic_patient_id": "cp_67890", // <--- CRITICAL: MUST BE PRESENT
    "clinic_id": "clinic_123",
    "doctor_id": "doc_456",
    "booking_number": "BK-2023-001",
    "token_number": 1,
    "appointment_date": "2023-10-27",
    "appointment_time": "09:00:00",
    "consultation_type": "clinic_visit", // or "follow-up-via-clinic", etc.
    "status": "completed",
    "notes": "Patient complains of headache",
    "fee_amount": 50.0,
    "payment_status": "paid",
    // ... other fields
  },
  
  // --- NEW FIELDS FOR FOLLOW-UP SYSTEM ---
  
  "follow_up_info": { // Optional: Present if this appointment IS a follow-up or HAS a follow-up
    "id": "fu_123",
    "source_appointment_id": "appt_prev_123",
    "days_remaining": 5,
    "valid_until": "2023-11-03",
    "is_free": true
  },

  "clinic_patient_update": { // Optional: For syncing patient status
    "current_followup_status": "active",
    "last_appointment_id": "appt_12345"
  },

  "renewal_options": { // Optional: If renewal is possible
    "can_renew": true,
    "message": "Renewal available for $30",
    "previous_followup_id": "fu_000"
  },

  "is_regular_appointment": true, // Boolean flag
  "followup_granted": true,       // Boolean flag: if this appointment grants a follow-up
  "followup_valid_until": "2023-11-10" // Date string
}
```

## Summary of Changes

1.  **Missing `clinic_patient_id`**: Ensuring this field is returned in both list and detail views prevents "Patient ID not found" errors when navigating or performing actions like updating vitals.
2.  **Follow-up Logic**: The new fields (`follow_up_info`, `renewal_options`, etc.) are required for the "Free Follow-up" and "Renewal" features to work in the frontend.
3.  **Snake Case**: All JSON keys must typically be in **snake_case** (e.g., `clinic_patient_id`, not `clinicPatientId`) to match the Flutter `freezed` models.
