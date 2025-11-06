# Doctor Time Slots API Documentation

## Overview
This document provides complete API specifications for managing doctor time slots in the clinic system.

---

## Base URL
```
http://localhost:8081/api/organizations
```

---

## Authentication
All endpoints require Bearer token authentication:
```
Authorization: Bearer <your-token>
```

---

## 1. Create Doctor Time Slots (Bulk)

### Endpoint
```http
POST /doctor-time-slots
```

### Description
Create multiple time slots for a doctor at a clinic for a specific date.

### Request Headers
```json
{
  "Content-Type": "application/json",
  "Authorization": "Bearer <token>"
}
```

### Request Body
```json
{
  "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
  "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
  "slot_type": "offline",
  "date": "2024-10-15",
  "slots": [
    {
      "start_time": "09:00",
      "end_time": "12:00",
      "max_patients": 10,
      "notes": "Morning shift - Monday"
    },
    {
      "start_time": "14:00",
      "end_time": "17:00",
      "max_patients": 10,
      "notes": "Afternoon shift - Monday"
    }
  ]
}
```

### Request Body Schema
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| doctor_id | string (UUID) | Yes | Doctor's unique identifier |
| clinic_id | string (UUID) | Yes | Clinic's unique identifier |
| slot_type | string | Yes | "offline" or "online" |
| date | string | Yes | Date in YYYY-MM-DD format |
| slots | array | Yes | Array of slot definitions |
| slots[].start_time | string | Yes | Start time in HH:MM format (24-hour) |
| slots[].end_time | string | Yes | End time in HH:MM format (24-hour) |
| slots[].max_patients | integer | No | Maximum patients (default: 1) |
| slots[].notes | string | No | Additional notes |

### Response (201 Created)
```json
{
  "message": "Slot creation completed. 2 created, 0 failed",
  "created_slots": [
    {
      "id": "slot-uuid-1",
      "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
      "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
      "date": "2024-10-15",
      "slot_type": "offline",
      "start_time": "09:00",
      "end_time": "12:00",
      "max_patients": 10,
      "booked_patients": 0,
      "available_spots": 10,
      "is_available": true,
      "status": "available",
      "notes": "Morning shift - Monday",
      "is_active": true,
      "created_at": "2024-10-14T10:00:00Z",
      "updated_at": "2024-10-14T10:00:00Z"
    },
    {
      "id": "slot-uuid-2",
      "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
      "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
      "date": "2024-10-15",
      "slot_type": "offline",
      "start_time": "14:00",
      "end_time": "17:00",
      "max_patients": 10,
      "booked_patients": 0,
      "available_spots": 10,
      "is_available": true,
      "status": "available",
      "notes": "Afternoon shift - Monday",
      "is_active": true,
      "created_at": "2024-10-14T10:00:00Z",
      "updated_at": "2024-10-14T10:00:00Z"
    }
  ],
  "failed_slots": [],
  "total_created": 2,
  "total_failed": 0
}
```

### Error Response (400 Bad Request)
```json
{
  "error": "Invalid input data",
  "message": "Field validation for 'doctor_id' failed on the 'uuid' tag"
}
```

### Error Response (404 Not Found)
```json
{
  "error": "Doctor not found",
  "message": "Doctor not found or is inactive"
}
```

---

## 2. List Doctor Time Slots

### Endpoint
```http
GET /doctor-time-slots
```

### Description
Retrieve time slots for a doctor with optional filtering.

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| doctor_id | string (UUID) | Yes | Doctor's unique identifier |
| clinic_id | string (UUID) | No | Filter by clinic |
| slot_type | string | No | Filter by type: "offline" or "online" |
| date | string | No | Filter by date (YYYY-MM-DD) |

### Request Example
```http
GET /doctor-time-slots?doctor_id=3fd28e6d-7f9a-4dde-8172-d14a74a9b02d&clinic_id=7a6c1211-c029-4923-a1a6-fe3dfe48bdf2&slot_type=offline&date=2024-10-15
```

### Response (200 OK)
```json
{
  "slots": [
    {
      "id": "slot-uuid-1",
      "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
      "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
      "date": "2024-10-15",
      "slot_type": "offline",
      "start_time": "09:00",
      "end_time": "12:00",
      "max_patients": 10,
      "booked_patients": 3,
      "available_spots": 7,
      "is_available": true,
      "status": "available",
      "notes": "Morning shift - Monday",
      "is_active": true,
      "created_at": "2024-10-14T10:00:00Z",
      "updated_at": "2024-10-14T10:00:00Z"
    },
    {
      "id": "slot-uuid-2",
      "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
      "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
      "date": "2024-10-15",
      "slot_type": "offline",
      "start_time": "14:00",
      "end_time": "17:00",
      "max_patients": 10,
      "booked_patients": 10,
      "available_spots": 0,
      "is_available": false,
      "status": "booking_full",
      "notes": "Afternoon shift - Monday",
      "is_active": true,
      "created_at": "2024-10-14T10:00:00Z",
      "updated_at": "2024-10-14T10:00:00Z"
    }
  ],
  "total": 2,
  "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
  "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
  "slot_type": "offline",
  "date": "2024-10-15"
}
```

---

## 3. Get Single Time Slot

### Endpoint
```http
GET /doctor-time-slots/:id
```

### Description
Retrieve a specific time slot by ID.

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | string (UUID) | Yes | Slot's unique identifier |

### Request Example
```http
GET /doctor-time-slots/slot-uuid-1
```

### Response (200 OK)
```json
{
  "slot": {
    "id": "slot-uuid-1",
    "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
    "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
    "date": "2024-10-15",
    "slot_type": "offline",
    "start_time": "09:00",
    "end_time": "12:00",
    "max_patients": 10,
    "booked_patients": 3,
    "available_spots": 7,
    "is_available": true,
    "status": "available",
    "notes": "Morning shift - Monday",
    "is_active": true,
    "created_at": "2024-10-14T10:00:00Z",
    "updated_at": "2024-10-14T10:00:00Z"
  }
}
```

### Error Response (404 Not Found)
```json
{
  "error": "Time slot not found"
}
```

---

## 4. Update Time Slot

### Endpoint
```http
PUT /doctor-time-slots/:id
```

### Description
Update an existing time slot.

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | string (UUID) | Yes | Slot's unique identifier |

### Request Body
```json
{
  "slot_type": "online",
  "start_time": "10:00",
  "end_time": "13:00",
  "max_patients": 15,
  "notes": "Updated morning shift",
  "is_active": true
}
```

### Request Body Schema (All fields optional)
| Field | Type | Description |
|-------|------|-------------|
| slot_type | string | "offline" or "online" |
| start_time | string | Start time in HH:MM format |
| end_time | string | End time in HH:MM format |
| max_patients | integer | Maximum patients |
| notes | string | Additional notes |
| is_active | boolean | Active status |

### Response (200 OK)
```json
{
  "message": "Time slot updated successfully",
  "slot": {
    "id": "slot-uuid-1",
    "doctor_id": "3fd28e6d-7f9a-4dde-8172-d14a74a9b02d",
    "clinic_id": "7a6c1211-c029-4923-a1a6-fe3dfe48bdf2",
    "date": "2024-10-15",
    "slot_type": "online",
    "start_time": "10:00",
    "end_time": "13:00",
    "max_patients": 15,
    "booked_patients": 3,
    "available_spots": 12,
    "is_available": true,
    "status": "available",
    "notes": "Updated morning shift",
    "is_active": true,
    "created_at": "2024-10-14T10:00:00Z",
    "updated_at": "2024-10-14T11:30:00Z"
  }
}
```

---

## 5. Delete Time Slot (Soft Delete)

### Endpoint
```http
DELETE /doctor-time-slots/:id
```

### Description
Soft delete a time slot (sets is_active to false).

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | string (UUID) | Yes | Slot's unique identifier |

### Response (200 OK)
```json
{
  "message": "Time slot deleted successfully",
  "slot_id": "slot-uuid-1"
}
```

### Error Response (404 Not Found)
```json
{
  "error": "Time slot not found"
}
```

---

## Complete Flutter Integration Example

### Create Slots
```dart
final response = await http.post(
  Uri.parse('$baseUrl/doctor-time-slots'),
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  },
  body: jsonEncode({
    'doctor_id': doctorId,
    'clinic_id': clinicId,
    'slot_type': 'offline',
    'date': '2024-10-15',
    'slots': [
      {
        'start_time': '09:00',
        'end_time': '12:00',
        'max_patients': 10,
        'notes': 'Morning shift',
      },
    ],
  }),
);
```

### List Slots
```dart
final response = await http.get(
  Uri.parse('$baseUrl/doctor-time-slots?doctor_id=$doctorId&date=2024-10-15'),
  headers: {
    'Authorization': 'Bearer $token',
  },
);
```

### Update Slot
```dart
final response = await http.put(
  Uri.parse('$baseUrl/doctor-time-slots/$slotId'),
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  },
  body: jsonEncode({
    'max_patients': 15,
    'notes': 'Updated shift',
  }),
);
```

### Delete Slot
```dart
final response = await http.delete(
  Uri.parse('$baseUrl/doctor-time-slots/$slotId'),
  headers: {
    'Authorization': 'Bearer $token',
  },
);
```

---

## Status Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request - Invalid input |
| 401 | Unauthorized - Invalid or missing token |
| 403 | Forbidden - Insufficient permissions |
| 404 | Not Found - Resource doesn't exist |
| 500 | Internal Server Error |

---

## Validation Rules

### Time Format
- Must be in HH:MM format (24-hour)
- Valid range: 00:00 to 23:59

### Date Format
- Must be in YYYY-MM-DD format
- Example: 2024-10-15

### Slot Type
- Must be either "offline" or "online"
- Case-sensitive

### Max Patients
- Must be a positive integer
- Minimum: 1
- Default: 1 if not provided

### UUID Format
- Must be a valid UUID v4
- Example: 3fd28e6d-7f9a-4dde-8172-d14a74a9b02d

---

## Notes

1. All timestamps are in UTC format (ISO 8601)
2. Soft delete is used - slots are marked as inactive rather than permanently deleted
3. The `booked_patients` and `available_spots` are calculated in real-time
4. The `status` field is automatically determined based on availability
5. Multiple slots can be created for the same date with different times

