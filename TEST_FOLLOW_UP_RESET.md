# Test Follow-Up Reset - Step by Step 🧪

## 🎯 **What We're Testing**

**Requirement:** After booking a NEW regular appointment, patient should get a FRESH FREE follow-up (reset).

---

## ✅ **Step-by-Step Test**

### 📅 **Day 1: Book First Regular Appointment**

1. Open app, go to New Appointment screen
2. Select:
   - **Consultation Type:** 🏥 Clinic Visit
   - **Doctor:** Dr. ABC
   - **Department:** Cardiology
   - **Time Slot:** 10:00 AM
3. Search patient: "John Doe"
4. Select patient
5. Select payment: Pay Now → Cash
6. Click "Book Now"

**Result:** ✅ Appointment created (Oct 1)

---

### 📅 **Day 2: Book First Follow-Up (Should be FREE)**

1. Select:
   - **Consultation Type:** 🔄 Follow-Up (Clinic)
   - **Doctor:** Dr. ABC (same)
   - **Department:** Cardiology (same)
   - **Time Slot:** 11:00 AM
2. Search patient: "John Doe"

**Check Console Logs:**
```
🔍 Searching patients with context:
   Doctor ID: xxx            ← Should show UUID
   Department ID: yyy        ← Should show UUID

🔍 getFollowUpStatus called:
   eligibleFollowUps.length: 1  ← Should be 1!
   → Status: FREE ✅
```

**Check UI:**
- Avatar: 🟢 GREEN
- Label: "🟢 Free Follow-Up Eligible"
- Payment section: ❌ HIDDEN

3. Click "Book FREE Follow-Up"

**Result:** ✅ FREE follow-up booked (Oct 2)

---

### 📅 **Day 3: Try Second Follow-Up (Should be PAID)**

1. Select: Follow-Up (Clinic), Dr. ABC, Cardiology
2. Search patient: "John Doe"

**Check Console Logs:**
```
🔍 getFollowUpStatus called:
   eligibleFollowUps.length: 0  ← Should be 0 (used)
   hasPreviousAppointment: true
   → Status: PAID_EXPIRED 🟠
```

**Check UI:**
- Avatar: 🟠 ORANGE
- Label: "🟠 Paid Follow-Up Required"
- Payment section: ✅ SHOWN

**Don't book - just verify it's PAID!**

---

### 📅 **Day 10: Book NEW Regular Appointment (RESET!)**

1. Select:
   - **Consultation Type:** 🏥 Clinic Visit (change from follow-up!)
   - **Doctor:** Dr. ABC (same)
   - **Department:** Cardiology (same)
   - **Time Slot:** 2:00 PM
2. Search patient: "John Doe"
3. Select patient
4. Pay ₹500
5. Click "Book Now"

**Result:** ✅ NEW regular appointment created (Oct 10)

---

### 📅 **Day 11: Try Follow-Up Again (Should be FREE AGAIN! - RESET!)**

1. Select:
   - **Consultation Type:** 🔄 Follow-Up (Clinic)
   - **Doctor:** Dr. ABC (same)
   - **Department:** Cardiology (same)
2. Search patient: "John Doe"

**✅ CRITICAL CHECK - Console Logs:**
```
🔍 Searching patients with context:
   Query: "John Doe"
   Doctor ID: doctor-abc-uuid
   Department ID: cardiology-uuid

🔍 getFollowUpStatus called:
   eligibleFollowUps.length: 1  ← MUST be 1! (RESET!)
   🔍 isEligibleFor: Checking eligibleFollowUps array...
      [0] doctorId: doctor-abc-uuid, departmentId: cardiology-uuid
         Match doctor: true
         Match dept: true
   → isEligibleFor result: true
   → Status: FREE ✅             ← MUST be FREE!
```

**✅ CRITICAL CHECK - UI:**
- Avatar: 🟢 **GREEN** (NOT red/orange!)
- Label: "🟢 Free Follow-Up Eligible" (NOT "already used"!)
- Message: "ℹ️ Based on your 2025-10-10 appointment"
- Payment section: ❌ **HIDDEN**
- Button: "Book FREE Follow-Up" ✅

3. Click "Book FREE Follow-Up"

**Result:** ✅ Should book WITHOUT payment! (RESET worked!)

---

## 🎯 **Success Criteria**

| Check | Expected | Pass? |
|-------|----------|-------|
| Console: `eligibleFollowUps.length` | 1 | [ ] |
| Console: `isEligibleFor result` | true | [ ] |
| Console: `Status` | FREE ✅ | [ ] |
| UI: Avatar color | 🟢 Green | [ ] |
| UI: Status label | "Free Follow-Up Eligible" | [ ] |
| UI: Payment section | Hidden | [ ] |
| Booking: Payment required? | No | [ ] |

**If ALL checkboxes pass:** ✅ **RESET IS WORKING!**

---

## 🚨 **If It Fails**

### Scenario A: `eligibleFollowUps.length: 0`

**Problem:** Backend not returning eligible follow-ups

**What to check:**
```bash
# 1. Check backend is running
docker-compose ps

# 2. Check backend logs
docker-compose logs appointment-service | grep "eligible"

# 3. Check database
# Connect to DB and run:
SELECT * FROM appointments 
WHERE clinic_patient_id = 'patient-uuid'
  AND doctor_id = 'doctor-abc-uuid'
ORDER BY appointment_date DESC;
```

**Expected in DB:**
- Oct 10: clinic_visit (should be most recent regular)
- Oct 2: follow-up-via-clinic (old follow-up)
- Oct 1: clinic_visit (old regular)

---

### Scenario B: `isEligibleFor result: false`

**Problem:** Doctor/Department ID mismatch

**What to check:**
```dart
// Add this logging in viewmodel
print('Selected Doctor Object:');
print('   id: ${selectedDoctorObject?.id}');
print('   doctorId: ${selectedDoctorObject?.doctorId}');
print('Selected Department:');
print('   id: $_selectedDepartmentId');
```

Compare with API response `eligible_follow_ups[0].doctorId`

---

### Scenario C: Avatar Still Red/Orange

**Problem:** UI not updating or using wrong status

**What to check:**
- Ensure you saved all files
- Hot reload the app (press `r` in terminal)
- If still wrong, stop and restart the app
- Check that `new_appointment_view.dart` is using the updated color logic

---

## 📱 **Quick Debug Commands**

Run app with verbose logging:
```bash
flutter run --verbose
```

Check console output when searching patient:
```bash
# Look for these exact lines:
🔍 getFollowUpStatus called:
   eligibleFollowUps.length: ???
   → Status: ???
```

---

## ✅ **What To Share If Still Not Working**

1. **Console logs** (copy the entire getFollowUpStatus section)
2. **API response** (from Network tab, copy JSON)
3. **Screenshot** of the patient search result (showing color)
4. **Database query** result:
   ```sql
   SELECT appointment_date, consultation_type, payment_status, fee_amount
   FROM appointments
   WHERE clinic_patient_id = 'xxx' AND doctor_id = 'yyy'
   ORDER BY appointment_date DESC;
   ```

---

## 🎉 **Expected Final Result**

```
╔════════════════════════════════════════════════════════╗
║              TEST RESULT - SUCCESS                      ║
╠════════════════════════════════════════════════════════╣
║  Day 1: Book regular → ✅ Paid ₹500                    ║
║  Day 2: Book follow-up → ✅ FREE (0 payment)          ║
║  Day 3: Try follow-up → ⚠️ PAID required (used)       ║
║  Day 10: Book NEW regular → ✅ Paid ₹500               ║
║  Day 11: Book follow-up → ✅ FREE AGAIN! (RESET!)     ║
╚════════════════════════════════════════════════════════╝
```

**With the debug logging, you'll see EXACTLY where it's failing!** 🔍

Now run the test and check the console logs - they will tell you exactly what's happening! 🚀✅

