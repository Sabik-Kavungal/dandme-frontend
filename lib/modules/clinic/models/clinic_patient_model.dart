import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/clinic_patient_model.freezed.dart';
part '../gen/clinic_patient_model.g.dart';

// ✅ NEW: Follow-up eligibility API response models
@freezed
class FollowUpEligibilityResponse with _$FollowUpEligibilityResponse {
  const factory FollowUpEligibilityResponse({
    @JsonKey(name: 'is_free') required bool isFree,
    @JsonKey(name: 'is_eligible') required bool isEligible,
    required String message,
    @JsonKey(name: 'followup_details') FollowUpDetails? followupDetails,
  }) = _FollowUpEligibilityResponse;

  factory FollowUpEligibilityResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowUpEligibilityResponseFromJson(json);
}

@freezed
class FollowUpDetails with _$FollowUpDetails {
  const factory FollowUpDetails({
    @JsonKey(name: 'followup_id') String? followupId,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'department_id') String? departmentId,
  }) = _FollowUpDetails;

  factory FollowUpDetails.fromJson(Map<String, dynamic> json) =>
      _$FollowUpDetailsFromJson(json);
}

@freezed
class ActiveFollowUpsResponse with _$ActiveFollowUpsResponse {
  const factory ActiveFollowUpsResponse({
    @JsonKey(name: 'active_followups')
    required List<ActiveFollowUp> activeFollowups,
    @JsonKey(name: 'total_count') required int totalCount,
  }) = _ActiveFollowUpsResponse;

  factory ActiveFollowUpsResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveFollowUpsResponseFromJson(json);
}

@freezed
class ActiveFollowUp with _$ActiveFollowUp {
  const factory ActiveFollowUp({
    @JsonKey(name: 'followup_id') required String followupId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') required String doctorName,
    @JsonKey(name: 'department_id') required String departmentId,
    @JsonKey(name: 'department_name') required String departmentName,
    @JsonKey(name: 'appointment_id') required String appointmentId,
    @JsonKey(name: 'appointment_date') required String appointmentDate,
    @JsonKey(name: 'valid_until') required String validUntil,
    @JsonKey(name: 'days_remaining') required int daysRemaining,
    @JsonKey(name: 'is_free') required bool isFree,
  }) = _ActiveFollowUp;

  factory ActiveFollowUp.fromJson(Map<String, dynamic> json) =>
      _$ActiveFollowUpFromJson(json);
}

@freezed
class ClinicPatient with _$ClinicPatient {
  const factory ClinicPatient({
    required String id,
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,
    @JsonKey(name: 'alcohol_use') String? alcoholUse,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'global_patient_id') String? globalPatientId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,

    // ✅ NEW: Status fields from clinic_patients table
    @JsonKey(name: 'current_followup_status') String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') String? lastFollowupId,

    // ✅ NEW: Full appointments array with all fields
    @JsonKey(name: 'appointments')
    @Default([])
    List<AppointmentDetail> appointments,

    // ✅ NEW: Full follow-ups array with all fields
    @JsonKey(name: 'follow_ups') @Default([]) List<FollowUpDetail> followUps,

    // ✅ LEGACY: Appointment history fields (for backward compatibility)
    @JsonKey(name: 'last_appointment') LastAppointmentInfo? lastAppointment,
    @JsonKey(name: 'follow_up_eligibility')
    FollowUpEligibility? followUpEligibility,
    @JsonKey(name: 'total_appointments') @Default(0) int totalAppointments,
    // ✅ LEGACY: Multiple eligible follow-ups support (for backward compatibility)
    @JsonKey(name: 'appointments_history')
    @Default([])
    List<AppointmentHistoryItem> appointmentsHistory,
    @JsonKey(name: 'eligible_follow_ups')
    @Default([])
    List<EligibleFollowUp> eligibleFollowUps,
    // ✅ LEGACY: Expired follow-ups that need renewal
    @JsonKey(name: 'expired_followups')
    @Default([])
    List<ExpiredFollowUp> expiredFollowups,
  }) = _ClinicPatient;

  factory ClinicPatient.fromJson(Map<String, dynamic> json) =>
      _$ClinicPatientFromJson(json);
}

// Extension to get full name and follow-up eligibility
extension ClinicPatientExtension on ClinicPatient {
  String get fullName => '$firstName $lastName';

  /// ✅ Check current follow-up status from new API
  String? get currentFollowUpStatus => currentFollowupStatus;

  /// ✅ Check if patient has ANY active follow-ups from new API
  bool get hasActiveFollowUps => followUps.any((fu) => fu.status == 'active');

  /// ✅ Check if patient has free follow-up available from new API
  bool get hasFreeFollowUpAvailable =>
      followUps.any((fu) => fu.status == 'active' && fu.isFree);

  /// Check if patient is eligible for follow-up appointment (LEGACY - single follow-up)
  bool get canBookFollowUp => followUpEligibility?.eligible ?? false;

  /// ✅ NEW: Check if patient has ANY eligible follow-ups (backward compatibility)
  bool get hasEligibleFollowUps => eligibleFollowUps.isNotEmpty;

  /// ✅ NEW: Count of FREE follow-ups available
  int get freeFollowUpsCount => eligibleFollowUps.length;

  /// ✅ NEW: Check if eligible for specific doctor+department
  bool isEligibleFor({required String doctorId, String? departmentId}) {
    print('   🔍 isEligibleFor: Checking eligibleFollowUps array...');
    for (var i = 0; i < eligibleFollowUps.length; i++) {
      final f = eligibleFollowUps[i];
      print(
        '      [$i] doctorId: ${f.doctorId}, departmentId: ${f.departmentId}',
      );
      print('         Match doctor: ${f.doctorId == doctorId}');
      print(
        '         Match dept: ${departmentId == null || f.departmentId == departmentId}',
      );
    }

    final result = eligibleFollowUps.any(
      (followUp) =>
          followUp.doctorId == doctorId &&
          (departmentId == null || followUp.departmentId == departmentId),
    );

    print('   → isEligibleFor result: $result');
    return result;
  }

  /// ✅ NEW: Get follow-up for specific doctor+department from new API
  FollowUpDetail? getFollowUpDetailFor({
    required String doctorId,
    String? departmentId,
  }) {
    try {
      return followUps.firstWhere(
        (fu) =>
            fu.doctorId == doctorId &&
            (departmentId == null || fu.departmentId == departmentId),
      );
    } catch (e) {
      return null;
    }
  }

  /// ✅ LEGACY: Get follow-up for specific doctor+department (backward compatibility)
  EligibleFollowUp? getFollowUpFor({
    required String doctorId,
    String? departmentId,
  }) {
    try {
      return eligibleFollowUps.firstWhere(
        (followUp) =>
            followUp.doctorId == doctorId &&
            (departmentId == null || followUp.departmentId == departmentId),
      );
    } catch (e) {
      return null;
    }
  }

  /// ✅ NEW: Get all active follow-ups from new API
  List<FollowUpDetail> get activeFollowUps =>
      followUps.where((fu) => fu.status == 'active').toList();

  /// ✅ NEW: Get all expired follow-ups from new API
  List<FollowUpDetail> get expiredFollowUps =>
      followUps.where((fu) => fu.status == 'expired').toList();

  /// ✅ NEW: Get all used follow-ups from new API
  List<FollowUpDetail> get usedFollowUps =>
      followUps.where((fu) => fu.status == 'used').toList();

  /// ✅ NEW: Get all renewed follow-ups from new API
  List<FollowUpDetail> get renewedFollowUps =>
      followUps.where((fu) => fu.status == 'renewed').toList();

  /// ✅ LEGACY: Get all active appointments (backward compatibility)
  List<AppointmentHistoryItem> get activeAppointments =>
      appointmentsHistory.where((apt) => apt.status == 'active').toList();

  /// ✅ LEGACY: Get all expired appointments (backward compatibility)
  List<AppointmentHistoryItem> get expiredAppointments =>
      appointmentsHistory.where((apt) => apt.status == 'expired').toList();

  /// ✅ LEGACY: Get appointments where free follow-up was used (backward compatibility)
  List<AppointmentHistoryItem> get usedFollowUpAppointments =>
      appointmentsHistory.where((apt) => apt.freeFollowUpUsed).toList();

  /// ✅ UPDATED: Get follow-up status for specific doctor+department
  /// Returns: 'free', 'used', 'expired', 'renewed', or 'no_appointment'
  /// Uses new API structure with follow_ups array
  String getFollowUpStatus({required String doctorId, String? departmentId}) {
    print('🔍 getFollowUpStatus called (NEW API):');
    print('   doctorId: $doctorId');
    print('   departmentId: $departmentId');
    print('   followUps.length: ${followUps.length}');
    print('   appointments.length: ${appointments.length}');

    // ✅ STEP 1: Check new API follow_ups array first
    final matchingFollowUps = followUps
        .where(
          (fu) =>
              fu.doctorId == doctorId &&
              (departmentId == null || fu.departmentId == departmentId),
        )
        .toList();

    print('   matchingFollowUps: ${matchingFollowUps.length}');

    if (matchingFollowUps.isNotEmpty) {
      final latestFollowUp = matchingFollowUps.first;
      print('   → Status: ${latestFollowUp.status}');
      return latestFollowUp.status; // Use status from new API
    }

    // ✅ STEP 2: Fall back to legacy eligible_follow_ups
    final isFreeEligible = isEligibleFor(
      doctorId: doctorId,
      departmentId: departmentId,
    );

    if (isFreeEligible) {
      print('   → Status: FREE (from legacy API)');
      return 'active';
    }

    // ✅ STEP 3: Check if patient has ANY regular appointments with this doctor+department
    final matchingRegularAppointments = appointments
        .where(
          (apt) =>
              apt.doctorId == doctorId &&
              (departmentId == null || apt.departmentId == departmentId) &&
              !apt.isFollowUpAppointment, // Only regular appointments
        )
        .toList();

    if (matchingRegularAppointments.isEmpty) {
      print('   → Status: NO_APPOINTMENT ⚪');
      return 'no_appointment';
    }

    // ✅ Patient has regular appointments but NO follow-ups
    // This means they need to book a REGULAR appointment (not follow-up)
    // Regular appointment will create a FREE follow-up for next time
    print('   → Status: NEEDS_REGULAR 📅');
    return 'needs_regular';
  }

  /// ✅ SIMPLIFIED: Get follow-up status label
  /// Now trusts backend's eligible_follow_ups[] array completely
  String getFollowUpStatusLabel({
    required String doctorId,
    String? departmentId,
  }) {
    final status = getFollowUpStatus(
      doctorId: doctorId,
      departmentId: departmentId,
    );

    switch (status) {
      case 'active':
      case 'free':
        return '🟢 Free Follow-Up Eligible';
      case 'used':
        return '⚠️ Free Follow-Up Already Used';
      case 'expired':
        return '⏰ Free Follow-Up Expired';
      case 'paid_expired':
        return '🟠 Paid Follow-Up Required';
      case 'needs_regular':
        return '📅 Needs Regular Appointment First';
      case 'no_appointment':
        return '⚪ No Previous Appointment';
      default:
        return '';
    }
  }

  /// ✅ NEW: Get the last REGULAR appointment (base for follow-up eligibility)
  /// Returns the appointment that grants the current follow-up eligibility
  /// Uses new API appointment detail structure
  AppointmentDetail? getLastRegularAppointmentFromDetail({
    required String doctorId,
    String? departmentId,
  }) {
    // Filter appointments by doctor+department from new API
    final matchingAppointments = appointments.where(
      (apt) =>
          apt.doctorId == doctorId &&
          (departmentId == null || apt.departmentId == departmentId) &&
          !apt.isFollowUpAppointment, // Not a follow-up appointment
    );

    try {
      return matchingAppointments.first;
    } catch (e) {
      return null;
    }
  }

  /// ✅ LEGACY: Get the last REGULAR appointment (base for follow-up eligibility)
  /// Returns the appointment that grants the current follow-up eligibility
  AppointmentHistoryItem? getLastRegularAppointment({
    required String doctorId,
    String? departmentId,
  }) {
    // Filter appointments by doctor+department
    final matchingAppointments = appointmentsHistory.where(
      (apt) =>
          apt.doctorId == doctorId &&
          (departmentId == null || apt.departmentId == departmentId),
    );

    // Find last REGULAR appointment (not follow-up)
    // Regular appointments have status 'active' or 'expired' but NOT follow_up_eligible set by follow-up type
    try {
      return matchingAppointments.firstWhere(
        (apt) => apt.status == 'active' || apt.status == 'expired',
      );
    } catch (e) {
      return null;
    }
  }

  /// ✅ FIXED: Get follow-up reset explanation
  /// Explains which regular appointment granted the current eligibility
  /// Simplified to trust backend's eligible_follow_ups[] array
  String getFollowUpResetExplanation({
    required String doctorId,
    String? departmentId,
  }) {
    final status = getFollowUpStatus(
      doctorId: doctorId,
      departmentId: departmentId,
    );

    final lastRegular = getLastRegularAppointment(
      doctorId: doctorId,
      departmentId: departmentId,
    );

    if (lastRegular == null) {
      return 'No regular appointment found';
    }

    switch (status) {
      case 'free':
        return 'Based on your ${lastRegular.appointmentDate} appointment. Free follow-up will reset with each new regular appointment.';
      case 'paid_expired':
        return 'Free follow-up for ${lastRegular.appointmentDate} appointment not available (expired or used). Book a new regular appointment to get another free follow-up!';
      default:
        return '';
    }
  }

  /// ✅ NEW: Count total regular appointments with doctor+department (from new API)
  int countRegularAppointmentsFromDetail({
    required String doctorId,
    String? departmentId,
  }) {
    return appointments
        .where(
          (apt) =>
              apt.doctorId == doctorId &&
              (departmentId == null || apt.departmentId == departmentId) &&
              !apt.isFollowUpAppointment, // Not a follow-up appointment
        )
        .length;
  }

  /// ✅ NEW: Count total follow-ups with doctor+department (from new API)
  int countFollowUpAppointmentsFromDetail({
    required String doctorId,
    String? departmentId,
  }) {
    return appointments
        .where(
          (apt) =>
              apt.doctorId == doctorId &&
              (departmentId == null || apt.departmentId == departmentId) &&
              apt.isFollowUpAppointment, // Is a follow-up appointment
        )
        .length;
  }

  /// ✅ LEGACY: Count total regular appointments with doctor+department
  int countRegularAppointments({
    required String doctorId,
    String? departmentId,
  }) {
    return appointmentsHistory
        .where(
          (apt) =>
              apt.doctorId == doctorId &&
              (departmentId == null || apt.departmentId == departmentId) &&
              (apt.status == 'active' || apt.status == 'expired'),
        )
        .length;
  }

  /// ✅ LEGACY: Count total follow-ups with doctor+department
  int countFollowUpAppointments({
    required String doctorId,
    String? departmentId,
  }) {
    return appointmentsHistory
        .where(
          (apt) =>
              apt.doctorId == doctorId &&
              (departmentId == null || apt.departmentId == departmentId) &&
              apt.followUpEligible,
        )
        .length;
  }

  /// ✅ NEW: Check if has expired follow-up for specific doctor+department
  bool hasExpiredFollowUpFor({required String doctorId, String? departmentId}) {
    return expiredFollowups.any(
      (expired) =>
          expired.doctorId == doctorId &&
          (departmentId == null || expired.departmentId == departmentId),
    );
  }

  /// ✅ NEW: Get expired follow-up for specific doctor+department
  ExpiredFollowUp? getExpiredFollowUpFor({
    required String doctorId,
    String? departmentId,
  }) {
    try {
      return expiredFollowups.firstWhere(
        (expired) =>
            expired.doctorId == doctorId &&
            (departmentId == null || expired.departmentId == departmentId),
      );
    } catch (e) {
      return null;
    }
  }

  /// ✅ NEW: Get enhanced follow-up status with renewal information
  /// Returns: 'free', 'used', 'expired_needs_renewal', 'paid_expired', 'no_appointment'
  /// Uses new API structure with follow_ups array
  String getEnhancedFollowUpStatus({
    required String doctorId,
    String? departmentId,
  }) {
    // ✅ STEP 1: Check new API follow_ups array first
    final matchingFollowUps = followUps
        .where(
          (fu) =>
              fu.doctorId == doctorId &&
              (departmentId == null || fu.departmentId == departmentId),
        )
        .toList();

    if (matchingFollowUps.isNotEmpty) {
      final latestFollowUp = matchingFollowUps.first;
      switch (latestFollowUp.status) {
        case 'active':
          return 'free';
        case 'used':
          return 'used';
        case 'expired':
          return 'expired_needs_renewal';
        case 'renewed':
          return 'renewed';
        default:
          return latestFollowUp.status;
      }
    }

    // ✅ STEP 2: Fall back to legacy API
    // Check if in eligible_follow_ups (FREE)
    if (isEligibleFor(doctorId: doctorId, departmentId: departmentId)) {
      return 'free'; // 🟢 Free Follow-Up Available
    }

    // Check if in expired_followups (NEEDS RENEWAL)
    if (hasExpiredFollowUpFor(doctorId: doctorId, departmentId: departmentId)) {
      return 'expired_needs_renewal'; // 🔴 Expired - Book Regular to Renew
    }

    // ✅ STEP 3: Check appointments for more details (use legacy array)
    final matchingAppointments = appointmentsHistory.where(
      (apt) =>
          apt.doctorId == doctorId &&
          (departmentId == null || apt.departmentId == departmentId),
    );

    if (matchingAppointments.isEmpty) {
      return 'no_appointment'; // ⚪ No Previous Appointment
    }

    // Has appointments - check follow_up_status field if available
    final latestAppointment = matchingAppointments.first;
    if (latestAppointment.followUpStatus == 'used') {
      return 'used'; // 🟠 Free Follow-Up Used (can book paid)
    }

    return 'paid_expired'; // 🟠 Paid Follow-Up Required
  }

  /// ✅ NEW: Get status label with renewal information
  String getEnhancedStatusLabel({
    required String doctorId,
    String? departmentId,
  }) {
    final status = getEnhancedFollowUpStatus(
      doctorId: doctorId,
      departmentId: departmentId,
    );

    switch (status) {
      case 'free':
        final followUp = getFollowUpFor(
          doctorId: doctorId,
          departmentId: departmentId,
        );
        if (followUp?.nextFollowupExpiry != null) {
          return '🟢 Free Follow-Up (Expires: ${followUp!.nextFollowupExpiry})';
        }
        return '🟢 Free Follow-Up Eligible';

      case 'used':
        return '🟠 Free Follow-Up Used (Paid follow-ups available)';

      case 'expired_needs_renewal':
        final expired = getExpiredFollowUpFor(
          doctorId: doctorId,
          departmentId: departmentId,
        );
        return '🔴 Follow-Up Expired (Book regular to restart) - ${expired?.note ?? ''}';

      case 'paid_expired':
        return '🟠 Paid Follow-Up Required';

      case 'no_appointment':
        return '⚪ No Previous Appointment';

      default:
        return '';
    }
  }
}

/// Last appointment information for follow-up eligibility
@freezed
class LastAppointmentInfo with _$LastAppointmentInfo {
  const factory LastAppointmentInfo({
    required String id,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') required String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    String? department,
    required String date,
    String? status,
    @JsonKey(name: 'days_since') required int daysSince,
  }) = _LastAppointmentInfo;

  factory LastAppointmentInfo.fromJson(Map<String, dynamic> json) =>
      _$LastAppointmentInfoFromJson(json);
}

/// Follow-up eligibility information
@freezed
class FollowUpEligibility with _$FollowUpEligibility {
  const factory FollowUpEligibility({
    required bool eligible,
    @JsonKey(name: 'is_free')
    @Default(false)
    bool isFree, // ✅ NEW: Is follow-up free?
    String? reason,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    String? message, // ✅ NEW: Additional info message
  }) = _FollowUpEligibility;

  factory FollowUpEligibility.fromJson(Map<String, dynamic> json) =>
      _$FollowUpEligibilityFromJson(json);
}

/// ✅ NEW: Appointment history item (for full patient history)
@freezed
class AppointmentHistoryItem with _$AppointmentHistoryItem {
  const factory AppointmentHistoryItem({
    @JsonKey(name: 'appointment_id') required String appointmentId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') required String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    required String department,
    @JsonKey(name: 'appointment_date') required String appointmentDate,
    @JsonKey(name: 'days_since') required int daysSince,
    @JsonKey(name: 'validity_days') @Default(5) int validityDays,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    required String status, // active, expired, future
    @JsonKey(name: 'follow_up_eligible') @Default(false) bool followUpEligible,
    @JsonKey(name: 'free_follow_up_used') @Default(false) bool freeFollowUpUsed,
    // ✅ NEW: Enhanced renewal tracking fields
    @JsonKey(name: 'follow_up_status')
    String? followUpStatus, // active, expired, used, waiting
    @JsonKey(name: 'renewal_status')
    String? renewalStatus, // valid, waiting, renewed
    @JsonKey(name: 'next_followup_expiry')
    String? nextFollowupExpiry, // ISO date
    String? note,
  }) = _AppointmentHistoryItem;

  factory AppointmentHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHistoryItemFromJson(json);
}

/// ✅ NEW: Eligible follow-up item (quick list of FREE follow-ups)
/// Compatible with table-based follow_ups system
@freezed
class EligibleFollowUp with _$EligibleFollowUp {
  const factory EligibleFollowUp({
    // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
    @JsonKey(name: 'followup_id') String? followupId,
    // ✅ LEGACY: Source appointment ID (for backward compatibility)
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') required String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    required String department,
    // ✅ NEW TABLE-BASED: Valid from/until dates
    @JsonKey(name: 'valid_from') String? validFrom,
    @JsonKey(name: 'valid_until') String? validUntil,
    // ✅ LEGACY: Appointment date (for backward compatibility)
    @JsonKey(name: 'appointment_date') String? appointmentDate,
    @JsonKey(name: 'remaining_days') int? remainingDays,
    @JsonKey(name: 'days_remaining')
    int? daysRemaining, // ✅ NEW: Alternative field name
    // ✅ NEW TABLE-BASED: Status tracking
    String? status, // active, used, expired, renewed
    @JsonKey(name: 'is_free') bool? isFree, // ✅ NEW: Explicitly track if free
    // ✅ Enhanced renewal tracking
    @JsonKey(name: 'next_followup_expiry')
    String? nextFollowupExpiry, // ISO date
    String? note,
    String? message, // ✅ NEW: User-friendly message from backend
  }) = _EligibleFollowUp;

  factory EligibleFollowUp.fromJson(Map<String, dynamic> json) =>
      _$EligibleFollowUpFromJson(json);
}

/// Extension methods for EligibleFollowUp
extension EligibleFollowUpExtension on EligibleFollowUp {
  /// Get the unique ID (followup_id or appointment_id)
  String get id => followupId ?? appointmentId ?? '';

  /// Get the appointment date (appointment_date or valid_from)
  String get dateString => appointmentDate ?? validFrom ?? '';

  /// Get remaining days (handles both field names)
  int get daysLeft => daysRemaining ?? remainingDays ?? 0;

  /// Get expiry date (valid_until or next_followup_expiry)
  String? get expiryDate => validUntil ?? nextFollowupExpiry;

  /// Check if this is explicitly marked as free
  bool get isFreeFollowUp =>
      isFree ?? true; // Default to true for backward compatibility

  /// Get user-friendly message
  String get displayMessage =>
      message ?? note ?? 'Free follow-up available ($daysLeft days remaining)';
}

/// ✅ NEW: Expired follow-up item (follow-ups that need renewal)
/// Compatible with table-based follow_ups system
@freezed
class ExpiredFollowUp with _$ExpiredFollowUp {
  const factory ExpiredFollowUp({
    // ✅ NEW TABLE-BASED: Follow-up record ID from follow_ups table
    @JsonKey(name: 'followup_id') String? followupId,
    // ✅ LEGACY: Source appointment ID (for backward compatibility)
    @JsonKey(name: 'appointment_id') String? appointmentId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'doctor_name') required String doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'department_name')
    String? departmentName, // ✅ NEW: Alternative field name
    required String department,
    // ✅ NEW TABLE-BASED: Expiration tracking
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'expired_on')
    String? expiredOn, // Date when follow-up expired
    String? status, // ✅ NEW: Status from follow_ups table
    String? note, // Instructions for renewal
  }) = _ExpiredFollowUp;

  factory ExpiredFollowUp.fromJson(Map<String, dynamic> json) =>
      _$ExpiredFollowUpFromJson(json);
}

/// Extension methods for ExpiredFollowUp
extension ExpiredFollowUpExtension on ExpiredFollowUp {
  /// Get the unique ID (followup_id or appointment_id)
  String get id => followupId ?? appointmentId ?? '';

  /// Get department name (handles both field names)
  String get deptName => departmentName ?? department;

  /// Get expiry date (valid_until or expired_on)
  String? get expiryDate => validUntil ?? expiredOn;

  /// Get user-friendly message
  String get displayMessage =>
      note ??
      'Follow-up expired — book a new regular appointment with $doctorName ($deptName) to restart your free follow-up';
}

@freezed
class CreateClinicPatientInput with _$CreateClinicPatientInput {
  const factory CreateClinicPatientInput({
    @JsonKey(name: 'clinic_id') required String clinicId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    String? email,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    int? age,
    String? gender,
    String? address1,
    String? address2,
    String? district,
    String? state,
    @JsonKey(name: 'mo_id') String? moId,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? allergies,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'smoking_status') String? smokingStatus,
    @JsonKey(name: 'alcohol_use') String? alcoholUse,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
  }) = _CreateClinicPatientInput;

  factory CreateClinicPatientInput.fromJson(Map<String, dynamic> json) =>
      _$CreateClinicPatientInputFromJson(json);
}

@freezed
class CreateClinicPatientResponse with _$CreateClinicPatientResponse {
  const factory CreateClinicPatientResponse({
    required String message,
    required ClinicPatient patient,
  }) = _CreateClinicPatientResponse;

  factory CreateClinicPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateClinicPatientResponseFromJson(json);
}

@freezed
class ListClinicPatientsResponse with _$ListClinicPatientsResponse {
  const factory ListClinicPatientsResponse({
    @JsonKey(name: 'clinic_id') required String clinicId,
    required int total,
    required List<ClinicPatient> patients,
  }) = _ListClinicPatientsResponse;

  factory ListClinicPatientsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListClinicPatientsResponseFromJson(json);
}

/// ✅ NEW: Full appointment detail with all fields from backend
@freezed
class AppointmentDetail with _$AppointmentDetail {
  const factory AppointmentDetail({
    @JsonKey(name: 'appointment_id') required String appointmentId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'department_id') required String departmentId,
    @JsonKey(name: 'appointment_time') required String appointmentTime,
    @JsonKey(name: 'slot_type') required String slotType,
    @JsonKey(name: 'consultation_type') required String consultationType,
    required String status,
    @JsonKey(name: 'fee_amount') @Default(0.0) double feeAmount,
    @JsonKey(name: 'payment_status') @Default('pending') String paymentStatus,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'is_priority') @Default(false) bool isPriority,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _AppointmentDetail;

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailFromJson(json);
}

/// ✅ NEW: Full follow-up detail with all fields from backend
@freezed
class FollowUpDetail with _$FollowUpDetail {
  const factory FollowUpDetail({
    @JsonKey(name: 'follow_up_id') required String followUpId,
    @JsonKey(name: 'source_appointment_id') required String sourceAppointmentId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'department_id') required String departmentId,
    required String status,
    @JsonKey(name: 'is_free') @Default(true) bool isFree,
    @JsonKey(name: 'valid_from') required String validFrom,
    @JsonKey(name: 'valid_until') required String validUntil,
    @JsonKey(name: 'used_appointment_id') String? usedAppointmentId,
    @JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _FollowUpDetail;

  factory FollowUpDetail.fromJson(Map<String, dynamic> json) =>
      _$FollowUpDetailFromJson(json);
}

/// Extension methods for FollowUpDetail
extension FollowUpDetailExtension on FollowUpDetail {
  /// Check if follow-up is currently active and available
  bool get isActive => this.status == 'active';

  /// Check if follow-up has been used
  bool get isUsed => this.status == 'used';

  /// Check if follow-up has expired
  bool get isExpired => this.status == 'expired';

  /// Check if follow-up has been renewed
  bool get isRenewed => this.status == 'renewed';

  /// Calculate days remaining for active follow-ups
  int? get daysRemaining {
    if (isExpired || !isActive) return null;
    try {
      final validUntilDate = DateTime.parse(this.validUntil);
      final now = DateTime.now();
      final difference = validUntilDate.difference(now).inDays;
      return difference > 0 ? difference : 0;
    } catch (e) {
      return null;
    }
  }

  /// Get user-friendly status message
  String get statusMessage {
    switch (this.status) {
      case 'active':
        final days = daysRemaining;
        if (days != null && days > 0) {
          return this.isFree
              ? 'Free follow-up available ($days days remaining)'
              : 'Follow-up available ($days days remaining)';
        }
        return this.isFree ? 'Free follow-up available' : 'Follow-up available';
      case 'used':
        return 'Follow-up has been used';
      case 'expired':
        return 'Follow-up expired';
      case 'renewed':
        return 'Follow-up renewed - new free follow-up created';
      default:
        return 'Unknown status';
    }
  }
}

/// Extension methods for AppointmentDetail
extension AppointmentDetailExtension on AppointmentDetail {
  /// Check if appointment is a follow-up appointment
  bool get isFollowUpAppointment {
    return this.slotType == 'clinic_followup' ||
        this.slotType == 'video_followup' ||
        this.consultationType.contains('follow-up');
  }

  /// Check if appointment is free (fee is 0 and payment is waived)
  bool get isFreeAppointment {
    return this.feeAmount == 0 &&
        (this.paymentStatus == 'waived' ||
            this.paymentStatus == 'paid' && this.feeAmount == 0);
  }

  /// Get user-friendly appointment type
  String get appointmentType {
    switch (this.slotType) {
      case 'clinic_visit':
        return 'Clinic Visit';
      case 'clinic_followup':
        return 'Follow-Up (Clinic)';
      case 'video_consultation':
        return 'Video Consultation';
      case 'video_followup':
        return 'Follow-Up (Video)';
      default:
        return this.slotType;
    }
  }
}
