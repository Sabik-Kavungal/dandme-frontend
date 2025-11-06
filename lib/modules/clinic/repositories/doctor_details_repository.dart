import 'package:a/core/config/service.dart';
import 'package:a/modules/clinic/models/appointment_model.dart';
import 'package:a/modules/clinic/models/clinic_doctor_links_model.dart';

class DoctorDetailsRepository {
  final ServiceRepo _serviceRepo = ServiceRepo();

  /// Get clinic doctor links by doctor ID (new API)
  Future<ClinicDoctorLinksResponse?> getClinicDoctorLinksByDoctor(
    String token,
    String doctorId,
  ) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     FETCHING CLINIC DOCTOR LINKS BY DOCTOR ID                  ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');

      final response = await _serviceRepo.requist(
        'organizations/clinic-doctor-links/doctor/$doctorId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print('📡 API Response: $response');

      if (response != null && response is Map<String, dynamic>) {
        final clinicDoctorLinks = ClinicDoctorLinksResponse.fromJson(response);
        print('✅ Successfully fetched clinic doctor links');
        print(
          '   Doctor: ${clinicDoctorLinks.doctor.firstName} ${clinicDoctorLinks.doctor.lastName}',
        );
        print('   Specialization: ${clinicDoctorLinks.doctor.specialization}');
        print('   Total Clinics: ${clinicDoctorLinks.totalClinics}');
        print('');
        return clinicDoctorLinks;
      } else {
        print('❌ Invalid response format');
        print('');
        return null;
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR FETCHING CLINIC DOCTOR LINKS                        ║',
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

  /// Get doctor details by ID (legacy API)
  Future<Doctor?> getDoctorById(String token, String doctorId) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     FETCHING DOCTOR DETAILS BY ID                             ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');

      final response = await _serviceRepo.requist(
        'doctors/$doctorId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print('📡 API Response: $response');

      if (response != null && response is Map<String, dynamic>) {
        final doctor = Doctor.fromJson(response);
        print('✅ Successfully fetched doctor details');
        print(
          '   Name: ${doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}'}',
        );
        print('   Specialization: ${doctor.specialization}');
        print('   Email: ${doctor.email}');
        print('   Phone: ${doctor.phone}');
        print('');
        return doctor;
      } else {
        print('❌ Invalid response format');
        print('');
        return null;
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR FETCHING DOCTOR DETAILS                             ║',
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

  /// Get all doctors for the clinic
  Future<List<Doctor>> getAllDoctors(String token) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     FETCHING ALL DOCTORS                                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );

      final response = await _serviceRepo.requist(
        'doctors',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      print('📡 API Response type: ${response.runtimeType}');

      if (response != null && response is List) {
        final doctors = response
            .map((json) => Doctor.fromJson(json as Map<String, dynamic>))
            .toList();

        print('✅ Successfully fetched ${doctors.length} doctors');
        for (final doctor in doctors) {
          print(
            '   - ${doctor.fullName ?? '${doctor.firstName} ${doctor.lastName}'} (ID: ${doctor.id})',
          );
        }
        print('');
        return doctors;
      } else {
        print('❌ Invalid response format');
        print('');
        return [];
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR FETCHING ALL DOCTORS                                 ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      return [];
    }
  }

  /// Get doctors by department
  Future<List<Doctor>> getDoctorsByDepartment(
    String token,
    String departmentId,
  ) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     FETCHING DOCTORS BY DEPARTMENT                             ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Department ID: $departmentId');

      final response = await _serviceRepo.requist(
        'doctors?department_id=$departmentId',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is List) {
        final doctors = response
            .map((json) => Doctor.fromJson(json as Map<String, dynamic>))
            .toList();

        print(
          '✅ Successfully fetched ${doctors.length} doctors for department',
        );
        print('');
        return doctors;
      } else {
        print('❌ Invalid response format');
        print('');
        return [];
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR FETCHING DOCTORS BY DEPARTMENT                       ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('❌ Error: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('');
      return [];
    }
  }

  /// Update doctor details
  Future<Doctor?> updateDoctorDetails({
    required String token,
    required String doctorId,
    required Map<String, dynamic> updateData,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     UPDATING DOCTOR DETAILS                                    ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('👨‍⚕️ Doctor ID: $doctorId');
      print('📝 Update Data: $updateData');

      final response = await _serviceRepo.requist(
        'doctors/$doctorId',
        method: 'PUT',
        body: updateData,
        token: token,
        useOrgApi: true,
      );

      if (response != null && response is Map<String, dynamic>) {
        final doctor = Doctor.fromJson(response);
        print('✅ Successfully updated doctor details');
        print('');
        return doctor;
      } else {
        print('❌ Invalid response format');
        print('');
        return null;
      }
    } catch (e, stackTrace) {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     ERROR UPDATING DOCTOR DETAILS                              ║',
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
