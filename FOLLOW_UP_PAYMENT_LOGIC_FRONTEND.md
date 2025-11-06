# Follow-Up Payment Logic - Frontend Implementation ✅

## 🎯 **Core Rule**

**Payment section HIDDEN only for FREE follow-ups**
**Payment section SHOWN for everything else (regular appointments + PAID follow-ups)**

---

## ✅ **How It Works**

### Backend Response Structure:

```json
{
  "eligible_follow_ups": [
    {
      "doctor_id": "doctor-a",
      "doctor_name": "Dr. Smith",
      "department": "Cardiology",
      "remaining_days": 3
    }
  ]
}
```

**Key Point:** The `eligible_follow_ups[]` array **ONLY contains FREE follow-ups!**

- ✅ In array → FREE (within 5 days + first time)
- ❌ Not in array → PAID (free already used OR expired)

---

## 📊 **Frontend Logic**

### Payment Section Visibility:

```dart
// ✅ HIDE payment ONLY if:
// 1. User selected follow-up type
// 2. Patient is in eligible_follow_ups for selected doctor+department

if (viewModel.selectedConsultationType.startsWith('follow-up') &&
    viewModel.selectedClinicPatient != null &&
    viewModel.selectedDoctorObject != null &&
    viewModel.selectedClinicPatient!.isEligibleFor(
      doctorId: viewModel.selectedDoctorObject!.doctorId!,
      departmentId: viewModel.selectedDepartmentId,
    )) {
  // ✅ This is a FREE follow-up
  hidePaymentSection();
  showMessage('🎉 FREE Follow-Up');
} else {
  // ⚠️ Regular appointment OR PAID follow-up
  showPaymentSection();
}
```

---

## 🧪 **Test Scenarios**

### Scenario 1: FREE Follow-Up ✅

**Patient Data:**
```json
{
  "eligible_follow_ups": [
    { "doctor_id": "doctor-a", "department": "Cardiology" }
  ]
}
```

**User Action:**
- Selects: Follow-Up (Clinic), Doctor A, Cardiology

**Frontend Check:**
```dart
patient.isEligibleFor(doctorId: "doctor-a", departmentId: "cardiology")
  → Returns: true ✅
```

**Result:**
- ❌ Payment section **HIDDEN**
- ✅ Shows "Book FREE Follow-Up" button
- ✅ API call WITHOUT payment_method

---

### Scenario 2: PAID Follow-Up (Free Already Used) ⚠️

**Patient Data:**
```json
{
  "appointments": [
    {
      "doctor_id": "doctor-a",
      "department": "Cardiology",
      "status": "active",
      "free_follow_up_used": true,
      "note": "Free follow-up already used..."
    }
  ],
  "eligible_follow_ups": []  // ❌ Empty! Not eligible for FREE
}
```

**User Action:**
- Selects: Follow-Up (Clinic), Doctor A, Cardiology

**Frontend Check:**
```dart
patient.isEligibleFor(doctorId: "doctor-a", departmentId: "cardiology")
  → Returns: false ❌ (not in eligible_follow_ups)
```

**Result:**
- ✅ Payment section **SHOWN**
- ⚠️ Shows "Book Follow-Up (₹200)" button
- ✅ API call WITH payment_method required

---

### Scenario 3: PAID Follow-Up (Expired) ⚠️

**Patient Data:**
```json
{
  "appointments": [
    {
      "doctor_id": "doctor-a",
      "department": "Cardiology",
      "days_since": 10,
      "status": "expired",
      "note": "Follow-up period expired..."
    }
  ],
  "eligible_follow_ups": []  // ❌ Empty! Expired
}
```

**User Action:**
- Selects: Follow-Up (Clinic), Doctor A, Cardiology

**Frontend Check:**
```dart
patient.isEligibleFor(doctorId: "doctor-a", departmentId: "cardiology")
  → Returns: false ❌ (not in eligible_follow_ups)
```

**Result:**
- ✅ Payment section **SHOWN**
- ⚠️ Shows "Book Follow-Up (₹200)" button
- ✅ API call WITH payment_method required

---

### Scenario 4: Multiple FREE Follow-Ups ✅

**Patient Data:**
```json
{
  "eligible_follow_ups": [
    { "doctor_id": "doctor-a", "department": "Cardiology" },
    { "doctor_id": "doctor-b", "department": "Cardiology" },
    { "doctor_id": "doctor-c", "department": "Neurology" }
  ]
}
```

**User Actions:**

#### Action A: Select Doctor A + Cardiology
```dart
patient.isEligibleFor("doctor-a", "cardiology") → true ✅
Result: Payment section HIDDEN (FREE)
```

#### Action B: Select Doctor B + Cardiology
```dart
patient.isEligibleFor("doctor-b", "cardiology") → true ✅
Result: Payment section HIDDEN (FREE)
```

#### Action C: Select Doctor D + Cardiology
```dart
patient.isEligibleFor("doctor-d", "cardiology") → false ❌
Result: Payment section SHOWN (not eligible)
```

---

## 📤 **API Request Examples**

### FREE Follow-Up Request:

```json
POST /api/appointments/simple
{
  "clinic_patient_id": "patient-uuid",
  "doctor_id": "doctor-a",
  "clinic_id": "clinic-uuid",
  "department_id": "cardiology-uuid",
  "individual_slot_id": "slot-uuid",
  "appointment_date": "2025-10-20",
  "appointment_time": "2025-10-20 10:00:00",
  "consultation_type": "follow-up-via-clinic"
  // ❌ NO payment_method - Backend auto-waives
}
```

**Backend Response:**
```json
{
  "message": "Appointment created successfully",
  "appointment": {
    "id": "apt-uuid",
    "payment_status": "waived",
    "fee_amount": 0
  }
}
```

---

### PAID Follow-Up Request:

```json
POST /api/appointments/simple
{
  "clinic_patient_id": "patient-uuid",
  "doctor_id": "doctor-a",
  "clinic_id": "clinic-uuid",
  "department_id": "cardiology-uuid",
  "individual_slot_id": "slot-uuid",
  "appointment_date": "2025-10-20",
  "appointment_time": "2025-10-20 10:00:00",
  "consultation_type": "follow-up-via-clinic",
  "payment_method": "pay_now",  // ✅ Required!
  "payment_type": "cash"
}
```

**Backend Response:**
```json
{
  "message": "Appointment created successfully",
  "appointment": {
    "id": "apt-uuid",
    "payment_status": "paid",
    "fee_amount": 200
  }
}
```

---

## ✅ **Decision Matrix**

| In `eligible_follow_ups`? | Payment Section | Button Text | Fee |
|---------------------------|----------------|-------------|-----|
| ✅ Yes | ❌ **HIDDEN** | "Book FREE Follow-Up" | ₹0 |
| ❌ No (used) | ✅ **SHOWN** | "Book Follow-Up (₹200)" | ₹200 |
| ❌ No (expired) | ✅ **SHOWN** | "Book Follow-Up (₹200)" | ₹200 |
| ❌ No (no appointment) | N/A | Show error | N/A |

---

## 🎨 **UI States**

### State 1: FREE Follow-Up 🎉
```
┌─────────────────────────────────────────────────────┐
│ 🟢 John Doe            [🔄 Free Follow-Up (2)]      │
│ 📞 +123456789                                        │
│ Dr. Smith • Cardiology • 3 days left                │
│ ✅ Free follow-up available                         │
├─────────────────────────────────────────────────────┤
│                                                      │
│ ❌ NO PAYMENT SECTION                               │
│                                                      │
│ [     Book FREE Follow-Up     ] ← Green button      │
└─────────────────────────────────────────────────────┘
```

### State 2: PAID Follow-Up (Used) ⚠️
```
┌─────────────────────────────────────────────────────┐
│ 🔵 John Doe                                         │
│ 📞 +123456789                                        │
│ Dr. Smith • Cardiology                              │
│ ⚠️ Free follow-up already used                     │
├─────────────────────────────────────────────────────┤
│ 💳 Payment Method:                                  │
│   ⚪ Pay Now                                        │
│     ⚪ Cash  ⚪ Card  ⚪ UPI                         │
│   ⚪ Pay Later                                      │
│   ⚪ Way Off                                        │
│                                                      │
│ [   Book Follow-Up (₹200)   ] ← Orange button      │
└─────────────────────────────────────────────────────┘
```

### State 3: PAID Follow-Up (Expired) 🕒
```
┌─────────────────────────────────────────────────────┐
│ 🔵 John Doe                                         │
│ 📞 +123456789                                        │
│ Dr. Smith • Cardiology                              │
│ 🕒 Free period expired (10 days ago)               │
├─────────────────────────────────────────────────────┤
│ 💳 Payment Method:                                  │
│   ⚪ Pay Now                                        │
│     ⚪ Cash  ⚪ Card  ⚪ UPI                         │
│   ⚪ Pay Later                                      │
│   ⚪ Way Off                                        │
│                                                      │
│ [   Book Follow-Up (₹200)   ] ← Orange button      │
└─────────────────────────────────────────────────────┘
```

---

## 🔑 **Key Implementation Details**

### Extension Method: `isEligibleFor()`

```dart
extension ClinicPatientExtension on ClinicPatient {
  /// Check if eligible for FREE follow-up with specific doctor+department
  bool isEligibleFor({required String doctorId, String? departmentId}) {
    return eligibleFollowUps.any(
      (followUp) =>
          followUp.doctorId == doctorId &&
          (departmentId == null || followUp.departmentId == departmentId),
    );
  }
}
```

**What it does:**
- Checks if the `eligible_follow_ups` array contains an entry for the specified doctor+department
- Returns `true` only if patient is eligible for **FREE** follow-up
- Returns `false` for PAID follow-ups or no eligibility

---

## 📋 **Complete Flow**

```
User selects patient
        ↓
Check: Follow-up type selected?
        ↓ YES
        ↓
Check: patient.isEligibleFor(selectedDoctor, selectedDept)?
        ↓
    YES ↓               NO ↓
        ↓                  ↓
  ❌ HIDE PAYMENT    ✅ SHOW PAYMENT
  🎉 FREE           ⚠️ PAID (₹200)
  Green button      Orange button
  No payment_method Payment required
```

---

## ✅ **Summary**

| Component | Implementation | Status |
|-----------|---------------|--------|
| **Data Source** | `eligible_follow_ups` array | ✅ From backend |
| **Validation** | `isEligibleFor()` extension method | ✅ Implemented |
| **Payment Visibility** | Check if in `eligible_follow_ups` | ✅ Implemented |
| **API Call** | Send payment only if NOT free | ✅ Implemented |
| **UI States** | Green (free), Orange (paid) | ✅ Implemented |

---

## 🚀 **Result**

**The system now correctly:**
- ✅ Hides payment for FREE follow-ups (in `eligible_follow_ups`)
- ✅ Shows payment for PAID follow-ups (not in `eligible_follow_ups`)
- ✅ Sends correct API request (with/without payment)
- ✅ Displays appropriate UI (green/orange buttons)

**Status: PRODUCTION READY!** 🎉

