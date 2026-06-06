import 'package:flutter/foundation.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/repositories/doctor_time_slot_repository.dart';
import 'package:drandme/core/config/service.dart';

class SlotConfigurationViewModel extends ChangeNotifier {
  final AuthViewModel _authViewModel;
  final DoctorTimeSlotRepository _timeSlotRepository;

  SlotConfigurationViewModel(this._authViewModel)
      : _timeSlotRepository = DoctorTimeSlotRepository(ServiceRepo());

  // State variables
  bool _isCreating = false;
  String _error = '';
  CreateSlotsResponse? _lastResponse;

  // Getters
  bool get isCreating => _isCreating;
  String get error => _error;
  CreateSlotsResponse? get lastResponse => _lastResponse;

  // Create time slots for a doctor - NEW SIMPLIFIED DATE-SPECIFIC API
  Future<CreateSlotsResponse?> createDateSpecificSlots({
    required String doctorId,
    required String clinicId,
    required String slotType,
    required DateTime selectedDate,
    required List<SimpleTimeSlot> slots,
  }) async {
    try {
      _isCreating = true;
      _error = '';
      _lastResponse = null;
      notifyListeners();

      final token = _authViewModel.accessToken;
      if (token == null) {
        _error = 'Authentication required';
        _isCreating = false;
        notifyListeners();
        return null;
      }

      if (slots.isEmpty) {
        _error = 'Please select at least one day and configure time slots';
        _isCreating = false;
        notifyListeners();
        return null;
      }

      // Format date as YYYY-MM-DD
      final dateString =
          '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CREATING DATE-SPECIFIC TIME SLOTS                          ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');
      print('🏥 Clinic ID: $clinicId');
      print('📅 Slot Type: $slotType');
      print('📆 Selected Date: $dateString');
      print('📋 Total Slots: ${slots.length}');
      print('');

      final input = CreateDateSpecificSlotsInput(
        doctorId: doctorId,
        clinicId: clinicId,
        slotType: slotType,
        date: dateString,
        slots: slots,
      );

      // Print the request input JSON
      print('📤 REQUEST INPUT JSON:');
      print('════════════════════════════════════════════════════════════════');
      final inputJson = input.toJson();
      print(inputJson);
      print('════════════════════════════════════════════════════════════════');
      print('');

      final response = await _timeSlotRepository.createDateSpecificSlots(
        token: token,
        input: input,
      );

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     API RESPONSE RECEIVED                                      ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );

      if (response != null) {
        print('');
        print('✅ SUCCESS - Time slots created successfully!');
        print('');
        print('📊 SUMMARY:');
        print('   ├─ Total Created: ${response.totalCreated}');
        print('   ├─ Total Failed: ${response.totalFailed}');
        print('   └─ Message: ${response.message}');
        print('');

        // Print created slots details
        if (response.createdSlots.isNotEmpty) {
          print('📋 CREATED SLOTS (${response.createdSlots.length}):');
          print(
            '════════════════════════════════════════════════════════════════',
          );
          for (var i = 0; i < response.createdSlots.length; i++) {
            final slot = response.createdSlots[i];
            print('   Slot ${i + 1}:');
            print('   ├─ ID: ${slot.id}');
            print('   ├─ Time: ${slot.startTime} → ${slot.endTime}');
            print('   ├─ Max Patients: ${slot.maxPatients}');
            print('   ├─ Booked: ${slot.bookedPatients ?? 0}');
            print('   ├─ Available: ${slot.availableSpots ?? slot.maxPatients}');
            print('   ├─ Status: ${slot.status ?? 'available'}');
            print('   └─ Notes: ${slot.notes ?? 'N/A'}');
            print('');
          }
        }

        // Print failed slots details if any
        if (response.failedSlots.isNotEmpty) {
          print('❌ FAILED SLOTS (${response.failedSlots.length}):');
          print(
            '════════════════════════════════════════════════════════════════',
          );
          for (var i = 0; i < response.failedSlots.length; i++) {
            final failed = response.failedSlots[i];
            print('   Failed Slot ${i + 1}:');
            print('   ├─ Reason: ${failed['reason'] ?? 'Unknown error'}');
            print('   └─ Slot Data: ${failed['slot'] ?? failed}');
            print('');
          }
        }

        // Print the full response JSON
        print('📥 FULL RESPONSE JSON:');
        print(
          '════════════════════════════════════════════════════════════════',
        );
        final responseJson = response.toJson();
        print(responseJson);
        print(
          '════════════════════════════════════════════════════════════════',
        );
        print('');

        _lastResponse = response;
        return response;
      } else {
        print('');
        print('❌ FAILED - No response received from server');
        print(
          '════════════════════════════════════════════════════════════════',
        );
        print('');
        _error = 'Failed to create time slots';
        return null;
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN createDateSpecificSlots                           ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      _error = 'Error creating time slots: $e';
      return null;
    } finally {
      _isCreating = false;
      notifyListeners();
    }
  }

  // Clear error
  void clearError() {
    _error = '';
    notifyListeners();
  }

  // Reset state
  void reset() {
    _error = '';
    _lastResponse = null;
    notifyListeners();
  }
}

