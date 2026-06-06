import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';

class DoctorTimeSlotRepository {
  final ServiceRepo _serviceRepo;

  DoctorTimeSlotRepository(this._serviceRepo);

  // Create date-specific time slots (new simplified API)
  Future<CreateSlotsResponse?> createDateSpecificSlots({
    required String token,
    required CreateDateSpecificSlotsInput input,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CREATE DATE-SPECIFIC SLOTS API CALL                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-time-slots');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('📅 Date: ${input.date}');
      print('📊 Number of slots: ${input.slots.length}');
      print('');

      final body = {
        'doctor_id': input.doctorId,
        'clinic_id': input.clinicId,
        'slot_type': input.slotType,
        'date': input.date,
        'slots': input.slots
            .map(
              (slot) => {
                'start_time': slot.startTime,
                'end_time': slot.endTime,
                if (slot.maxPatients != null) 'max_patients': slot.maxPatients,
                if (slot.dayOfWeek != null) 'day_of_week': slot.dayOfWeek,
                if (slot.notes != null) 'notes': slot.notes,
              },
            )
            .toList(),
      };

      final response = await _serviceRepo.requist(
        'doctor-time-slots',
        method: 'POST',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        final totalCreated = response['total_created'] ?? 0;
        final totalFailed = response['total_failed'] ?? 0;

        if (totalCreated > 0) {
          print('✅ Date-specific slots created successfully');
          print('📊 Total created: $totalCreated');
          if (totalFailed > 0) {
            print('⚠️ Total failed: $totalFailed');
          }
        } else {
          print('❌ All slots failed to create');
          print('📊 Total failed: $totalFailed');
        }
        print('');
        return CreateSlotsResponse.fromJson(response);
      }

      print('⚠️ No response received from API');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN createDateSpecificSlots                          ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      print('');
      return null;
    }
  }

  // List date-specific time slots (new simplified API)
  Future<ListSlotsResponse?> listDateSpecificSlots({
    required String token,
    required String doctorId,
    String? clinicId,
    String? slotType,
    String? date,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LIST DATE-SPECIFIC SLOTS API CALL                         ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );

      // Build query parameters
      final queryParams = <String, String>{
        'doctor_id': doctorId,
        if (clinicId != null) 'clinic_id': clinicId,
        if (slotType != null) 'slot_type': slotType,
        if (date != null) 'date': date,
      };

      final queryString = queryParams.entries
          .map(
            (e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
      final endpoint = 'doctor-time-slots?$queryString';

      print('📍 Endpoint: $endpoint');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('');

      final response = await _serviceRepo.requist(
        endpoint,
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        print('✅ Date-specific slots fetched successfully');
        print('📊 Total: ${response['total'] ?? 0}');
        print('📋 Slots count: ${response['slots']?.length ?? 0}');
        print('');

        // Handle null slots array from API
        if (response['slots'] == null) {
          print('⚠️ API returned null slots array, using empty list');
          response['slots'] = [];
        }

        return ListSlotsResponse.fromJson(response);
      }

      print('⚠️ API returned null response, returning empty result');
      return const ListSlotsResponse(slots: [], total: 0);
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN listDateSpecificSlots                            ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      print('');
      return null;
    }
  }

  // Get doctor time slots
  Future<DoctorTimeSlotsResponse?> getDoctorTimeSlots({
    required String token,
    required String doctorId,
    required String? clinicId,
    required String slotType,
  }) async {
    try {
      final endpoint =
          'doctor-time-slots?doctor_id=$doctorId&clinic_id=$clinicId&slot_type=$slotType';
      final response = await _serviceRepo.requist(
        endpoint,
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        return DoctorTimeSlotsResponse.fromJson(response);
      } else {
        print('❌ Failed to get doctor time slots');
        return null;
      }
    } catch (e) {
      print('❌ Error getting doctor time slots: $e');
      return null;
    }
  }
}
