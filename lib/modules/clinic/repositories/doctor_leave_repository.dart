import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/clinic/models/doctor_leave_model.dart';

class DoctorLeaveRepository {
  final ServiceRepo _serviceRepo;

  DoctorLeaveRepository(this._serviceRepo);

  /// List doctor leaves with filters
  Future<DoctorLeaveListResponse?> listLeaves({
    required String token,
    String? doctorId,
    String? clinicId,
    String? status,
    String? leaveType,
    int? page,
    int? pageSize,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LIST DOCTOR LEAVES API CALL                                ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves');

      final queryParams = <String, dynamic>{};
      if (doctorId != null) queryParams['doctor_id'] = doctorId;
      if (clinicId != null) queryParams['clinic_id'] = clinicId;
      if (status != null) queryParams['status'] = status;
      if (leaveType != null) queryParams['leave_type'] = leaveType;
      if (page != null) queryParams['page'] = page.toString();
      if (pageSize != null) queryParams['page_size'] = pageSize.toString();

      final queryString = queryParams.entries
          .where((e) => e.value != null)
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final endpoint = queryString.isNotEmpty
          ? 'doctor-leaves?$queryString'
          : 'doctor-leaves';

      print('🔍 Query params: $queryParams');
      print('');

      final response = await _serviceRepo.requist(
        endpoint,
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        print('✅ Successfully fetched leaves');
        print(
          '📊 Total leaves: ${response['pagination']?['total_count'] ?? 0}',
        );
        print('');
        return DoctorLeaveListResponse.fromJson(response);
      }

      print('⚠️ No response received from API');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN listLeaves                                       ║',
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

  /// Get single leave by ID
  Future<DoctorLeave?> getLeaveById({
    required String token,
    required String leaveId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print('║     GET DOCTOR LEAVE BY ID API CALL                          ║');
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves/$leaveId');
      print('');

      final response = await _serviceRepo.requist(
        'doctor-leaves/$leaveId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        print('✅ Successfully fetched leave');
        print('');
        return DoctorLeave.fromJson(response);
      }

      print('⚠️ No response received from API');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN getLeaveById                                     ║',
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

  /// Apply for leave (POST)
  Future<ApplyLeaveResponse?> applyLeave({
    required String token,
    required ApplyLeaveRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     APPLY FOR LEAVE API CALL                                  ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves');
      print('👨‍⚕️ Doctor ID: ${request.doctorId}');
      print('🏥 Clinic ID: ${request.clinicId}');
      print('📅 From: ${request.fromDate}');
      print('📅 To: ${request.toDate}');
      print('📋 Leave Type: ${request.leaveType}');
      print('⏰ Days Type: ${request.daysType}');
      print('');

      final body = request.toJson();
      if (request.reason != null && request.reason!.trim().isNotEmpty) {
        body['reason'] = request.reason!.trim();
      }

      final response = await _serviceRepo.requist(
        'doctor-leaves',
        method: 'POST',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        // Check if response is an error response (e.g., 4xx/5xx)
        if (response.containsKey('error') || response.containsKey('code')) {
          final code = (response['code'] ?? '').toString().toUpperCase();
          final msg =
              (response['message'] ??
                      response['error'] ??
                      response['details'] ??
                      'Failed to apply for leave')
                  .toString();
          print('❌ API Error [$code]: $msg');
          // Map 403 to a friendly message; map 409 overlap to a special marker with leave_id
          if (code.contains('FORBIDDEN') || code.contains('403')) {
            throw Exception(
              'You don\'t have permission to perform this action',
            );
          }
          if (code.contains('OVERLAP') && response['leave_id'] != null) {
            final existingId = response['leave_id'].toString();
            final from = (response['from_date'] ?? '').toString();
            final to = (response['to_date'] ?? '').toString();
            final days = (response['days_type'] ?? '').toString();
            // Special marker for UI to trigger edit dialog
            throw Exception('LEAVE_CONFLICT:$existingId:$from:$to:$days');
          }
          throw Exception(msg);
        }

        // Check if response has the expected success fields and they're not null
        if (response.containsKey('leave_id') &&
            response['leave_id'] != null &&
            response.containsKey('status') &&
            response['status'] != null) {
          print('✅ Leave application submitted successfully');
          print('🆔 Leave ID: ${response['leave_id']}');
          print('📊 Status: ${response['status']}');
          print('📅 Total Days: ${response['total_days']}');
          print('');
          return ApplyLeaveResponse.fromJson(response);
        }
      }

      print('⚠️ No response received from API');
      throw Exception('No response received from API');
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN applyLeave                                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      print('');
      // Re-throw the exception so the ViewModel can handle it
      rethrow;
    }
  }

  /// Update leave (PUT)
  Future<bool> updateLeave({
    required String token,
    required String leaveId,
    required UpdateLeaveRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     UPDATE LEAVE API CALL                                     ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves/$leaveId');
      print('');

      final body = request.toJson();

      final response = await _serviceRepo.requist(
        'doctor-leaves/$leaveId',
        method: 'PUT',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        // Centralized error handling (403/forbidden or validation)
        if (response.containsKey('error') || response.containsKey('code')) {
          final code = (response['code'] ?? '').toString().toUpperCase();
          final message =
              (response['message'] ??
                      response['error'] ??
                      response['details'] ??
                      'Failed to update leave')
                  .toString();
          if (code.contains('FORBIDDEN') || code.contains('403')) {
            throw Exception(
              'You don\'t have permission to perform this action',
            );
          }
          throw Exception(message);
        }
        print('✅ Leave updated successfully');
        print('');
        return true;
      }

      print('⚠️ No response received from API');
      return false;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN updateLeave                                      ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      print('');
      // Bubble up for UI to show toast/snackbar
      rethrow;
    }
  }

  /// Review leave (POST /doctor-leaves/:id/review)
  Future<bool> reviewLeave({
    required String token,
    required String leaveId,
    required ReviewLeaveRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     REVIEW LEAVE API CALL                                      ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves/$leaveId/review');
      print('📊 Status: ${request.status}');
      print('');

      final body = {
        'status': request.status,
        if (request.reviewNotes != null) 'review_notes': request.reviewNotes,
      };

      final response = await _serviceRepo.requist(
        'doctor-leaves/$leaveId/review',
        method: 'POST',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        print('✅ Leave reviewed successfully');
        print('📊 Status: ${response['status']}');
        print('');
        return true;
      }

      print('⚠️ No response received from API');
      return false;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN reviewLeave                                      ║',
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

  /// Cancel leave (POST /doctor-leaves/:id/cancel)
  Future<bool> cancelLeave({
    required String token,
    required String leaveId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CANCEL LEAVE API CALL                                      ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves/$leaveId/cancel');
      print('');

      final response = await _serviceRepo.requist(
        'doctor-leaves/$leaveId/cancel',
        method: 'POST',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response.containsKey('error') || response.containsKey('code')) {
          final code = (response['code'] ?? '').toString().toUpperCase();
          final message =
              (response['message'] ??
                      response['error'] ??
                      response['details'] ??
                      'Failed to cancel leave')
                  .toString();
          if (code.contains('FORBIDDEN') || code.contains('403')) {
            throw Exception(
              'You don\'t have permission to perform this action',
            );
          }
          throw Exception(message);
        }
        print('✅ Leave cancelled successfully');
        print('');
        return true;
      }

      print('⚠️ No response received from API');
      return false;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN cancelLeave                                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      print('');
      // Bubble up for UI to show toast/snackbar
      rethrow;
    }
  }

  Future<DoctorLeaveStats?> getLeaveStats({
    required String token,
    required String doctorId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     GET DOCTOR LEAVE STATS API CALL                            ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-leaves/stats/$doctorId');
      print('');

      final response = await _serviceRepo.requist(
        'doctor-leaves/stats/$doctorId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        print('✅ Successfully fetched leave stats');
        print('');
        return DoctorLeaveStats.fromJson(response);
      }

      print('⚠️ No response received from API');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN getLeaveStats                                     ║',
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
