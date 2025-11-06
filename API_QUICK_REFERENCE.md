# API Quick Reference - Doctor Time Slots

## 🚀 Quick Start

### Base URL
```
http://localhost:8081/api/organizations
```

### Authentication
```
Authorization: Bearer <your-token>
```

---

## 📋 All 5 API Endpoints

| # | Method | Endpoint | Purpose |
|---|--------|----------|---------|
| 1 | POST | `/doctor-time-slots` | Create slots (bulk) |
| 2 | GET | `/doctor-time-slots` | List all slots |
| 3 | GET | `/doctor-time-slots/:id` | Get single slot |
| 4 | PUT | `/doctor-time-slots/:id` | Update slot |
| 5 | DELETE | `/doctor-time-slots/:id` | Delete slot |

---

## 1️⃣ CREATE SLOTS

```bash
POST /doctor-time-slots
```

### Request
```json
{
  "doctor_id": "uuid",
  "clinic_id": "uuid",
  "slot_type": "offline",
  "date": "2024-10-15",
  "slots": [
    {
      "start_time": "09:00",
      "end_time": "12:00",
      "max_patients": 10,
      "notes": "Morning shift"
    }
  ]
}
```

### Response (201)
```json
{
  "message": "Slot creation completed. 1 created, 0 failed",
  "created_slots": [...],
  "total_created": 1,
  "total_failed": 0
}
```

---

## 2️⃣ LIST SLOTS

```bash
GET /doctor-time-slots?doctor_id=uuid&date=2024-10-15
```

### Response (200)
```json
{
  "slots": [
    {
      "id": "uuid",
      "doctor_id": "uuid",
      "clinic_id": "uuid",
      "date": "2024-10-15",
      "slot_type": "offline",
      "start_time": "09:00",
      "end_time": "12:00",
      "max_patients": 10,
      "booked_patients": 3,
      "available_spots": 7,
      "is_available": true,
      "status": "available"
    }
  ],
  "total": 1
}
```

---

## 3️⃣ GET SINGLE SLOT

```bash
GET /doctor-time-slots/:id
```

### Response (200)
```json
{
  "slot": {
    "id": "uuid",
    "date": "2024-10-15",
    "start_time": "09:00",
    "end_time": "12:00",
    ...
  }
}
```

---

## 4️⃣ UPDATE SLOT

```bash
PUT /doctor-time-slots/:id
```

### Request
```json
{
  "max_patients": 15,
  "notes": "Updated shift"
}
```

### Response (200)
```json
{
  "message": "Time slot updated successfully",
  "slot": {...}
}
```

---

## 5️⃣ DELETE SLOT

```bash
DELETE /doctor-time-slots/:id
```

### Response (200)
```json
{
  "message": "Time slot deleted successfully",
  "slot_id": "uuid"
}
```

---

## 🎯 Flutter Integration

### Setup
```dart
final apiService = SimpleSlotApiService(
  baseUrl: 'http://localhost:8081',
  getToken: () => AuthService.getToken(),
);
```

### Create
```dart
final result = await apiService.createSlots(
  doctorId: 'uuid',
  clinicId: 'uuid',
  slotType: 'offline',
  date: '2024-10-15',
  slots: [
    {
      'start_time': '09:00',
      'end_time': '12:00',
      'max_patients': 10,
    },
  ],
);
```

### List
```dart
final result = await apiService.listSlots(
  doctorId: 'uuid',
  date: '2024-10-15',
);
```

### Update
```dart
final result = await apiService.updateSlot(
  slotId: 'uuid',
  updates: {'max_patients': 15},
);
```

### Delete
```dart
final result = await apiService.deleteSlot(
  slotId: 'uuid',
);
```

---

## 📝 Response Format

All Flutter API calls return:
```dart
{
  'success': bool,
  'data': Map<String, dynamic>, // if success
  'error': String, // if failure
  'message': String, // additional info
}
```

### Usage
```dart
if (result['success']) {
  // Handle success
  final data = result['data'];
} else {
  // Handle error
  print(result['error']);
}
```

---

## 🔑 Key Fields

### Slot Type
- `"offline"` - In-person consultation
- `"online"` - Online consultation

### Status
- `"available"` - Has available spots
- `"booking_full"` - All spots booked
- `"unavailable"` - Slot is inactive

### Date Format
- `YYYY-MM-DD` (e.g., "2024-10-15")

### Time Format
- `HH:MM` in 24-hour format (e.g., "09:00", "14:30")

---

## ⚠️ Common Errors

| Code | Error | Solution |
|------|-------|----------|
| 400 | Invalid input | Check field formats |
| 401 | Unauthorized | Verify auth token |
| 404 | Not found | Check IDs |
| 500 | Server error | Contact support |

---

## 📦 Files Created

1. **SLOT_API_DOCUMENTATION.md** - Complete API documentation
2. **simple_slot_api_service.dart** - Flutter API service
3. **SIMPLE_SLOT_API_USAGE.md** - Usage examples
4. **API_QUICK_REFERENCE.md** - This file

---

## 🎉 You're Ready!

You now have:
- ✅ Complete API documentation
- ✅ Flutter service for all 5 endpoints
- ✅ Usage examples
- ✅ Error handling
- ✅ Multi-week creation helper
- ✅ Quick reference guide

Start integrating with:
```dart
import 'package:drandme_frontend/modules/clinic/services/simple_slot_api_service.dart';
```

