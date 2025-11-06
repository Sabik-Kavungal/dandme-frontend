# ✅ Fraud Prevention: One Free Follow-Up Limit

## 🎯 Goal
Prevent patients from booking multiple free follow-ups with the same doctor and department. Each regular appointment grants **ONE** free follow-up only.

---

## 🛡️ **How It Works**

### **Rule: One Free Follow-Up Per Doctor+Department**

```
Oct 20: Regular appointment → Free follow-up granted ✅
Oct 22: Book 1st follow-up → FREE ✅
Oct 23: Try 2nd follow-up → MUST PAY ❌ (fraud prevention)
Oct 28: Book new regular → Free follow-up granted AGAIN ✅
Oct 29: Book follow-up → FREE ✅
```

---

## 🔧 **Implementation**

### **1. Model - Status Detection** (`clinic_patient_model.dart`)

**Added New Status: `'already_used'`**

```dart
String getFollowUpStatus({required String doctorId, String? departmentId}) {
  // Step 1: Check if in eligible_follow_ups (FREE)
  if (isEligibleFor(...)) {
    return 'free'; // 🟢 FREE
  }
  
  // Step 2.5: Check if free follow-up already used within validity period
  final latestAppointment = matchingAppointments.first;
  final withinWindow = latestAppointment.daysSince >= -7 && 
                       latestAppointment.daysSince <= 5;
  
  if (withinWindow && latestAppointment.freeFollowUpUsed) {
    return 'already_used'; // 🔴 ALREADY USED (fraud prevention)
  }
  
  // Step 3: Check if expired
  if (latestAppointment.daysSince > 5) {
    return 'paid_expired'; // 🟠 EXPIRED
  }
  
  // ...
}
```

**Location:** Lines 160-170

**Updated Label:**
```dart
String getFollowUpStatusLabel({required String doctorId, String? departmentId}) {
  switch (status) {
    case 'free':
      return '🟢 Free Follow-Up Eligible';
    case 'already_used':
      return '🔴 Free Follow-Up Already Used'; // ← NEW
    case 'paid_expired':
      return '🟠 Paid Follow-Up Required';
    case 'no_appointment':
      return '⚪ No Previous Appointment';
  }
}
```

**Location:** Lines 232-255

---

### **2. ViewModel - Validation** (`new_appointment_viewmodel.dart`)

**Enhanced Follow-Up Validation:**

```dart
bool _validateFollowUpEligibility(ClinicPatient patient) {
  // Get status
  final status = patient.getFollowUpStatus(
    doctorId: _selectedDoctorId!,
    departmentId: _selectedDepartmentId,
  );
  
  // FREE - allow without payment
  if (status == 'free') {
    print('✅ FREE Follow-up eligible!');
    return true;
  }
  
  // ALREADY USED - require payment (fraud prevention)
  if (status == 'already_used') {
    print('🔴 FRAUD PREVENTION: Free follow-up already used!');
    print('   💰 Payment: REQUIRED (one free follow-up limit)');
    return true; // ✅ Allow booking but require payment
  }
  
  // EXPIRED - require payment
  if (status == 'paid_expired') {
    print('⚠️ PAID follow-up: expired');
    return true;
  }
  
  // NO APPOINTMENT - block
  if (status == 'no_appointment') {
    _setError('Cannot book follow-up: No previous appointment');
    return false;
  }
}
```

**Location:** Lines 754-826

**Payment Enforcement:**

```dart
Future<SimpleAppointmentResponse?> createSimpleAppointment() async {
  // Check follow-up status
  final followUpStatus = _selectedClinicPatient!.getFollowUpStatus(
    doctorId: _selectedDoctorId!,
    departmentId: _selectedDepartmentId,
  );
  
  // Only hide payment if status is 'free'
  final isFreeFollowUp = isFollowUp && 
                        followUpStatus == 'free' &&
                        _selectedClinicPatient!.isEligibleFor(...);
  
  print('🔍 Follow-up validation:');
  print('   Is follow-up type: $isFollowUp');
  print('   Follow-up status: $followUpStatus');
  print('   Is FREE follow-up: $isFreeFollowUp');
  
  // ✅ Skip payment validation ONLY for FREE follow-ups
  if (!isFreeFollowUp) {
    // Validate payment is provided
    if (!isPaymentValid()) {
      _setError('Payment required');
      return null;
    }
  }
}
```

**Location:** Lines 903-926

---

### **3. UI - Color Coding** (`new_appointment_view.dart`)

**Patient Card Avatar Color:**

```dart
// Determine avatar color based on follow-up status
Color avatarColor;
final alreadyUsed = followUpStatus == 'already_used';

if (isFreeFollowUp) {
  avatarColor = Colors.green; // 🟢 FREE
} else if (alreadyUsed) {
  avatarColor = Colors.red; // 🔴 ALREADY USED (fraud prevention)
} else if (isPaidFollowUp) {
  avatarColor = Colors.orange; // 🟠 PAID
} else if (noAppointment) {
  avatarColor = Colors.grey; // ⚪ No appointment
} else {
  avatarColor = Colors.blue; // Regular appointment
}
```

**Location:** Lines 709-723

**Status Text Color:**

```dart
// Color based on status
Color textColor;
switch (status) {
  case 'free':
    textColor = Colors.green[700]!;
    break;
  case 'already_used':
    textColor = Colors.red[700]!; // ← NEW: Red for fraud prevention
    break;
  case 'paid_expired':
    textColor = Colors.orange[700]!;
    break;
  case 'no_appointment':
    textColor = Colors.grey[700]!;
    break;
}
```

**Location:** Lines 788-803

---

## 📊 **Status Summary**

| Status | Color | Label | Payment Required | Can Book |
|--------|-------|-------|------------------|----------|
| `free` | 🟢 Green | Free Follow-Up Eligible | ❌ No | ✅ Yes |
| `already_used` | 🔴 Red | Free Follow-Up Already Used | ✅ Yes | ✅ Yes |
| `paid_expired` | 🟠 Orange | Paid Follow-Up Required | ✅ Yes | ✅ Yes |
| `no_appointment` | ⚪ Grey | No Previous Appointment | ❌ N/A | ❌ No |

---

## 🧪 **Test Scenario**

### **Step 1: Book Regular Appointment**
```
Patient: John Doe
Doctor: Dr. Amal
Department: Cardiology
Type: Clinic Visit
Payment: Required
```

**Expected:**
- ✅ Appointment created
- ✅ Follow-up granted (valid until +5 days)
- ✅ Patient status → 🟢 "Free Follow-Up Eligible"

---

### **Step 2: Book First Follow-Up (FREE)**
```
Patient: John Doe (same)
Doctor: Dr. Amal (same)
Department: Cardiology (same)
Type: Follow-Up (Clinic)
Payment: NONE (hidden)
```

**Expected:**
- ✅ Appointment created
- ✅ Payment = 0 (waived)
- ✅ Follow-up marked as "used" in database

---

### **Step 3: Try Second Follow-Up (FRAUD PREVENTION)**
```
Patient: John Doe (same)
Doctor: Dr. Amal (same)
Department: Cardiology (same)
Type: Follow-Up (Clinic)
```

**Expected:**
- 🔴 Patient card shows RED avatar
- 🔴 Status: "Free Follow-Up Already Used"
- ✅ Payment section SHOWN (required)
- ✅ Can book only if payment provided
- ❌ Cannot book FREE (fraud prevention)

**Console Output:**
```
🔴 FRAUD PREVENTION: Free follow-up already used!
   Patient: John Doe
   Has previous appointment: YES
   Status: already_used
   💰 Payment: REQUIRED (one free follow-up limit)
   ℹ️ Patient can book another FREE follow-up after booking a new regular appointment
```

---

### **Step 4: Renewal - Book Another Regular**
```
Patient: John Doe (same)
Doctor: Dr. Amal (same)
Department: Cardiology (same)
Type: Clinic Visit
Payment: Required
```

**Expected:**
- ✅ Appointment created
- ✅ NEW follow-up granted (old one marked as "renewed")
- ✅ Patient status → 🟢 "Free Follow-Up Eligible" (RESET!)

---

### **Step 5: Book Follow-Up Again (FREE)**
```
Patient: John Doe (same)
Doctor: Dr. Amal (same)
Department: Cardiology (same)
Type: Follow-Up (Clinic)
Payment: NONE (hidden)
```

**Expected:**
- ✅ Appointment created FREE
- ✅ Payment = 0 (waived)
- ✅ Cycle repeats!

---

## 🔍 **How to Verify**

### **Frontend Console:**
```
🔍 Follow-up validation:
   Is follow-up type: true
   Follow-up status: already_used        ← Key indicator!
   Is FREE follow-up: false              ← Payment required

🔴 FRAUD PREVENTION: Free follow-up already used!
   💰 Payment: REQUIRED (one free follow-up limit)
```

### **UI Indicators:**
- 🔴 **RED** avatar on patient card
- 🔴 **"Free Follow-Up Already Used"** label
- ✅ Payment section **VISIBLE**
- ✅ Cannot book without payment

### **Database Check:**
```sql
SELECT * FROM follow_ups 
WHERE clinic_patient_id = 'patient-id'
  AND doctor_id = 'doctor-id'
  AND department_id = 'dept-id'
ORDER BY created_at DESC;

-- Expected for "already used" case:
-- status = 'used'
-- used_at = (timestamp)
-- No active follow-up available
```

---

## ✅ **Files Modified**

| File | Changes | Lines |
|------|---------|-------|
| `clinic_patient_model.dart` | Added 'already_used' status detection | 160-170, 232-255 |
| `new_appointment_viewmodel.dart` | Enhanced validation + payment enforcement | 754-826, 903-926 |
| `new_appointment_view.dart` | Red color for "already used" status | 709-723, 788-803 |

---

## 🎉 **Summary**

### **What Was Added:**

✅ **Status Detection**
- New `'already_used'` status for fraud prevention
- Checks if free follow-up was already consumed

✅ **Validation**
- Prevents multiple free follow-ups
- Requires payment for second follow-up

✅ **UI Indication**
- 🔴 RED avatar for "already used"
- Clear label: "Free Follow-Up Already Used"
- Payment section visible and required

✅ **Renewal Support**
- New regular appointment resets eligibility
- Patient can get FREE follow-up again

### **Fraud Prevention Active:**

- ❌ Cannot book multiple free follow-ups with same doctor+department
- ✅ Payment required for second follow-up within validity period
- ✅ Clear visual feedback (RED status)
- ✅ Automatic renewal with new regular appointment

---

## 🔐 **Security**

### **Frontend Validation:**
- ✅ Checks `already_used` status before booking
- ✅ Requires payment when free already used
- ✅ Clear error messages

### **Backend Validation:**
- ✅ `follow_ups` table tracks usage
- ✅ `status = 'used'` after free follow-up booked
- ✅ Only ONE active free follow-up per doctor+department
- ✅ Database constraints enforce limits

**Fraud Prevention: ACTIVE! 🛡️**

---

**Last Updated:** October 20, 2025  
**Status:** ✅ **IMPLEMENTED & TESTED**  
**Security:** 🛡️ **FRAUD PREVENTION ACTIVE**


