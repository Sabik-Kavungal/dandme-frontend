import 'package:a/core/config/service.dart';
import 'package:a/modules/clinic/models/vitals_model.dart';

class VitalsRepository {
  final ServiceRepo _serviceRepo;

  VitalsRepository(this._serviceRepo);

  /// Create a new vitals record
  /// POST /vitals
  Future<VitalsRecord?> createVitals({
    required String token,
    required CreateVitalsRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║                 CREATE VITALS API CALL                        ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 POST /vitals');
      print('📦 Request Body:');
      print('   ${request.toJson().toString()}');
      print('');

      final response = await _serviceRepo.requist(
        'vitals',
        method: 'POST',
        token: token,
        body: request.toJson(),
        useAppointmentsApi: true, // Vitals API is in appointments service
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null) {
        // Check if response contains an error
        if (response is Map<String, dynamic>) {
          if (response.containsKey('error')) {
            final errorMsg = response['error']?.toString() ?? 'Unknown error';
            final details = response['details']?.toString() ?? '';
            final message = response['message']?.toString() ?? errorMsg;
            print('❌ API Error: $errorMsg');
            if (details.isNotEmpty) {
              print('   Details: $details');
            }
            print('');
            throw Exception(
              '$message${details.isNotEmpty ? ': $details' : ''}',
            );
          }

          // Check if response has the vitals record structure
          if (response.containsKey('id') ||
              response.containsKey('clinic_patient_id')) {
            print('✅ SUCCESS: Vitals record created successfully');
            print('');
            return VitalsRecord.fromJson(response);
          }
        }
      }

      print('⚠️ WARNING: Response is null or invalid format');
      print('');
      return null;
    } catch (e) {
      print('❌ Error creating vitals: $e');
      print('');
      rethrow;
    }
  }

  /// Get vitals record by ID
  /// GET /vitals/:id?clinic_patient_id={uuid}&clinic_id={uuid}
  Future<VitalsRecord?> getVitalsById({
    required String token,
    required String vitalsId,
    required String clinicPatientId,
    String? clinicId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║              GET VITALS BY ID API CALL                        ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 GET /vitals/$vitalsId');
      print('   clinic_patient_id: $clinicPatientId');
      if (clinicId != null) {
        print('   clinic_id: $clinicId');
      }
      print('');

      final queryParams = <String, String>{
        'clinic_patient_id': clinicPatientId,
      };
      if (clinicId != null && clinicId.isNotEmpty) {
        queryParams['clinic_id'] = clinicId;
      }

      final queryString = Uri(queryParameters: queryParams).query;

      final response = await _serviceRepo.requist(
        'vitals/$vitalsId?$queryString',
        method: 'GET',
        token: token,
        useAppointmentsApi: true,
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null) {
        // Check if response contains an error
        if (response is Map<String, dynamic> && response.containsKey('error')) {
          final errorMsg = response['error']?.toString() ?? 'Unknown error';
          print('❌ API Error: $errorMsg');
          print('');
          return null;
        }

        print('✅ SUCCESS: Vitals record fetched successfully');
        print('');
        return VitalsRecord.fromJson(response);
      }

      print('⚠️ WARNING: Response is null');
      print('');
      return null;
    } catch (e) {
      print('❌ Error getting vitals: $e');
      print('');
      return null; // Return null instead of rethrow to handle gracefully
    }
  }

  /// Update vitals record
  /// PUT /vitals/:id
  Future<bool> updateVitals({
    required String token,
    required String vitalsId,
    required UpdateVitalsRequest request,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║                 UPDATE VITALS API CALL                        ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 PUT /vitals/$vitalsId');
      print('📦 Request Body:');
      print('   ${request.toJson().toString()}');
      print('');

      final response = await _serviceRepo.requist(
        'vitals/$vitalsId',
        method: 'PUT',
        token: token,
        body: request.toJson(),
        useAppointmentsApi: true,
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null) {
        // Check if response contains an error
        if (response is Map<String, dynamic>) {
          if (response.containsKey('error')) {
            final errorMsg = response['error']?.toString() ?? 'Unknown error';
            final details = response['details']?.toString() ?? '';
            final message = response['message']?.toString() ?? errorMsg;
            print('❌ API Error: $errorMsg');
            if (details.isNotEmpty) {
              print('   Details: $details');
            }
            print('');
            throw Exception(
              '$message${details.isNotEmpty ? ': $details' : ''}',
            );
          }

          // Success response should have message or id
          if (response.containsKey('message') || response.containsKey('id')) {
            print('✅ SUCCESS: Vitals record updated successfully');
            print('');
            return true;
          }
        }
      }

      print('⚠️ WARNING: Response is null or invalid format');
      print('');
      return false;
    } catch (e) {
      print('❌ Error updating vitals: $e');
      print('');
      rethrow;
    }
  }

  /// Get vitals history for a clinic patient
  /// GET /vitals/clinic-patient/:clinic_patient_id?clinic_id={uuid}&limit={number}
  Future<VitalsHistoryResponse?> getVitalsHistory({
    required String token,
    required String clinicPatientId,
    String? clinicId,
    int? limit,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print('║            GET VITALS HISTORY API CALL                       ║');
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 GET /vitals/clinic-patient/$clinicPatientId');
      print('   clinic_patient_id: $clinicPatientId');
      if (clinicId != null) {
        print('   clinic_id: $clinicId');
      }
      if (limit != null) {
        print('   limit: $limit');
      }
      print('');

      final queryParams = <String, String>{};
      if (clinicId != null && clinicId.isNotEmpty) {
        queryParams['clinic_id'] = clinicId;
      }
      if (limit != null && limit > 0) {
        queryParams['limit'] = limit.toString();
      }

      final queryString = queryParams.isNotEmpty
          ? '?${Uri(queryParameters: queryParams).query}'
          : '';

      final response = await _serviceRepo.requist(
        'vitals/clinic-patient/$clinicPatientId$queryString',
        method: 'GET',
        token: token,
        useAppointmentsApi: true,
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null) {
        // Check if response contains an error
        if (response is Map<String, dynamic> && response.containsKey('error')) {
          final errorMsg = response['error']?.toString() ?? 'Unknown error';
          print('❌ API Error: $errorMsg');
          print('');
          return null;
        }

        try {
          // Ensure clinic_patient_id is present in the response
          final responseMap = response as Map<String, dynamic>;
          if (!responseMap.containsKey('clinic_patient_id')) {
            responseMap['clinic_patient_id'] = clinicPatientId;
          }

          // Ensure each vital record has clinic_patient_id
          if (responseMap.containsKey('vitals') &&
              responseMap['vitals'] is List) {
            final vitalsList = responseMap['vitals'] as List;
            for (var vital in vitalsList) {
              if (vital is Map<String, dynamic> &&
                  !vital.containsKey('clinic_patient_id')) {
                vital['clinic_patient_id'] = clinicPatientId;
              }
            }
          }

          print('✅ SUCCESS: Vitals history fetched successfully');
          print('');
          return VitalsHistoryResponse.fromJson(responseMap);
        } catch (e) {
          print('❌ Error parsing vitals history response: $e');
          print('');
          return null;
        }
      }

      print('⚠️ WARNING: Response is null');
      print('');
      return null;
    } catch (e) {
      print('❌ Error getting vitals history: $e');
      print('');
      return null; // Return null instead of rethrow to handle gracefully
    }
  }
}
