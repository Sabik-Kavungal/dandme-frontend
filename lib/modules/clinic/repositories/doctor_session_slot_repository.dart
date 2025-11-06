import 'package:a/core/config/service.dart';
import 'package:a/modules/clinic/models/doctor_session_slot_model.dart';

class DoctorSessionSlotRepository {
  final ServiceRepo _serviceRepo;

  DoctorSessionSlotRepository(this._serviceRepo);

  /// Create session-based time slots
  Future<CreateSessionSlotsResponse?> createSessionSlots({
    required String token,
    required CreateSessionSlotsInput input,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CREATE SESSION-BASED SLOTS API CALL                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: organizations/doctor-session-slots');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('👨‍⚕️ Doctor ID: ${input.doctorId}');
      print('🏥 Clinic ID: ${input.clinicId}');
      print('📅 Date: ${input.date}');
      print('📍 Slot Type: ${input.slotType}');
      print('⏱️ Slot Duration: ${input.slotDuration} minutes');
      print('📊 Number of sessions: ${input.sessions.length}');
      print('');

      final body = {
        'doctor_id': input.doctorId,
        'clinic_id': input.clinicId,
        'slot_type': input.slotType,
        'slot_duration': input.slotDuration,
        'date': input.date,
        'is_available': input.isAvailable,
        if (input.notes != null) 'notes': input.notes,
        'sessions': input.sessions
            .map(
              (session) => {
                'session_name': session.sessionName,
                'start_time': session.startTime,
                'end_time': session.endTime,
                'max_patients': session.maxPatients,
                'slot_interval_minutes': session.slotIntervalMinutes,
                if (session.notes != null) 'notes': session.notes,
              },
            )
            .toList(),
      };

      print('📤 API REQUEST (JSON):');
      print('─────────────────────────────────────────────────────────────');
      print('Sessions:');
      for (var i = 0; i < input.sessions.length; i++) {
        final session = input.sessions[i];
        print('  ${i + 1}. ${session.sessionName}');
        print('     ⏰ ${session.startTime} - ${session.endTime}');
        print('     👥 Max Patients: ${session.maxPatients}');
        print('     ⏱️ Interval: ${session.slotIntervalMinutes} min');
      }
      print('─────────────────────────────────────────────────────────────');
      print('');

      final response = await _serviceRepo.requist(
        'organizations/doctor-session-slots',
        method: 'POST',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        print('✅ Session-based slots created successfully');
        if (response['data'] != null) {
          final data = response['data'];
          print('📊 Created slots for: ${data['date']}');
          print('📅 Day of week: ${data['day_of_week']}');
          if (data['sessions'] != null) {
            print('📋 Sessions created: ${data['sessions'].length}');
            for (var session in data['sessions']) {
              print(
                '   - ${session['session_name']}: ${session['generated_slots']} slots',
              );
            }
          }
        }
        print('');
        return CreateSessionSlotsResponse.fromJson(response);
      }

      print('⚠️ No response received from API');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN createSessionSlots                                ║',
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

  /// List session-based time slots
  Future<ListSessionSlotsResponse?> listSessionSlots({
    required String token,
    required String doctorId,
    String? clinicId,
    String? date,
    String? slotType,
    String?
    appointmentId, // ✅ NEW: For reschedule - exclude current appointment
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LIST SESSION-BASED SLOTS API CALL                         ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );

      // Build query parameters
      final queryParams = <String, String>{
        'doctor_id': doctorId,
        if (clinicId != null) 'clinic_id': clinicId,
        if (date != null) 'date': date,
        if (slotType != null) 'slot_type': slotType,
        if (appointmentId != null) 'appointment_id': appointmentId,
      };

      final queryString = queryParams.entries
          .map(
            (e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
      final endpoint = 'organizations/doctor-session-slots?$queryString';

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
        print('✅ Session-based slots fetched successfully');
        print('📊 Total: ${response['total'] ?? 0}');
        print('📋 Slot days count: ${response['slots']?.length ?? 0}');

        if (response['slots'] != null && response['slots'] is List) {
          for (var slot in response['slots']) {
            print(
              '   📅 Date: ${slot['date']} | Sessions: ${slot['sessions']?.length ?? 0}',
            );
          }
        }
        print('');

        // Handle null slots array from API
        if (response['slots'] == null) {
          print('⚠️ API returned null slots array, using empty list');
          response['slots'] = [];
        }

        return ListSessionSlotsResponse.fromJson(response);
      }

      print('⚠️ API returned null response, returning empty result');
      return const ListSessionSlotsResponse(doctorId: '', total: 0, slots: []);
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN listSessionSlots                                  ║',
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
}
