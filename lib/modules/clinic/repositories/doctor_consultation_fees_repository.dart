import 'package:drandme/modules/clinic/models/doctor_consultation_fees_model.dart';
import 'package:drandme/core/config/service.dart';

/// Repository for managing doctor consultation fees
class DoctorConsultationFeesRepository {
  final ServiceRepo _serviceRepo;

  DoctorConsultationFeesRepository(this._serviceRepo);

  /// Get consultation fees (GET)
  Future<DoctorConsultationFees?> getConsultationFees({
    required String token,
    required String clinicId,
    required String clinicDoctorId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     GET CONSULTATION FEES API CALL                            ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-consultation-fees');
      print('🏥 Clinic ID: $clinicId');
      print('🔗 Clinic Doctor ID: $clinicDoctorId');
      print('');

      final queryString =
          'clinic_id=$clinicId&clinic_doctor_id=$clinicDoctorId';
      final response = await _serviceRepo.requist(
        'doctor-consultation-fees?$queryString',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        // Check if response is an error response
        if (response.containsKey('error') || response.containsKey('code')) {
          final code = (response['code'] ?? '').toString().toUpperCase();
          final message =
              (response['message'] ??
                      response['error'] ??
                      response['details'] ??
                      'Failed to get consultation fees')
                  .toString();
          print('❌ API Error [$code]: $message');
          // 404 is expected if fees don't exist yet, return null
          if (code.contains('404') || code.contains('NOT FOUND')) {
            print('ℹ️ Consultation fees not found (this is OK for new links)');
            print('');
            return null;
          }
          throw Exception(message);
        }

        print('✅ Consultation fees retrieved successfully');
        print('💰 Offline Fee: ${response['consultation_fee_offline']}');
        print('💰 Online Fee: ${response['consultation_fee_online']}');
        print('');
        return DoctorConsultationFees.fromJson(response);
      }

      print('⚠️ No response received from API');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN getConsultationFees                               ║',
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

  /// Add consultation fees (POST)
  Future<DoctorConsultationFees?> addConsultationFees({
    required String token,
    required AddConsultationFeesRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ADD CONSULTATION FEES API CALL                            ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-consultation-fees');
      print('🏥 Clinic ID: ${request.clinicId}');
      print('🔗 Clinic Doctor ID: ${request.clinicDoctorId}');
      print('💰 Offline Fee: ${request.consultationFeeOffline}');
      print('💰 Online Fee: ${request.consultationFeeOnline}');
      print('');

      final body = request.toJson();

      final response = await _serviceRepo.requist(
        'doctor-consultation-fees',
        method: 'POST',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        // Check if response is an error response
        if (response.containsKey('error') || response.containsKey('code')) {
          final code = (response['code'] ?? '').toString().toUpperCase();
          final message =
              (response['message'] ??
                      response['error'] ??
                      response['details'] ??
                      'Failed to add consultation fees')
                  .toString();
          print('❌ API Error [$code]: $message');
          if (code.contains('FORBIDDEN') || code.contains('403')) {
            throw Exception(
              'You don\'t have permission to perform this action',
            );
          }
          throw Exception(message);
        }

        // Check if response has data field (wrapped response)
        if (response.containsKey('data') && response['data'] != null) {
          print('✅ Consultation fees added successfully');
          print('');
          return DoctorConsultationFees.fromJson(response['data']);
        }

        // Direct response (no wrapper)
        if (response.containsKey('clinic_doctor_id')) {
          print('✅ Consultation fees added successfully');
          print('');
          return DoctorConsultationFees.fromJson(response);
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
        '║     ERROR IN addConsultationFees                               ║',
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

  /// Update consultation fees (PUT)
  Future<DoctorConsultationFees?> updateConsultationFees({
    required String token,
    required UpdateConsultationFeesRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     UPDATE CONSULTATION FEES API CALL                          ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctor-consultation-fees');
      print('🏥 Clinic ID: ${request.clinicId}');
      print('🔗 Clinic Doctor ID: ${request.clinicDoctorId}');
      print('💰 Offline Fee: ${request.consultationFeeOffline}');
      print('💰 Online Fee: ${request.consultationFeeOnline}');
      print('');

      final body = request.toJson();

      final response = await _serviceRepo.requist(
        'doctor-consultation-fees',
        method: 'PUT',
        body: body,
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        // Check if response is an error response
        if (response.containsKey('error') || response.containsKey('code')) {
          final code = (response['code'] ?? '').toString().toUpperCase();
          final message =
              (response['message'] ??
                      response['error'] ??
                      response['details'] ??
                      'Failed to update consultation fees')
                  .toString();
          print('❌ API Error [$code]: $message');
          if (code.contains('FORBIDDEN') || code.contains('403')) {
            throw Exception(
              'You don\'t have permission to perform this action',
            );
          }
          throw Exception(message);
        }

        // Check if response has data field (wrapped response)
        if (response.containsKey('data') && response['data'] != null) {
          print('✅ Consultation fees updated successfully');
          print('');
          return DoctorConsultationFees.fromJson(response['data']);
        }

        // Direct response (no wrapper)
        if (response.containsKey('clinic_doctor_id')) {
          print('✅ Consultation fees updated successfully');
          print('');
          return DoctorConsultationFees.fromJson(response);
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
        '║     ERROR IN updateConsultationFees                            ║',
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
}
