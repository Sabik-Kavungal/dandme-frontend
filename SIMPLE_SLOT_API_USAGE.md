# SimpleSlotWidget API Integration Guide

## Overview
This guide shows how to integrate the SimpleSlotWidget with the backend API for creating, listing, updating, and deleting doctor time slots.

---

## Setup

### 1. Add Dependencies
Add to `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
```

### 2. Initialize API Service
```dart
import 'package:drandme_frontend/modules/clinic/services/simple_slot_api_service.dart';

final apiService = SimpleSlotApiService(
  baseUrl: 'http://localhost:8081',
  getToken: () => AuthService.getToken(), // Your auth token getter
);
```

---

## API Functions

### 1. CREATE SLOTS

#### Single Date Creation
```dart
Future<void> createSlotsForDate() async {
  final result = await apiService.createSlots(
    doctorId: '3fd28e6d-7f9a-4dde-8172-d14a74a9b02d',
    clinicId: '7a6c1211-c029-4923-a1a6-fe3dfe48bdf2',
    slotType: 'offline', // or 'online'
    date: '2024-10-15',
    slots: [
      {
        'start_time': '09:00',
        'end_time': '12:00',
        'max_patients': 10,
        'notes': 'Morning shift - Monday',
      },
      {
        'start_time': '14:00',
        'end_time': '17:00',
        'max_patients': 10,
        'notes': 'Afternoon shift - Monday',
      },
    ],
  );

  if (result['success']) {
    final data = result['data'];
    print('Created ${data['total_created']} slots');
    print('Failed ${data['total_failed']} slots');
    
    // Access created slots
    final createdSlots = data['created_slots'];
    for (var slot in createdSlots) {
      print('Slot ID: ${slot['id']}');
      print('Time: ${slot['start_time']} - ${slot['end_time']}');
    }
  } else {
    print('Error: ${result['error']}');
    print('Message: ${result['message']}');
  }
}
```

#### Multi-Week Creation
```dart
Future<void> createMultiWeekSlots() async {
  final result = await apiService.createMultiWeekSlots(
    doctorId: '3fd28e6d-7f9a-4dde-8172-d14a74a9b02d',
    clinicId: '7a6c1211-c029-4923-a1a6-fe3dfe48bdf2',
    slotType: 'offline',
    startDate: DateTime.now(),
    weeks: 4, // Create slots for 4 weeks
    weeklySlots: {
      1: [ // Monday
        {'start_time': '09:00', 'end_time': '12:00', 'max_patients': 10, 'notes': 'Morning'},
        {'start_time': '14:00', 'end_time': '17:00', 'max_patients': 10, 'notes': 'Afternoon'},
      ],
      2: [ // Tuesday
        {'start_time': '09:00', 'end_time': '12:00', 'max_patients': 10, 'notes': 'Morning'},
        {'start_time': '14:00', 'end_time': '17:00', 'max_patients': 10, 'notes': 'Afternoon'},
      ],
      3: [ // Wednesday
        {'start_time': '09:00', 'end_time': '12:00', 'max_patients': 10, 'notes': 'Morning'},
      ],
    },
  );

  if (result['success']) {
    print('Total created: ${result['total_created']}');
    print('Total failed: ${result['total_failed']}');
  } else {
    print('Errors: ${result['errors']}');
  }
}
```

---

### 2. LIST SLOTS

#### List All Slots for a Doctor
```dart
Future<void> listAllSlots() async {
  final result = await apiService.listSlots(
    doctorId: '3fd28e6d-7f9a-4dde-8172-d14a74a9b02d',
  );

  if (result['success']) {
    final data = result['data'];
    final slots = data['slots'];
    
    print('Total slots: ${data['total']}');
    
    for (var slot in slots) {
      print('Slot: ${slot['start_time']} - ${slot['end_time']}');
      print('Available: ${slot['available_spots']}/${slot['max_patients']}');
      print('Status: ${slot['status']}');
    }
  }
}
```

#### List Slots with Filters
```dart
Future<void> listFilteredSlots() async {
  final result = await apiService.listSlots(
    doctorId: '3fd28e6d-7f9a-4dde-8172-d14a74a9b02d',
    clinicId: '7a6c1211-c029-4923-a1a6-fe3dfe48bdf2',
    slotType: 'offline',
    date: '2024-10-15',
  );

  if (result['success']) {
    final slots = apiService.parseSlots(result);
    
    for (var slot in slots) {
      print('${slot['date']} ${slot['start_time']}-${slot['end_time']}');
      print('Booked: ${slot['booked_patients']}/${slot['max_patients']}');
    }
  }
}
```

---

### 3. GET SINGLE SLOT

```dart
Future<void> getSingleSlot() async {
  final result = await apiService.getSlot(
    slotId: 'slot-uuid-here',
  );

  if (result['success']) {
    final slot = result['data']['slot'];
    
    print('Slot Details:');
    print('Date: ${slot['date']}');
    print('Time: ${slot['start_time']} - ${slot['end_time']}');
    print('Type: ${slot['slot_type']}');
    print('Max Patients: ${slot['max_patients']}');
    print('Booked: ${slot['booked_patients']}');
    print('Available: ${slot['available_spots']}');
    print('Status: ${slot['status']}');
  }
}
```

---

### 4. UPDATE SLOT

```dart
Future<void> updateSlot() async {
  final result = await apiService.updateSlot(
    slotId: 'slot-uuid-here',
    updates: {
      'max_patients': 15,
      'notes': 'Updated shift with more capacity',
      'start_time': '10:00',
      'end_time': '13:00',
    },
  );

  if (result['success']) {
    final updatedSlot = result['data']['slot'];
    print('Slot updated successfully');
    print('New max patients: ${updatedSlot['max_patients']}');
  } else {
    print('Update failed: ${result['error']}');
  }
}
```

---

### 5. DELETE SLOT

```dart
Future<void> deleteSlot() async {
  final result = await apiService.deleteSlot(
    slotId: 'slot-uuid-here',
  );

  if (result['success']) {
    print('Slot deleted successfully');
    print('Deleted slot ID: ${result['data']['slot_id']}');
  } else {
    print('Delete failed: ${result['error']}');
  }
}
```

---

## Complete Integration Example for SimpleSlotWidget

### Updated SimpleSlotWidget with API Integration

```dart
import 'package:flutter/material.dart';
import 'package:drandme_frontend/modules/clinic/services/simple_slot_api_service.dart';

class SimpleSlotWidget extends StatefulWidget {
  final String doctorId;
  final String clinicId;

  const SimpleSlotWidget({
    Key? key,
    required this.doctorId,
    required this.clinicId,
  }) : super(key: key);

  @override
  State<SimpleSlotWidget> createState() => _SimpleSlotWidgetState();
}

class _SimpleSlotWidgetState extends State<SimpleSlotWidget> {
  late SimpleSlotApiService _apiService;
  List<Map<String, dynamic>> _slots = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _apiService = SimpleSlotApiService(
      baseUrl: 'http://localhost:8081',
      getToken: () => 'your-auth-token', // Replace with actual token
    );
    _loadSlots();
  }

  /// Load slots from API
  Future<void> _loadSlots() async {
    setState(() => _isLoading = true);

    final result = await _apiService.listSlots(
      doctorId: widget.doctorId,
      clinicId: widget.clinicId,
    );

    setState(() {
      _isLoading = false;
      if (result['success']) {
        _slots = _apiService.parseSlots(result);
      }
    });
  }

  /// Create slots via API
  Future<void> _createSlots() async {
    setState(() => _isLoading = true);

    final result = await _apiService.createSlots(
      doctorId: widget.doctorId,
      clinicId: widget.clinicId,
      slotType: 'offline',
      date: _apiService.formatDate(DateTime.now()),
      slots: [
        {
          'start_time': '09:00',
          'end_time': '12:00',
          'max_patients': 10,
          'notes': 'Morning shift',
        },
        {
          'start_time': '14:00',
          'end_time': '17:00',
          'max_patients': 10,
          'notes': 'Afternoon shift',
        },
      ],
    );

    setState(() => _isLoading = false);

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Created ${result['data']['total_created']} slots'),
          backgroundColor: Colors.green,
        ),
      );
      _loadSlots(); // Reload slots
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${result['error']}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// Update slot via API
  Future<void> _updateSlot(String slotId) async {
    final result = await _apiService.updateSlot(
      slotId: slotId,
      updates: {
        'max_patients': 15,
        'notes': 'Updated capacity',
      },
    );

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Slot updated successfully'),
          backgroundColor: Colors.green,
        ),
      );
      _loadSlots();
    }
  }

  /// Delete slot via API
  Future<void> _deleteSlot(String slotId) async {
    final result = await _apiService.deleteSlot(slotId: slotId);

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Slot deleted successfully'),
          backgroundColor: Colors.green,
        ),
      );
      _loadSlots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _createSlots,
          child: const Text('Create Slots'),
        ),
        if (_isLoading)
          const CircularProgressIndicator()
        else
          ListView.builder(
            shrinkWrap: true,
            itemCount: _slots.length,
            itemBuilder: (context, index) {
              final slot = _slots[index];
              return ListTile(
                title: Text('${slot['start_time']} - ${slot['end_time']}'),
                subtitle: Text('${slot['available_spots']}/${slot['max_patients']} available'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _updateSlot(slot['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteSlot(slot['id']),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}
```

---

## Error Handling

### Common Error Scenarios

```dart
Future<void> handleApiCall() async {
  final result = await apiService.createSlots(/* ... */);

  if (!result['success']) {
    final error = result['error'];
    final message = result['message'];

    switch (error) {
      case 'Network error':
        // Handle network issues
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Network Error'),
            content: const Text('Please check your internet connection'),
          ),
        );
        break;

      case 'Invalid input data':
        // Handle validation errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Validation Error'),
            content: Text(message),
          ),
        );
        break;

      case 'Doctor not found':
        // Handle not found errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Doctor Not Found'),
            content: const Text('The selected doctor is not available'),
          ),
        );
        break;

      default:
        // Handle unknown errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(error),
          ),
        );
    }
  }
}
```

---

## Best Practices

### 1. Loading States
```dart
bool _isLoading = false;

Future<void> _performApiCall() async {
  setState(() => _isLoading = true);
  try {
    final result = await apiService.createSlots(/* ... */);
    // Handle result
  } finally {
    setState(() => _isLoading = false);
  }
}
```

### 2. Retry Logic
```dart
Future<Map<String, dynamic>> _callWithRetry(
  Future<Map<String, dynamic>> Function() apiCall,
  {int maxRetries = 3}
) async {
  for (int i = 0; i < maxRetries; i++) {
    final result = await apiCall();
    if (result['success']) return result;
    
    if (i < maxRetries - 1) {
      await Future.delayed(Duration(seconds: 2 * (i + 1)));
    }
  }
  return {'success': false, 'error': 'Max retries exceeded'};
}
```

### 3. Caching
```dart
final Map<String, List<Map<String, dynamic>>> _slotCache = {};

Future<List<Map<String, dynamic>>> _getSlotsCached(String date) async {
  if (_slotCache.containsKey(date)) {
    return _slotCache[date]!;
  }

  final result = await apiService.listSlots(
    doctorId: widget.doctorId,
    date: date,
  );

  if (result['success']) {
    final slots = apiService.parseSlots(result);
    _slotCache[date] = slots;
    return slots;
  }

  return [];
}
```

---

## Testing

### Mock API Service for Testing
```dart
class MockSimpleSlotApiService extends SimpleSlotApiService {
  MockSimpleSlotApiService()
      : super(
          baseUrl: 'http://mock',
          getToken: () => 'mock-token',
        );

  @override
  Future<Map<String, dynamic>> createSlots({
    required String doctorId,
    required String clinicId,
    required String slotType,
    required String date,
    required List<Map<String, dynamic>> slots,
  }) async {
    // Return mock data
    return {
      'success': true,
      'data': {
        'total_created': slots.length,
        'total_failed': 0,
        'created_slots': slots.map((s) => {
          'id': 'mock-slot-id',
          ...s,
        }).toList(),
      },
    };
  }
}
```

---

## Summary

The SimpleSlotWidget API integration provides:

1. ✅ **CREATE** - Bulk slot creation for single or multiple weeks
2. ✅ **LIST** - Fetch slots with optional filters
3. ✅ **GET** - Retrieve single slot details
4. ✅ **UPDATE** - Modify existing slots
5. ✅ **DELETE** - Soft delete slots

All functions return consistent response format:
```dart
{
  'success': bool,
  'data': Map<String, dynamic>, // if success
  'error': String, // if failure
  'message': String, // additional info
}
```

