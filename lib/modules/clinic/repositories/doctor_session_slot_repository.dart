import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/clinic/models/doctor_session_slot_model.dart';

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
      print('📍 Endpoint: doctor-session-slots');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('👨‍⚕️ Doctor ID: ${input.doctorId}');
      print('🏥 Clinic ID: ${input.clinicId}');
      if (input.weekdays.isNotEmpty) {
        print('📅 Weekdays (Recurring): ${input.weekdays}');
        print(
          '   (0=Sunday, 1=Monday, 2=Tuesday, 3=Wednesday, 4=Thursday, 5=Friday, 6=Saturday)',
        );
      } else if (input.date != null) {
        print('📅 Date (Single): ${input.date}');
      }
      print('📍 Slot Type: ${input.slotType}');
      print('⏱️ Slot Duration: ${input.slotDuration} minutes');
      print('📊 Number of sessions: ${input.sessions.length}');
      print('');

      final body = {
        'doctor_id': input.doctorId,
        'clinic_id': input.clinicId,
        'slot_type': input.slotType,
        'slot_duration': input.slotDuration,
        // For recurring slots, use weekdays; for single date, use date
        if (input.weekdays.isNotEmpty) 'weekdays': input.weekdays,
        if (input.date != null && input.weekdays.isEmpty) 'date': input.date,
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
        'doctor-session-slots',
        method: 'POST',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        print('✅ Session-based slots created successfully');

        // Handle both single slot and multiple slots response formats
        if (response['data'] != null) {
          if (response['data'] is List) {
            // Recurring slots response - multiple slots
            final dataList = response['data'] as List;
            print('📊 Created ${dataList.length} recurring slot(s)');
            print(
              '📋 Total Created: ${response['total_created'] ?? dataList.length}',
            );
            for (var slot in dataList) {
              print(
                '   - Day ${slot['day_of_week']}: ${slot['sessions']?.length ?? 0} sessions',
              );
            }
          } else {
            // Single date slot response
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
        }
        print('');

        // Parse response - handle both formats
        if (response['data'] != null && response['data'] is List) {
          // Recurring slots - multiple slots
          return CreateSessionSlotsResponse(
            success: response['success'] as bool? ?? false,
            message: response['message'] as String? ?? '',
            dataList: (response['data'] as List)
                .map(
                  (e) => DoctorSessionSlot.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
            totalCreated: response['total_created'] as int? ?? 0,
          );
        } else {
          // Single date slot
          return CreateSessionSlotsResponse.fromJson(response);
        }
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
      final endpoint = 'doctor-session-slots?$queryString';

      print('📍 Endpoint: $endpoint');
      print('🔑 Token: ${token.substring(0, 20)}...');
      if (date != null) {
        // Parse date to show weekday info
        try {
          final dateObj = DateTime.parse(date);
          final weekdayNames = [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
          ];
          final apiWeekday =
              dateObj.weekday %
              7; // Convert to API format (0=Sunday, 1=Monday, ..., 6=Saturday)
          print('📅 Requested Date: $date');
          print('📆 Day Name: ${weekdayNames[apiWeekday]}');
          print(
            '🔍 Weekday (API format): $apiWeekday (0=Sunday, 1=Monday, ..., 6=Saturday)',
          );
          print('💡 API will return recurring slots matching this weekday');
        } catch (e) {
          print('⚠️ Could not parse date: $date');
        }
      }
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
            final slotDate = slot['date'] ?? 'N/A';
            final dayOfWeek = slot['day_of_week'];
            final sessionsCount = slot['sessions']?.length ?? 0;
            final isRecurring = dayOfWeek != null;

            if (isRecurring) {
              final weekdayNames = [
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
              ];
              final dayName = weekdayNames[dayOfWeek];
              print(
                '   🔄 Recurring Slot: $dayName (day_of_week: $dayOfWeek) | Date: $slotDate | Sessions: $sessionsCount',
              );
            } else {
              print(
                '   📅 Specific Date Slot: $slotDate | Sessions: $sessionsCount',
              );
            }
          }
        } else {
          print('⚠️ No slots returned from API');
          if (date != null) {
            print('   💡 This might mean:');
            print('      - No recurring slots exist for this weekday');
            print('      - No specific date slots exist for this date');
            print('      - Check if doctor has slots configured for this day');
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

  /// Update existing session times within a doctor session slot
  Future<bool> updateSessionSlotSessions({
    required String token,
    required String slotId,
    List<Map<String, String>> sessions = const [],
    List<Map<String, dynamic>> newSessions = const [],
  }) async {
    try {
      final hasSessionUpdates = sessions.isNotEmpty;
      final hasNewSessions = newSessions.isNotEmpty;

      if (!hasSessionUpdates && !hasNewSessions) {
        print('⚠️ No sessions provided for update');
        return false;
      }

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     UPDATE SESSION-BASED SLOTS API CALL                        ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-session-slots/$slotId');
      print('🔑 Token: ${token.substring(0, 20)}...');
      if (hasSessionUpdates) {
        print('📊 Sessions to update: ${sessions.length}');
        for (var session in sessions) {
          print(
            '   🔄 Session ID: ${session['session_id']} | ${session['start_time']} - ${session['end_time']}',
          );
        }
      } else {
        print('📊 No existing sessions being updated');
      }

      if (hasNewSessions) {
        print('➕ New sessions to create inside slot: ${newSessions.length}');
        for (var session in newSessions) {
          print(
            '   ✨ ${session['session_name']} | ${session['start_time']} - ${session['end_time']} | max ${session['max_patients']} | interval ${session['slot_interval_minutes']} min',
          );
        }
      }
      print('');

      final body = <String, dynamic>{};
      if (hasSessionUpdates) {
        body['sessions'] = sessions;
      }
      if (hasNewSessions) {
        body['new_sessions'] = newSessions;
      }

      final response = await _serviceRepo.requist(
        'doctor-session-slots/$slotId',
        method: 'PUT',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        final success = response['success'] as bool? ?? false;
        final message = response['message'] as String? ?? '';
        if (success) {
          print('✅ Session configuration updated successfully: $message');
          print(
            '   Updated sessions count: ${response['updated_sessions'] ?? 0}',
          );
          if (response.containsKey('created_sessions')) {
            print('   Newly created sessions: ${response['created_sessions']}');
          }
        } else {
          print('⚠️ Failed to update sessions: $message');
        }
        return success;
      }

      print('⚠️ No response received from API while updating sessions');
      return false;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN updateSessionSlotSessions                         ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      print('');
      return false;
    }
  }
}
