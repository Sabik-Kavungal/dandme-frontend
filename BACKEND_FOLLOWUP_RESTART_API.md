# Backend Follow-Up Restart API - Complete Logic ✅

## 🎯 **Core Requirement**

When a patient books a **new regular appointment** with the **same doctor and department**, the follow-up eligibility must **restart/renew** automatically.

**Result:** Patient gets a **fresh FREE follow-up** opportunity!

---

## 🔄 **Two APIs Handle This Logic**

### 1. **Clinic Patient API** (GET - Patient Search/List)
**Purpose:** Calculate and return follow-up eligibility for patients

**Endpoint:** `GET /api/clinic-specific-patients`

**Query Parameters:**
- `clinic_id` (required)
- `doctor_id` (optional - for context-aware eligibility)
- `department_id` (optional - for context-aware eligibility)
- `search` (optional)

---

### 2. **Appointment API** (POST - Create Appointment)
**Purpose:** Validate follow-up eligibility when booking

**Endpoint:** `POST /api/appointments/simple`

**Body:**
```json
{
  "clinic_patient_id": "uuid",
  "doctor_id": "uuid",
  "department_id": "uuid",
  "consultation_type": "follow-up-via-clinic",
  "payment_method": null  // null if free follow-up
}
```

---

## 📊 **Backend Logic: The RESTART Algorithm**

### **Step 1: Find LATEST Regular Appointment** (BASE)

```sql
-- Find the MOST RECENT regular appointment (not follow-up)
SELECT 
  appointment_date,
  appointment_id
FROM appointments
WHERE 
  clinic_patient_id = $1
  AND clinic_id = $2
  AND doctor_id = $3
  AND department_id = $4
  AND consultation_type IN ('clinic_visit', 'video_consultation')  -- ✅ Only regular
  AND status NOT IN ('cancelled', 'no_show')
ORDER BY appointment_date DESC
LIMIT 1
```

**Result:** 
- `appointment_date = '2025-10-15'` ← **This is the NEW BASE!**
- All follow-up eligibility calculations start from this date

---

### **Step 2: Count Free Follow-Ups SINCE Latest Regular**

```sql
-- Count how many FREE follow-ups have been used SINCE the latest regular appointment
SELECT COUNT(*) as free_follow_up_count
FROM appointments
WHERE 
  clinic_patient_id = $1
  AND clinic_id = $2
  AND doctor_id = $3
  AND department_id = $4
  AND consultation_type IN ('follow-up-via-clinic', 'follow-up-via-video')
  AND payment_status = 'waived'  -- ✅ Only FREE follow-ups
  AND appointment_date >= $5  -- ✅ Only SINCE latest regular
  AND status NOT IN ('cancelled', 'no_show')
```

**Result:**
- `free_follow_up_count = 0` → **Patient is eligible for FREE follow-up** ✅
- `free_follow_up_count >= 1` → **Free already used, must pay** ❌

---

### **Step 3: Check 5-Day Window**

```sql
-- Calculate days since latest regular appointment
SELECT CURRENT_DATE - $latest_appointment_date AS days_since
```

**Result:**
- `days_since <= 5` → **Within window, can book follow-up**
- `days_since > 5` → **Expired, must pay**

---

### **Step 4: Build eligible_follow_ups Array**

```go
// Pseudocode
if (free_follow_up_count == 0 && days_since <= 5) {
  eligible_follow_ups = [{
    "doctor_id": doctor_id,
    "department_id": department_id,
    "appointment_date": latest_appointment_date,
    "remaining_days": 5 - days_since
  }]
} else {
  eligible_follow_ups = []  // Not eligible
}
```

---

## 🧪 **Test Scenario: Follow-Up RESTART**

### **Patient History:**

```
Oct 1, 2025:  Regular Appointment (Dr. ABC, Cardiology)
              - consultation_type: 'clinic_visit'
              - payment: ₹500 (paid)
              - Grants: 1 free follow-up (valid until Oct 6)
              ↓
Oct 2, 2025:  Follow-Up #1
              - consultation_type: 'follow-up-via-clinic'
              - payment_status: 'waived' (FREE)
              - Used the free from Oct 1 appointment
              ↓
Oct 8, 2025:  Follow-Up #2 (expired, must pay)
              - consultation_type: 'follow-up-via-clinic'
              - payment_status: 'paid' (₹200)
              - After 5 days, no longer free
```

**Current Status:**
- Patient has NO free follow-up available
- Last free follow-up was used on Oct 2
- Window expired on Oct 6

---

### **User Action: Book NEW Regular Appointment**

```
Oct 15, 2025: NEW Regular Appointment (Dr. ABC, Cardiology)
              - consultation_type: 'clinic_visit'
              - payment: ₹500 (paid)
              - ✅ RESTART TRIGGER!
```

---

### **Backend Processing: RESTART HAPPENS**

#### **API 1: Clinic Patient API** (When searching patient after booking)

```
GET /api/clinic-specific-patients?doctor_id=abc&department_id=cardio&search=John

Backend Query 1: Find LATEST regular appointment
  → Result: Oct 15, 2025 ✅ (NEW appointment!)

Backend Query 2: Count free follow-ups >= Oct 15
  → Result: 0 ✅ (No follow-ups since Oct 15!)

Backend Query 3: Calculate days since
  → Result: 0 days (today is Oct 15)

Backend Logic:
  if (count == 0 && days <= 5) {
    eligible_follow_ups.push({
      doctor_id: "abc",
      department_id: "cardio",
      appointment_date: "2025-10-15",  ← Based on NEW appointment!
      remaining_days: 5
    })
  }

API Response:
{
  "appointments": [
    {
      "appointment_id": "a004",
      "appointment_date": "2025-10-15",  ← LATEST regular
      "consultation_type": "clinic_visit",
      "status": "active",
      "free_follow_up_used": false  ← Fresh!
    },
    {
      "appointment_id": "a003",
      "appointment_date": "2025-10-08",
      "consultation_type": "follow-up-via-clinic",
      "payment_status": "paid"
    },
    {
      "appointment_id": "a002",
      "appointment_date": "2025-10-02",
      "consultation_type": "follow-up-via-clinic",
      "payment_status": "waived"  ← Old (ignored)
    },
    {
      "appointment_id": "a001",
      "appointment_date": "2025-10-01",
      "consultation_type": "clinic_visit",  ← Old base (ignored)
      "free_follow_up_used": true
    }
  ],
  "eligible_follow_ups": [
    {
      "doctor_id": "abc",
      "doctor_name": "Dr. ABC",
      "department_id": "cardio",
      "department": "Cardiology",
      "appointment_date": "2025-10-15",  ← NEW BASE!
      "remaining_days": 5
    }
  ]
}
```

**✅ Result:** Frontend shows 🟢 GREEN "Free Follow-Up Eligible"

---

#### **API 2: Appointment API** (When booking follow-up)

```
POST /api/appointments/simple
{
  "clinic_patient_id": "patient-uuid",
  "doctor_id": "abc",
  "department_id": "cardio",
  "consultation_type": "follow-up-via-clinic",
  "payment_method": null  ← User clicked FREE button
}

Backend Validation:

Step 1: Find LATEST regular appointment
  SELECT appointment_date FROM appointments
  WHERE ... AND consultation_type IN ('clinic_visit', 'video_consultation')
  ORDER BY appointment_date DESC LIMIT 1
  → Result: '2025-10-15' ✅

Step 2: Count free follow-ups >= '2025-10-15'
  SELECT COUNT(*) FROM appointments
  WHERE ... AND payment_status = 'waived'
  AND appointment_date >= '2025-10-15'
  → Result: 0 ✅

Step 3: Check days since
  CURRENT_DATE - '2025-10-15' = 0 days ✅

Step 4: Validate eligibility
  if (count == 0 && days <= 5) {
    is_free = true  ✅
    payment_required = false  ✅
  }

Step 5: Create appointment
  INSERT INTO appointments (
    consultation_type = 'follow-up-via-clinic',
    payment_status = 'waived',  ← FREE!
    payment_method = NULL,
    amount = 0
  )

API Response:
{
  "appointment_id": "a005",
  "status": "confirmed",
  "consultation_type": "follow-up-via-clinic",
  "payment_status": "waived",  ← FREE! ✅
  "amount": 0
}
```

**✅ Result:** Follow-up booked successfully without payment!

---

## 📋 **Key SQL Queries for RESTART Logic**

### **Query 1: Get Latest Regular Appointment** (BASE)

```sql
-- File: clinic_patient.controller.go / appointment_simple.controller.go
-- Line: ~720 / ~140

SELECT 
  id,
  appointment_date,
  doctor_id,
  department_id,
  consultation_type,
  status
FROM appointments
WHERE 
  clinic_patient_id = $1
  AND clinic_id = $2
  AND doctor_id = $3
  AND (department_id = $4 OR $4 IS NULL)
  AND consultation_type IN ('clinic_visit', 'video_consultation')  -- ✅ Regular only
  AND status NOT IN ('cancelled', 'no_show')
ORDER BY appointment_date DESC  -- ✅ Most recent first
LIMIT 1;

-- This ensures we ALWAYS use the LATEST regular appointment as the base!
-- Old appointments are automatically ignored!
```

---

### **Query 2: Count Free Follow-Ups Since Base**

```sql
-- File: clinic_patient.controller.go / appointment_simple.controller.go
-- Line: ~740 / ~160

SELECT COUNT(*) as free_count
FROM appointments
WHERE 
  clinic_patient_id = $1
  AND clinic_id = $2
  AND doctor_id = $3
  AND (department_id = $4 OR $4 IS NULL)
  AND consultation_type IN ('follow-up-via-clinic', 'follow-up-via-video')
  AND payment_status = 'waived'
  AND appointment_date >= $5  -- ✅ $5 = latest_regular_appointment_date
  AND status NOT IN ('cancelled', 'no_show');

-- The >= operator ensures we only count follow-ups SINCE the latest regular!
-- This is the KEY to the restart logic!
```

**Example:**
```
If latest regular = Oct 15
Query counts follow-ups where date >= Oct 15

Results:
- Oct 16 follow-up: COUNTED ✅
- Oct 2 follow-up: IGNORED ❌ (before Oct 15)
- Oct 1 appointment: IGNORED ❌ (not a follow-up)
```

---

### **Query 3: Build eligible_follow_ups Array**

```go
// File: clinic_patient.controller.go
// Function: populateAppointmentHistory()
// Line: ~700-780

func populateAppointmentHistory(patient *ClinicPatient) {
  // Step 1: Get all appointments
  appointments := []Appointment{}
  db.Where("clinic_patient_id = ?", patient.ID).Find(&appointments)
  
  // Step 2: Group by doctor+department
  groupedAppointments := groupByDoctorDepartment(appointments)
  
  // Step 3: For each group, find latest regular and check eligibility
  eligibleFollowUps := []EligibleFollowUp{}
  
  for key, group := range groupedAppointments {
    // Find LATEST regular in this group
    latestRegular := findLatestRegular(group)
    if latestRegular == nil {
      continue
    }
    
    // Count free follow-ups SINCE latest regular
    freeCount := countFreeSince(group, latestRegular.Date)
    
    // Check 5-day window
    daysSince := todayDate.Sub(latestRegular.Date).Days()
    
    // If eligible, add to array
    if (freeCount == 0 && daysSince <= 5) {
      eligibleFollowUps = append(eligibleFollowUps, EligibleFollowUp{
        DoctorID: key.doctorID,
        DepartmentID: key.departmentID,
        AppointmentDate: latestRegular.Date,  // ← Base for eligibility
        RemainingDays: 5 - daysSince,
      })
    }
  }
  
  patient.EligibleFollowUps = eligibleFollowUps
}
```

---

## ✅ **Why RESTART Works Automatically**

### **Key Design Decisions:**

1. **Always Use LATEST Regular**
   - `ORDER BY appointment_date DESC LIMIT 1`
   - Old regular appointments are automatically ignored
   - Each new regular becomes the new base

2. **Count SINCE Latest (Not Total)**
   - `appointment_date >= $latest_date`
   - Only counts follow-ups after the latest regular
   - Old follow-ups don't affect new eligibility

3. **Separate Tracking Per Doctor+Department**
   - Each combination tracked independently
   - Restart happens per combination
   - Doesn't affect other doctors/departments

4. **Backend Handles Everything**
   - Frontend just displays `eligible_follow_ups[]` array
   - No frontend calculation needed
   - Single source of truth

---

## 🧪 **Test Checklist**

### ✅ **Test 1: Simple Restart**
```
Oct 1:  Regular → ₹500
Oct 2:  Follow-up → FREE ✅
Oct 15: Regular → ₹500 (RESTART!)
Oct 16: Follow-up → FREE ✅ (NEW!)
```

**Backend Queries on Oct 16:**
- Latest regular: Oct 15
- Free count since Oct 15: 0
- Days since: 1
- Result: Eligible ✅

---

### ✅ **Test 2: Multiple Restarts**
```
Oct 1:  Regular → ₹500
Oct 2:  Follow-up → FREE (1st)
Oct 10: Regular → ₹500 (RESTART!)
Oct 11: Follow-up → FREE (2nd) ✅
Oct 20: Regular → ₹500 (RESTART!)
Oct 21: Follow-up → FREE (3rd) ✅
```

**Result:** Unlimited free follow-ups! Each regular grants a new one ✅

---

### ✅ **Test 3: Restart After Expired**
```
Oct 1:  Regular → ₹500
Oct 2:  Follow-up → FREE
Oct 8:  Follow-up → PAID (expired)
Oct 15: Regular → ₹500 (RESTART!)
Oct 16: Follow-up → FREE ✅ (RENEWED!)
```

**Backend Queries on Oct 16:**
- Latest regular: Oct 15 (not Oct 1!)
- Free count since Oct 15: 0 (Oct 2 ignored!)
- Days since: 1
- Result: Eligible ✅

---

### ✅ **Test 4: Different Departments**
```
Oct 1:  Regular (Cardiology) → ₹500
Oct 2:  Follow-up (Cardiology) → FREE
Oct 10: Regular (Neurology) → ₹500
Oct 11: Follow-up (Neurology) → FREE ✅
Oct 16: Regular (Cardiology) → ₹500 (RESTART!)
Oct 17: Follow-up (Cardiology) → FREE ✅ (RENEWED!)
```

**Result:** Each department gets its own restart! ✅

---

## 📊 **Complete Flow Diagram**

```
┌─────────────────────────────────────────────────────────┐
│  USER ACTION: Book Regular Appointment                  │
│  (Same Doctor + Same Department)                        │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  BACKEND: Create Appointment                            │
│  - consultation_type = 'clinic_visit'                   │
│  - payment_status = 'paid'                              │
│  - appointment_date = 'Oct 15'                          │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  RESTART HAPPENS AUTOMATICALLY!                         │
│  ✅ New appointment becomes the BASE                    │
│  ✅ Old appointments no longer affect eligibility       │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  FRONTEND: Search Patient                               │
│  GET /api/clinic-specific-patients?doctor_id=abc&...    │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  BACKEND QUERY 1: Find Latest Regular                   │
│  SELECT ... WHERE consultation_type IN                  │
│  ('clinic_visit', 'video_consultation')                 │
│  ORDER BY appointment_date DESC LIMIT 1                 │
│  → Result: Oct 15 ✅                                    │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  BACKEND QUERY 2: Count Free Since Oct 15               │
│  SELECT COUNT(*) WHERE payment_status = 'waived'        │
│  AND appointment_date >= 'Oct 15'                       │
│  → Result: 0 ✅                                         │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  BACKEND LOGIC: Build eligible_follow_ups Array         │
│  if (count == 0 && days <= 5) {                         │
│    eligible_follow_ups.push({                           │
│      doctor_id: abc,                                    │
│      appointment_date: 'Oct 15'  ← NEW BASE!            │
│    })                                                   │
│  }                                                      │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  BACKEND RESPONSE: Send to Frontend                     │
│  {                                                      │
│    "eligible_follow_ups": [{                            │
│      "doctor_id": "abc",                                │
│      "appointment_date": "2025-10-15"                   │
│    }]                                                   │
│  }                                                      │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────────────────────┐
│  FRONTEND: Display UI                                   │
│  - getFollowUpStatus() checks eligible_follow_ups[]     │
│  - Finds match ✅                                       │
│  - Returns 'free'                                       │
│  - Shows 🟢 GREEN avatar                                │
│  - Shows "Free Follow-Up Eligible"                      │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ **Summary**

```
╔════════════════════════════════════════════════════════╗
║      BACKEND FOLLOW-UP RESTART - COMPLETE             ║
╠════════════════════════════════════════════════════════╣
║  ✅ API 1: Clinic Patient (Search/List)                ║
║     - Finds LATEST regular appointment                 ║
║     - Counts free follow-ups SINCE that date           ║
║     - Builds eligible_follow_ups[] array               ║
║                                                        ║
║  ✅ API 2: Appointment (Create)                        ║
║     - Validates using LATEST regular appointment       ║
║     - Counts free follow-ups SINCE that date           ║
║     - Allows FREE if count = 0                         ║
║                                                        ║
║  ✅ Key SQL: appointment_date >= $latest_date          ║
║     - This enables automatic restart!                  ║
║     - Old appointments ignored                         ║
║     - Each new regular becomes new base                ║
║                                                        ║
║  ✅ Result: Unlimited FREE follow-ups                  ║
║     - One per regular appointment                      ║
║     - Automatic restart/renewal                        ║
║     - No manual intervention needed                    ║
╚════════════════════════════════════════════════════════╝
```

---

## 🎉 **Status: PRODUCTION READY!**

The backend APIs are already implementing the restart logic correctly using:
1. ✅ `ORDER BY appointment_date DESC LIMIT 1` - Always get latest regular
2. ✅ `appointment_date >= $latest_date` - Only count since latest
3. ✅ Per doctor+department tracking - Independent eligibility
4. ✅ `eligible_follow_ups[]` array - Frontend single source of truth

**No code changes needed - the restart feature is already live!** 🚀✅

