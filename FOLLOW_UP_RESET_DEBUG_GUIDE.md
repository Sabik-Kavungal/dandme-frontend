# Follow-Up Reset - Debug & Testing Guide 🔍

## 🎯 **Issue**

Patient search card shows **RED** (or wrong color) even after booking new regular appointment that should reset eligibility.

---

## ✅ **Debug Steps**

### Step 1: Check Console Logs

When you search for a patient, you should see these logs:

```
🔍 Searching patients with context:
   Query: "John Doe"
   Doctor ID: doctor-abc-uuid       ← MUST be present!
   Department ID: cardiology-uuid   ← MUST be present!

╔════════════════════════════════════════════════════════════════╗
║     SEARCHING CLINIC PATIENTS (WITH CONTEXT)                   ║
╚════════════════════════════════════════════════════════════════╝
🏥 Clinic ID: clinic-uuid
🔍 Search: "John Doe"
👨‍⚕️ Doctor Context: doctor-abc-uuid
🏢 Department Context: cardiology-uuid

✅ Found 1 patients

🔍 getFollowUpStatus called:
   doctorId: doctor-abc-uuid
   departmentId: cardiology-uuid
   eligibleFollowUps.length: 1        ← Should be 1 if eligible!
   appointments.length: 3
   🔍 isEligibleFor: Checking eligibleFollowUps array...
      [0] doctorId: doctor-abc-uuid, departmentId: cardiology-uuid
         Match doctor: true
         Match dept: true
   → isEligibleFor result: true       ← Should be TRUE!
   → Status: FREE ✅                   ← Should say FREE!
```

---

### Step 2: Verify API Response

Open your browser's **Network tab** and check the API response:

**Request:**
```
GET /api/organizations/clinic-specific-patients
  ?clinic_id=xxx
  &doctor_id=doctor-abc-uuid          ← VERIFY THIS IS SENT!
  &department_id=cardiology-uuid      ← VERIFY THIS IS SENT!
  &search=John
```

**Response (Should include):**
```json
{
  "patients": [
    {
      "id": "patient-uuid",
      "first_name": "John",
      "last_name": "Doe",
      "appointments": [
        {
          "appointment_id": "new-apt",
          "appointment_date": "2025-10-15",
          "doctor_id": "doctor-abc-uuid",
          "department_id": "cardiology-uuid",
          "status": "active",
          "free_follow_up_used": false   ← Should be FALSE!
        }
      ],
      "eligible_follow_ups": [          ← KEY: Should have entry!
        {
          "doctor_id": "doctor-abc-uuid",
          "department_id": "cardiology-uuid",
          "remaining_days": 4
        }
      ]
    }
  ]
}
```

**If `eligible_follow_ups` is EMPTY, the backend didn't detect the reset!**

---

### Step 3: Common Issues

#### Issue A: Backend Not Returning `eligible_follow_ups`

**Symptom:**
```json
{
  "eligible_follow_ups": []  // Empty!
}
```

**Cause:**
- Backend might not be deployed with the reset logic
- Last regular appointment is > 5 days old
- Free follow-up was already used for the NEW appointment

**Solution:**
- Redeploy backend services
- Check appointment dates in database

---

#### Issue B: Frontend Not Passing `doctor_id`

**Symptom:**
```
🔍 Searching patients with context:
   Doctor ID: null           ← PROBLEM!
   Department ID: null       ← PROBLEM!
```

**Cause:**
- Doctor or department not selected before search
- `selectedDoctorObject` is null

**Solution:**
- Ensure doctor is selected before patient search
- Check that `viewModel.selectedDoctorObject` is not null

---

#### Issue C: Doctor ID Mismatch

**Symptom:**
```
🔍 isEligibleFor: Checking eligibleFollowUps array...
   [0] doctorId: doctor-abc-uuid, departmentId: cardiology-uuid
      Match doctor: false  ← PROBLEM!
```

**Cause:**
- Selected doctor ID doesn't match backend data
- Using wrong ID field (id vs doctorId)

**Solution:**
- Log both `selectedDoctorObject.id` and `selectedDoctorObject.doctorId`
- Use the correct one that matches backend

---

#### Issue D: Department ID Mismatch

**Symptom:**
```
🔍 isEligibleFor: Checking eligibleFollowUps array...
   [0] doctorId: doctor-abc-uuid, departmentId: cardiology-uuid
      Match doctor: true
      Match dept: false  ← PROBLEM!
```

**Cause:**
- Selected department ID doesn't match backend
- Using department name instead of ID

**Solution:**
- Ensure `selectedDepartmentId` is the UUID, not the name
- Check department selection logic

---

## 🧪 **Complete Test Scenario**

### Test: Reset After New Regular Appointment

**Step 1: Book First Regular Appointment**
```
1. Select: Clinic Visit, Dr. ABC, Cardiology
2. Select time slot
3. Select patient
4. Pay ₹500
5. Book appointment

Result: Appointment created (Oct 1)
```

**Step 2: Book First Follow-Up**
```
1. Select: Follow-Up (Clinic), Dr. ABC, Cardiology
2. Search patient: "John Doe"
   
Expected Logs:
✅ Found 1 patients
🔍 getFollowUpStatus called:
   eligibleFollowUps.length: 1
   → Status: FREE ✅

Expected UI:
🟢 John Doe
🟢 Free Follow-Up Eligible

3. Book follow-up

Result: FREE follow-up booked (Oct 2)
```

**Step 3: Try Second Follow-Up (Should be PAID)**
```
1. Search patient again: "John Doe"
   
Expected Logs:
✅ Found 1 patients
🔍 getFollowUpStatus called:
   eligibleFollowUps.length: 0  ← Empty (used)
   hasPreviousAppointment: true
   → Status: PAID_EXPIRED 🟠

Expected UI:
🟠 John Doe
🟠 Paid Follow-Up Required
Payment section: SHOWN

2. If user clicks book: Would require payment
```

**Step 4: Book NEW Regular Appointment (RESET!)**
```
1. Change to: Clinic Visit, Dr. ABC, Cardiology
2. Search patient: "John Doe"
3. Book appointment
4. Pay ₹500

Result: NEW regular appointment created (Oct 15)
```

**Step 5: Try Follow-Up Again (Should be FREE AGAIN!)**
```
1. Change to: Follow-Up (Clinic), Dr. ABC, Cardiology
2. Search patient: "John Doe"
   
Expected Logs:
🔍 Searching patients with context:
   Doctor ID: doctor-abc-uuid ✅
   Department ID: cardiology-uuid ✅

✅ Found 1 patients
🔍 getFollowUpStatus called:
   eligibleFollowUps.length: 1  ← Should be 1 now! (RESET!)
   isEligibleFor result: true
   → Status: FREE ✅

Expected UI:
🟢 John Doe                    ← Should be GREEN!
🟢 Free Follow-Up Eligible     ← Should show this!
Payment section: HIDDEN

3. Book follow-up

Result: FREE follow-up booked again! ✅ RESET WORKED!
```

---

## 🔧 **Quick Fixes**

### Fix 1: Ensure Doctor/Department Selected Before Search

```dart
// In your search widget
TextField(
  onChanged: (query) {
    // ✅ Check if doctor/department selected first
    if (viewModel.selectedDoctorObject == null) {
      showError('Please select a doctor first');
      return;
    }
    
    if (viewModel.selectedDepartmentId == null) {
      showError('Please select a department first');
      return;
    }
    
    // ✅ Now search
    viewModel.searchClinicPatients(query);
  },
);
```

### Fix 2: Force Refresh After Booking

```dart
Future<void> bookAppointment() async {
  // Book appointment...
  final result = await viewModel.createSimpleAppointment();
  
  if (result != null) {
    // ✅ Force refresh patient search to get updated eligibility
    if (viewModel.lastPatientSearchQuery.isNotEmpty) {
      await viewModel.searchClinicPatients(
        viewModel.lastPatientSearchQuery,
      );
    }
    
    showSuccess('Appointment booked!');
  }
}
```

### Fix 3: Check Backend Response

Add this temporary code to verify backend response:

```dart
final response = await _clinicPatientRepository.searchPatients(...);

// ✅ DEBUG: Print raw response
print('📤 API Response:');
print('   Total patients: ${response?.patients.length}');
if (response != null && response.patients.isNotEmpty) {
  final patient = response.patients[0];
  print('   Patient: ${patient.firstName} ${patient.lastName}');
  print('   Appointments: ${patient.appointments.length}');
  print('   Eligible Follow-Ups: ${patient.eligibleFollowUps.length}');
  
  for (var i = 0; i < patient.eligibleFollowUps.length; i++) {
    final f = patient.eligibleFollowUps[i];
    print('      [$i] ${f.doctorName} (${f.department}) - ${f.remainingDays} days');
  }
}
```

---

## 🎯 **Checklist**

Before declaring it "not working", verify:

- [ ] Backend services redeployed with reset logic?
- [ ] Doctor selected before patient search?
- [ ] Department selected before patient search?
- [ ] API called with `doctor_id` and `department_id` query params?
- [ ] Backend returning `eligible_follow_ups` array?
- [ ] `eligible_follow_ups` array has entry for selected doctor+dept?
- [ ] Frontend using `patient.isEligibleFor()` method?
- [ ] UI refreshed after booking new appointment?

---

## 📊 **Expected Console Output (Complete Flow)**

### Booking Regular Appointment:
```
✅ Creating appointment...
✅ Appointment created successfully!
```

### Searching Patient After Reset:
```
🔍 Searching patients with context:
   Query: "John"
   Doctor ID: abc-123          ✅ Present
   Department ID: cardio-456   ✅ Present

╔════════════════════════════════════════════════════════════════╗
║     SEARCHING CLINIC PATIENTS (WITH CONTEXT)                   ║
╚════════════════════════════════════════════════════════════════╝
🏥 Clinic ID: clinic-uuid
🔍 Search: "John"
👨‍⚕️ Doctor Context: abc-123
🏢 Department Context: cardio-456

✅ Found 1 patients

🔍 getFollowUpStatus called:
   doctorId: abc-123
   departmentId: cardio-456
   eligibleFollowUps.length: 1        ✅ Should be 1!
   appointments.length: 3
   🔍 isEligibleFor: Checking eligibleFollowUps array...
      [0] doctorId: abc-123, departmentId: cardio-456
         Match doctor: true            ✅
         Match dept: true               ✅
   → isEligibleFor result: true        ✅
   → Status: FREE ✅                   ✅

Patient Avatar Color: Green ✅
Patient Label: 🟢 Free Follow-Up Eligible ✅
```

---

## 🚨 **If It's Still Not Working**

### Check Backend Database Directly:

```sql
-- Check patient's appointments
SELECT 
  appointment_date,
  consultation_type,
  payment_status,
  fee_amount,
  status
FROM appointments
WHERE clinic_patient_id = 'patient-uuid'
  AND doctor_id = 'doctor-abc-uuid'
  AND department_id = 'cardiology-uuid'
ORDER BY appointment_date DESC;
```

**Expected Result:**
```
| Date    | Type             | Payment  | Fee  | Status    |
|---------|------------------|----------|------|-----------|
| Oct 15  | clinic_visit     | paid     | 500  | confirmed | ← NEW regular
| Oct 2   | follow-up-clinic | waived   | 0    | completed | ← OLD follow-up
| Oct 1   | clinic_visit     | paid     | 500  | completed | ← OLD regular
```

Then manually run the backend query:

```sql
-- Find last regular
SELECT appointment_date
FROM appointments
WHERE clinic_patient_id = 'patient-uuid'
  AND doctor_id = 'doctor-abc-uuid'
  AND department_id = 'cardiology-uuid'
  AND consultation_type IN ('clinic_visit', 'video_consultation')
ORDER BY appointment_date DESC LIMIT 1;
```

**Expected:** `2025-10-15` ✅

```sql
-- Count free follow-ups since Oct 15
SELECT COUNT(*)
FROM appointments
WHERE clinic_patient_id = 'patient-uuid'
  AND doctor_id = 'doctor-abc-uuid'
  AND department_id = 'cardiology-uuid'
  AND consultation_type IN ('follow-up-via-clinic', 'follow-up-via-video')
  AND payment_status = 'waived'
  AND appointment_date >= '2025-10-15';
```

**Expected:** `0` ✅ (Oct 2 follow-up not counted!)

---

## 🎯 **What To Look For**

### ✅ **Good Signs (Working):**

```
eligibleFollowUps.length: 1          ← Has entry
isEligibleFor result: true           ← Found match
Status: FREE ✅                      ← Correct status
Avatar Color: Green                  ← Correct color
```

### ❌ **Bad Signs (Not Working):**

```
eligibleFollowUps.length: 0          ← Empty! Backend issue!
isEligibleFor result: false          ← No match! ID mismatch!
Status: PAID_EXPIRED 🟠              ← Wrong status
Avatar Color: Orange/Red             ← Wrong color
```

---

## 🔧 **Quick Fixes**

### If `eligibleFollowUps.length: 0`:

**Problem:** Backend not returning eligible follow-ups

**Solutions:**
1. Check if backend redeployed: `docker-compose ps`
2. Check if new appointment is < 5 days old
3. Check if appointment status is 'confirmed' or 'completed'
4. Manually run SQL queries above to verify backend logic

---

### If Doctor ID mismatch:

**Problem:** Frontend doctor ID doesn't match backend

**Solution:**
```dart
// Log both ID fields
print('Doctor Object:');
print('  id: ${selectedDoctorObject.id}');
print('  doctorId: ${selectedDoctorObject.doctorId}');

// Use the correct one that matches backend
final doctorIdToUse = selectedDoctorObject.id ?? selectedDoctorObject.doctorId;
```

---

### If Department ID mismatch:

**Problem:** Frontend department ID doesn't match backend

**Solution:**
```dart
// Verify department ID is UUID, not name
print('Selected Department:');
print('  name: $_selectedDepartment');        // "Cardiology"
print('  id: $_selectedDepartmentId');         // "uuid-xxx"

// Ensure you're passing the ID to API, not the name!
```

---

## 📋 **Verification Checklist**

Run through this after booking new regular appointment:

1. **Backend Deployment**
   ```bash
   docker-compose ps | grep appointment-service
   # Status should be "Up"
   ```

2. **API Endpoint Test**
   ```bash
   curl -X GET "http://localhost:8081/api/organizations/clinic-specific-patients?clinic_id=xxx&doctor_id=yyy&department_id=zzz&search=John" \
     -H "Authorization: Bearer YOUR_TOKEN"
   ```
   Check if `eligible_follow_ups` array has entry

3. **Frontend Console**
   - Open DevTools Console
   - Search patient
   - Look for logs starting with "🔍 getFollowUpStatus called:"
   - Verify `eligibleFollowUps.length` is > 0

4. **UI Display**
   - Avatar should be 🟢 GREEN (not red/orange/grey)
   - Label should say "🟢 Free Follow-Up Eligible"
   - Payment section should be HIDDEN

---

## 🎨 **Visual Guide**

### ✅ **CORRECT (After Reset):**

```
Search Results:
┌─────────────────────────────────────────────────────┐
│ 🟢 John Doe            [🔄 Free Follow-Up]          │ ← GREEN avatar
│ 📞 +123456789                                        │
│ 🟢 Free Follow-Up Eligible                          │ ← GREEN text
│ Dr. ABC • Cardiology • 4 days left                  │
│ ℹ️ Based on your 2025-10-15 appointment            │
└─────────────────────────────────────────────────────┘
```

### ❌ **WRONG (Not Reset):**

```
Search Results:
┌─────────────────────────────────────────────────────┐
│ 🔴/🟠 John Doe                                      │ ← RED/ORANGE avatar
│ 📞 +123456789                                        │
│ 🔴/🟠 Free Follow-Up Already Used / Required        │ ← Wrong text
└─────────────────────────────────────────────────────┘
```

---

## 🚀 **Steps to Fix**

1. **Verify Backend Running:**
   ```bash
   docker-compose logs appointment-service | tail -50
   ```

2. **Check API Response:**
   - Open Network tab in browser
   - Search patient
   - Look at `clinic-specific-patients` API call
   - Verify `eligible_follow_ups` array present

3. **Check Console Logs:**
   - Look for "eligibleFollowUps.length: X"
   - Should be > 0 after new regular appointment

4. **If Still Wrong:**
   - Share console logs
   - Share API response JSON
   - Share database appointment records

---

## 📚 **Summary**

**The system SHOULD work because:**
- ✅ Backend query uses `>=` (only counts from last regular)
- ✅ Frontend trusts `eligible_follow_ups` array
- ✅ API passes doctor_id and department_id context
- ✅ UI displays status from `getFollowUpStatus()`

**If it's not working:**
- Check console logs (added extensive logging)
- Verify API response has `eligible_follow_ups` array
- Ensure doctor/department IDs match between frontend and backend

**With the new debug logging, you'll see EXACTLY where it's failing!** 🔍✅

