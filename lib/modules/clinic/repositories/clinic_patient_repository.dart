import 'dart:convert';
import 'package:a/core/config/service.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart';

class ClinicPatientRepository {
  final ServiceRepo _serviceRepo;

  ClinicPatientRepository(this._serviceRepo);

  /// Create a new clinic-specific patient with all fields
  Future<CreateClinicPatientResponse?> createPatient({
    required String token,
    required String clinicId,
    required String firstName,
    required String lastName,
    required String phone,
    String? email,
    String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    String? moId,
    String? medicalHistory,
    String? allergies,
    String? bloodGroup,
    String? smokingStatus,
    String? alcoholUse,
    int? heightCm,
    int? weightKg,
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     CREATING CLINIC PATIENT (FULL DETAILS)                    ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Clinic ID: $clinicId');
      print('👤 Name: $firstName $lastName');
      print('📞 Phone: $phone');
      if (age != null) print('🎂 Age: $age years');
      if (district != null) print('📍 District: $district');
      print('');

      final body = {
        'clinic_id': clinicId,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        if (email != null) 'email': email,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (age != null) 'age': age,
        if (gender != null) 'gender': gender,
        if (address1 != null) 'address1': address1,
        if (address2 != null) 'address2': address2,
        if (district != null) 'district': district,
        if (state != null) 'state': state,
        if (moId != null) 'mo_id': moId,
        if (medicalHistory != null) 'medical_history': medicalHistory,
        if (allergies != null) 'allergies': allergies,
        if (bloodGroup != null) 'blood_group': bloodGroup,
        if (smokingStatus != null) 'smoking_status': smokingStatus,
        if (alcoholUse != null) 'alcohol_use': alcoholUse,
        if (heightCm != null) 'height_cm': heightCm,
        if (weightKg != null) 'weight_kg': weightKg,
      };

      print('📤 Request Body:');
      print(jsonEncode(body));
      print('');

      final response = await _serviceRepo.requist(
        'organizations/clinic-specific-patients',
        method: 'POST',
        token: token,
        body: body,
        useOrgApi: true, // Use organization API (port 8081)
      );

      print('📥 Response:');
      print(jsonEncode(response));
      print('');

      if (response != null) {
        final result = CreateClinicPatientResponse.fromJson(response);
        print('✅ Patient Created Successfully!');
        print('   ID: ${result.patient.id}');
        print('   Name: ${result.patient.fullName}');
        print('   Phone: ${result.patient.phone}');
        if (result.patient.age != null) print('   Age: ${result.patient.age}');
        if (result.patient.district != null)
          print('   District: ${result.patient.district}');
        print('');
        return result;
      }

      return null;
    } catch (e) {
      print('❌ Error creating patient: $e');
      print('');
      rethrow;
    }
  }

  /// List all patients for a clinic
  /// ✅ UPDATED: Now properly handles restored backend follow-up data!
  /// Pass doctorId and departmentId to get eligibility for THAT specific doctor+department
  Future<ListClinicPatientsResponse?> listPatients({
    required String token,
    required String clinicId,
    bool onlyActive = true,
    String? doctorId, // ✅ For contextual follow-up eligibility
    String? departmentId, // ✅ For contextual follow-up eligibility
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     LISTING CLINIC PATIENTS (WITH RESTORED BACKEND)           ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Clinic ID: $clinicId');
      print('🔍 Only Active: $onlyActive');
      if (doctorId != null) print('👨‍⚕️ Doctor Context: $doctorId');
      if (departmentId != null) print('🏢 Department Context: $departmentId');
      print('');

      final queryParams = {
        'clinic_id': clinicId,
        if (onlyActive) 'only_active': 'true',
        if (doctorId != null && doctorId.isNotEmpty)
          'doctor_id': doctorId, // ✅ Pass doctor context
        if (departmentId != null && departmentId.isNotEmpty)
          'department_id': departmentId, // ✅ Pass department context
      };

      final response = await _serviceRepo.requist(
        'organizations/clinic-specific-patients?${Uri(queryParameters: queryParams).query}',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        final result = ListClinicPatientsResponse.fromJson(response);
        print('✅ Found ${result.total} patients');

        // ✅ ENHANCED: Log follow-up data from restored backend
        for (var patient in result.patients) {
          print('   - ${patient.fullName} (${patient.phone})');
          print(
            '     ✅ BACKEND RESTORED: eligibleFollowUps.length: ${patient.eligibleFollowUps.length}',
          );
          print(
            '     ✅ BACKEND RESTORED: expiredFollowups.length: ${patient.expiredFollowups.length}',
          );

          if (patient.eligibleFollowUps.isNotEmpty) {
            print('     🟢 BACKEND SAYS: FREE FOLLOW-UP AVAILABLE!');
            for (var f in patient.eligibleFollowUps) {
              print(
                '        → ${f.doctorName} (${f.department}) - ${f.remainingDays}d',
              );
            }
          } else {
            print('     ⚪ BACKEND SAYS: No free follow-ups available');
          }
        }
        print('');
        return result;
      }

      return null;
    } catch (e) {
      print('❌ Error listing patients: $e');
      print('');
      rethrow;
    }
  }

  /// Search patients by name, phone, or MO ID
  /// ✅ UPDATED: Now properly handles restored backend follow-up data!
  /// Pass doctorId and departmentId to get eligibility for THAT specific doctor+department
  Future<ListClinicPatientsResponse?> searchPatients({
    required String token,
    required String clinicId,
    required String searchQuery,
    bool onlyActive = true,
    String? doctorId, // ✅ For contextual follow-up eligibility
    String? departmentId, // ✅ For contextual follow-up eligibility
  }) async {
    try {
      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║     SEARCHING CLINIC PATIENTS (WITH RESTORED BACKEND)         ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('🏥 Clinic ID: $clinicId');
      print('🔍 Search: "$searchQuery"');
      if (doctorId != null) print('👨‍⚕️ Doctor Context: $doctorId');
      if (departmentId != null) print('🏢 Department Context: $departmentId');
      print('');

      final queryParams = {
        'clinic_id': clinicId,
        'search': searchQuery,
        if (onlyActive) 'only_active': 'true',
        if (doctorId != null && doctorId.isNotEmpty)
          'doctor_id': doctorId, // ✅ Pass doctor context
        if (departmentId != null && departmentId.isNotEmpty)
          'department_id': departmentId, // ✅ Pass department context
      };

      final response = await _serviceRepo.requist(
        'organizations/clinic-specific-patients?${Uri(queryParameters: queryParams).query}',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        final result = ListClinicPatientsResponse.fromJson(response);
        print('✅ Found ${result.total} patients matching "$searchQuery"');

        // ✅ ENHANCED: Log follow-up data from restored backend
        for (var patient in result.patients) {
          print('   - ${patient.fullName} (${patient.phone})');
          print(
            '     ✅ BACKEND RESTORED: eligibleFollowUps.length: ${patient.eligibleFollowUps.length}',
          );
          print(
            '     ✅ BACKEND RESTORED: expiredFollowups.length: ${patient.expiredFollowups.length}',
          );

          if (patient.eligibleFollowUps.isNotEmpty) {
            print('     🟢 BACKEND SAYS: FREE FOLLOW-UP AVAILABLE!');
            for (var f in patient.eligibleFollowUps) {
              print(
                '        → ${f.doctorName} (${f.department}) - ${f.remainingDays}d',
              );
            }
          } else {
            print('     ⚪ BACKEND SAYS: No free follow-ups available');
          }

          if (patient.expiredFollowups.isNotEmpty) {
            print('     🔴 BACKEND SAYS: EXPIRED FOLLOW-UPS FOUND!');
            for (var e in patient.expiredFollowups) {
              print(
                '        → ${e.doctorName} (${e.department}) - Expired: ${e.expiredOn}',
              );
            }
          }
        }
        print('');
        return result;
      }

      return null;
    } catch (e) {
      print('❌ Error searching patients: $e');
      print('');
      rethrow;
    }
  }

  /// Get single clinic patient by ID
  /// ✅ Works with both path (/:id) and query (?patient_id=...) formats
  /// ✅ Handles restored backend follow-up data cleanly
  Future<ClinicPatient?> getPatient({
    required String token,
    required String patientId,
    String? clinicId, // optional clinic_id filter
    String? doctorId, // for contextual follow-up eligibility
    String? departmentId, // for contextual follow-up eligibility
  }) async {
    try {
      // Build query parameters (used in both formats)
      final Map<String, String> baseQueryParams = {};

      if (clinicId?.isNotEmpty == true)
        baseQueryParams['clinic_id'] = clinicId!;
      if (doctorId?.isNotEmpty == true)
        baseQueryParams['doctor_id'] = doctorId!;
      if (departmentId?.isNotEmpty == true) {
        baseQueryParams['department_id'] = departmentId!;
      }

      /// -------------------------------
      /// 1️⃣ Try Query Parameter Format
      /// GET /clinic-specific-patients?patient_id=...&clinic_id=...
      /// -------------------------------
      final queryFormatParams = Map<String, String>.from(baseQueryParams)
        ..['patient_id'] = patientId;

      final queryString = queryFormatParams.isNotEmpty
          ? '?${Uri(queryParameters: queryFormatParams).query}'
          : '';

      var response = await _serviceRepo.requist(
        'organizations/clinic-specific-patients$queryString',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      /// -------------------------------
      /// 2️⃣ If not found → Try Path Format
      /// GET /clinic-specific-patients/:id?clinic_id=...
      /// -------------------------------
      if (response == null || response['patient'] == null) {
        final pathQueryString = baseQueryParams.isNotEmpty
            ? '?${Uri(queryParameters: baseQueryParams).query}'
            : '';

        response = await _serviceRepo.requist(
          'organizations/clinic-specific-patients/$patientId$pathQueryString',
          method: 'GET',
          token: token,
          useOrgApi: true,
        );
      }

      /// -------------------------------
      /// 3️⃣ Parse and Return Response
      /// -------------------------------
      if (response != null && response['patient'] != null) {
        final patient = ClinicPatient.fromJson(response['patient']);

        // ✅ Log backend follow-up info (for debug)
        print('✅ BACKEND RESTORED: ${patient.fullName}');
        print('   eligibleFollowUps: ${patient.eligibleFollowUps.length}');
        print('   expiredFollowUps:  ${patient.expiredFollowups.length}');

        return patient;
      } else {
        print('⚠️ No patient found for ID: $patientId');
      }

      return null;
    } catch (e, stack) {
      print('❌ Error getting patient: $e');
      print(stack);
      rethrow;
    }
  }

  /// Update patient information
  Future<ClinicPatient?> updatePatient({
    required String token,
    required String patientId,
    required Map<String, dynamic> updates,
    String? clinicId,
  }) async {
    try {
      // Include clinic_id in request body if provided (required by backend)
      final requestBody = Map<String, dynamic>.from(updates);
      if (clinicId != null && clinicId.isNotEmpty) {
        requestBody['clinic_id'] = clinicId;
      }

      print('');
      print(
        '╔════════════════════════════════════════════════════════════════╗',
      );
      print(
        '║              UPDATE CLINIC PATIENT API CALL                   ║',
      );
      print(
        '╚════════════════════════════════════════════════════════════════╝',
      );
      print('📤 PUT /organizations/clinic-specific-patients/$patientId');
      print('📦 Request Body:');
      print('   ${requestBody.toString()}');
      print('');

      final response = await _serviceRepo.requist(
        'organizations/clinic-specific-patients/$patientId',
        method: 'PUT',
        token: token,
        body: requestBody,
        useOrgApi: true,
      );

      print('📥 API Response:');
      print('   ${response?.toString() ?? 'null'}');
      print('');

      if (response != null && response['patient'] != null) {
        print('✅ SUCCESS: Patient updated successfully');
        print('📋 Updated Patient Data:');
        print('   ${response['patient'].toString()}');
        print('');

        final patient = ClinicPatient.fromJson(response['patient']);
        print('✅ Parsed ClinicPatient:');
        print('   ID: ${patient.id}');
        print('   Name: ${patient.fullName}');
        print('   Phone: ${patient.phone}');
        print('   Email: ${patient.email ?? 'N/A'}');
        print('   Clinic ID: ${patient.clinicId}');
        print('');

        return patient;
      }

      print('⚠️ WARNING: Response is null or missing patient data');
      print('');
      return null;
    } catch (e) {
      print('❌ Error updating patient: $e');
      print('');
      rethrow;
    }
  }

  /// Delete (soft delete) patient
  Future<bool> deletePatient({
    required String token,
    required String patientId,
  }) async {
    try {
      final response = await _serviceRepo.requist(
        'organizations/clinic-specific-patients/$patientId',
        method: 'DELETE',
        token: token,
        useOrgApi: true,
      );

      return response != null;
    } catch (e) {
      print('❌ Error deleting patient: $e');
      rethrow;
    }
  }

  /// ✅ NEW: Check follow-up eligibility for specific doctor+department
  /// This is the BEST way to get real-time follow-up status!
  Future<FollowUpEligibilityResponse?> checkFollowUpEligibility({
    required String token,
    required String clinicPatientId,
    required String clinicId,
    required String doctorId,
    String? departmentId,
  }) async {
    try {
      print('');
      print('🔍 CHECKING FOLLOW-UP ELIGIBILITY VIA API...');
      print('   Patient ID: $clinicPatientId');
      print('   Clinic ID: $clinicId');
      print('   Doctor ID: $doctorId');
      print('   Department ID: $departmentId');

      final queryParams = <String, String>{
        'clinic_patient_id': clinicPatientId,
        'clinic_id': clinicId,
        'doctor_id': doctorId,
        if (departmentId != null && departmentId.isNotEmpty)
          'department_id': departmentId,
      };

      final response = await _serviceRepo.requist(
        'organizations/appointments/followup-eligibility?${Uri(queryParameters: queryParams).query}',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        final result = FollowUpEligibilityResponse.fromJson(response);
        print('✅ Follow-up eligibility check successful');
        print('   Is Free: ${result.isFree}');
        print('   Is Eligible: ${result.isEligible}');
        print('   Message: ${result.message}');
        if (result.followupDetails != null) {
          print('   Days Remaining: ${result.followupDetails!.daysRemaining}');
        }
        return result;
      } else {
        print('❌ Follow-up eligibility check failed');
        return null;
      }
    } catch (e) {
      print('❌ Error checking follow-up eligibility: $e');
      return null;
    }
  }

  /// ✅ NEW: Get all active follow-ups for a patient
  Future<ActiveFollowUpsResponse?> getActiveFollowUps({
    required String token,
    required String clinicPatientId,
    required String clinicId,
  }) async {
    try {
      print('');
      print('🔍 GETTING ACTIVE FOLLOW-UPS VIA API...');
      print('   Patient ID: $clinicPatientId');
      print('   Clinic ID: $clinicId');

      final queryParams = <String, String>{
        'clinic_patient_id': clinicPatientId,
        'clinic_id': clinicId,
      };

      final response = await _serviceRepo.requist(
        'organizations/appointments/followup-eligibility/active?${Uri(queryParameters: queryParams).query}',
        method: 'GET',
        token: token,
        useOrgApi: true,
      );

      if (response != null) {
        final result = ActiveFollowUpsResponse.fromJson(response);
        print('✅ Active follow-ups retrieved successfully');
        print('   Total Count: ${result.totalCount}');
        for (var followUp in result.activeFollowups) {
          print(
            '   - ${followUp.doctorName} (${followUp.departmentName}) - ${followUp.daysRemaining} days',
          );
        }
        return result;
      } else {
        print('❌ Failed to get active follow-ups');
        return null;
      }
    } catch (e) {
      print('❌ Error getting active follow-ups: $e');
      return null;
    }
  }
}
