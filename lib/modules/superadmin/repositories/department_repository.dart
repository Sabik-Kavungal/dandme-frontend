import 'package:drandme/core/config/service.dart';
import 'package:drandme/modules/superadmin/models/department_model.dart';

class DepartmentRepository {
  final ServiceRepo _serviceRepo = ServiceRepo();

  // Create a new department
  Future<Map<String, dynamic>?> createDepartment({
    required String token,
    required CreateDepartmentInput input,
  }) async {
    final response = await _serviceRepo.requist(
      'departments',
      method: 'POST',
      body: input.toJson(),
      token: token,
      useOrgApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      return response;
    }
    return null;
  }

  // List departments with optional filters
  Future<List<DepartmentModel>?> listDepartments({
    required String token,
    String? clinicId,
    bool onlyActive = true,
  }) async {
    final queryParams = <String, String>{};

    if (clinicId != null && clinicId.isNotEmpty) {
      queryParams['clinic_id'] = clinicId;
    }
    queryParams['only_active'] = onlyActive.toString();

    final queryString = queryParams.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');

    final response = await _serviceRepo.requist(
      'departments?$queryString',
      method: 'GET',
      token: token,
      useOrgApi: true,
    );

    print('=== Department List API Response ===');
    print('Response: $response');
    print('Response type: ${response.runtimeType}');

    if (response != null && response is Map<String, dynamic>) {
      if (response['departments'] != null) {
        final List<dynamic> departmentsJson = response['departments'];
        print('Found ${departmentsJson.length} departments');

        final departments = departmentsJson
            .map((json) {
              try {
                return DepartmentModel.fromJson(json as Map<String, dynamic>);
              } catch (e) {
                print('Error parsing department: $e');
                print('Department JSON: $json');
                return null;
              }
            })
            .whereType<DepartmentModel>()
            .toList();

        print('Successfully parsed ${departments.length} departments');
        return departments;
      }
    }

    return null;
  }

  // Get single department by ID
  Future<DepartmentModel?> getDepartment({
    required String token,
    required String departmentId,
  }) async {
    final response = await _serviceRepo.requist(
      'departments/$departmentId',
      method: 'GET',
      token: token,
      useOrgApi: true,
    );

    if (response != null && response is Map<String, dynamic>) {
      try {
        return DepartmentModel.fromJson(response);
      } catch (e) {
        print('Error parsing department: $e');
        return null;
      }
    }
    return null;
  }

  // Update department
  Future<bool> updateDepartment({
    required String token,
    required String departmentId,
    required UpdateDepartmentInput input,
  }) async {
    final response = await _serviceRepo.requist(
      'departments/$departmentId',
      method: 'PUT',
      body: input.toJson(),
      token: token,
      useOrgApi: true,
    );

    return response != null;
  }

  // Delete department
  Future<bool> deleteDepartment({
    required String token,
    required String departmentId,
  }) async {
    final response = await _serviceRepo.requist(
      'departments/$departmentId',
      method: 'DELETE',
      token: token,
      useOrgApi: true,
    );

    return response != null;
  }

  // Get doctors by department
  Future<List<DoctorInDepartment>?> getDoctorsByDepartment({
    required String token,
    required String departmentId,
    bool onlyActive = true,
  }) async {
    final queryParams = <String, String>{'only_active': onlyActive.toString()};

    final queryString = queryParams.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');

    final response = await _serviceRepo.requist(
      'departments/$departmentId/doctors?$queryString',
      method: 'GET',
      token: token,
      useOrgApi: true,
    );

    print('=== Doctors by Department API Response ===');
    print('Response: $response');
    print('Response type: ${response.runtimeType}');

    if (response != null && response is Map<String, dynamic>) {
      if (response['doctors'] != null) {
        final List<dynamic> doctorsJson = response['doctors'];
        print('Found ${doctorsJson.length} doctors');

        final doctors = doctorsJson
            .map((json) {
              try {
                return DoctorInDepartment.fromJson(
                  json as Map<String, dynamic>,
                );
              } catch (e) {
                print('Error parsing doctor: $e');
                print('Doctor JSON: $json');
                return null;
              }
            })
            .whereType<DoctorInDepartment>()
            .toList();

        print('Successfully parsed ${doctors.length} doctors');
        return doctors;
      }
    }

    return null;
  }

  // Get doctors by clinic ID
  Future<Map<String, dynamic>?> getDoctorsByClinic({
    required String token,
    required String clinicId,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     GET DOCTORS BY CLINIC API CALL                             ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📍 Endpoint: doctors/clinic/$clinicId');
      print('🔑 Token: ${token.substring(0, 20)}...');
      print('🏥 Clinic ID: $clinicId');
      print('');

      final response = await _serviceRepo.requist(
        'doctors/clinic/$clinicId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     API RESPONSE RECEIVED                                      ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📦 Response is null: ${response == null}');
      print('📦 Response type: ${response.runtimeType}');
      print('');

      if (response != null) {
        print('📋 FULL RESPONSE:');
        print(
          '═══════════════════════════════════════════════════════════════',
        );
        print(response);
        print(
          '═══════════════════════════════════════════════════════════════',
        );
        print('');

        if (response is Map<String, dynamic>) {
          print('🔍 Response Keys: ${response.keys.toList()}');
          print('');

          // Print clinic data
          if (response['clinic'] != null) {
            print('🏥 CLINIC DATA:');
            print('   ${response['clinic']}');
          }
          print('');

          // Print doctors data
          if (response['doctors'] != null) {
            final doctors = response['doctors'] as List<dynamic>;
            print('👨‍⚕️ DOCTORS DATA (${doctors.length} doctors):');
            for (var i = 0; i < doctors.length; i++) {
              print('   Doctor ${i + 1}:');
              print('   ${doctors[i]}');
              print('');
            }
          }

          // Print total count
          if (response['total_count'] != null) {
            print('📊 Total Count: ${response['total_count']}');
          }
          print('');

          return response;
        } else {
          print('❌ Response is not a Map<String, dynamic>');
          return null;
        }
      }

      print('❌ Response is null');
      return null;
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR IN getDoctorsByClinic                                ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      return null;
    }
  }
}
