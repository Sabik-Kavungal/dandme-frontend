// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppointmentDetails _$AppointmentDetailsFromJson(Map<String, dynamic> json) {
  return _AppointmentDetails.fromJson(json);
}

/// @nodoc
mixin _$AppointmentDetails {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
  dynamic get tokenNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "mo_id")
  String? get moId => throw _privateConstructorUsedError;
  @JsonKey(name: "booking_number")
  String? get bookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_type")
  String? get consultationType => throw _privateConstructorUsedError;
  @JsonKey(name: "appointment_date_time")
  String? get appointmentDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "duration_minutes")
  int? get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: "session_type")
  String? get sessionType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "fee_amount")
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "fee_status")
  String? get feeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_status")
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "cancellation_reason")
  String? get cancellationReason => throw _privateConstructorUsedError;
  @JsonKey(name: "slot_details")
  SlotDetails? get slotDetails => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError; // Flat structure from API
  @JsonKey(name: "patient_name")
  String? get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_name")
  String? get doctorName => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: "clinic_patient_id")
  String? get clinicPatientId => throw _privateConstructorUsedError; // Nested objects (for compatibility)
  PatientDetails? get patient => throw _privateConstructorUsedError;
  DoctorDetails? get doctor => throw _privateConstructorUsedError;
  ClinicDetails? get clinic => throw _privateConstructorUsedError;

  /// Serializes this AppointmentDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentDetailsCopyWith<AppointmentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDetailsCopyWith<$Res> {
  factory $AppointmentDetailsCopyWith(
    AppointmentDetails value,
    $Res Function(AppointmentDetails) then,
  ) = _$AppointmentDetailsCopyWithImpl<$Res, AppointmentDetails>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
    dynamic tokenNumber,
    @JsonKey(name: "mo_id") String? moId,
    @JsonKey(name: "booking_number") String? bookingNumber,
    @JsonKey(name: "consultation_type") String? consultationType,
    @JsonKey(name: "appointment_date_time") String? appointmentDateTime,
    @JsonKey(name: "duration_minutes") int? durationMinutes,
    @JsonKey(name: "session_type") String? sessionType,
    String? status,
    @JsonKey(name: "fee_amount") double? feeAmount,
    @JsonKey(name: "fee_status") String? feeStatus,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "payment_method") String? paymentMethod,
    String? notes,
    @JsonKey(name: "cancellation_reason") String? cancellationReason,
    @JsonKey(name: "slot_details") SlotDetails? slotDetails,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "patient_name") String? patientName,
    @JsonKey(name: "doctor_name") String? doctorName,
    String? department,
    @JsonKey(name: "clinic_patient_id") String? clinicPatientId,
    PatientDetails? patient,
    DoctorDetails? doctor,
    ClinicDetails? clinic,
  });

  $SlotDetailsCopyWith<$Res>? get slotDetails;
  $PatientDetailsCopyWith<$Res>? get patient;
  $DoctorDetailsCopyWith<$Res>? get doctor;
  $ClinicDetailsCopyWith<$Res>? get clinic;
}

/// @nodoc
class _$AppointmentDetailsCopyWithImpl<$Res, $Val extends AppointmentDetails>
    implements $AppointmentDetailsCopyWith<$Res> {
  _$AppointmentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tokenNumber = freezed,
    Object? moId = freezed,
    Object? bookingNumber = freezed,
    Object? consultationType = freezed,
    Object? appointmentDateTime = freezed,
    Object? durationMinutes = freezed,
    Object? sessionType = freezed,
    Object? status = freezed,
    Object? feeAmount = freezed,
    Object? feeStatus = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? slotDetails = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? patientName = freezed,
    Object? doctorName = freezed,
    Object? department = freezed,
    Object? clinicPatientId = freezed,
    Object? patient = freezed,
    Object? doctor = freezed,
    Object? clinic = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            tokenNumber: freezed == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            moId: freezed == moId
                ? _value.moId
                : moId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingNumber: freezed == bookingNumber
                ? _value.bookingNumber
                : bookingNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationType: freezed == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentDateTime: freezed == appointmentDateTime
                ? _value.appointmentDateTime
                : appointmentDateTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            sessionType: freezed == sessionType
                ? _value.sessionType
                : sessionType // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            feeAmount: freezed == feeAmount
                ? _value.feeAmount
                : feeAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            feeStatus: freezed == feeStatus
                ? _value.feeStatus
                : feeStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            cancellationReason: freezed == cancellationReason
                ? _value.cancellationReason
                : cancellationReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotDetails: freezed == slotDetails
                ? _value.slotDetails
                : slotDetails // ignore: cast_nullable_to_non_nullable
                      as SlotDetails?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientName: freezed == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicPatientId: freezed == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            patient: freezed == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as PatientDetails?,
            doctor: freezed == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as DoctorDetails?,
            clinic: freezed == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as ClinicDetails?,
          )
          as $Val,
    );
  }

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SlotDetailsCopyWith<$Res>? get slotDetails {
    if (_value.slotDetails == null) {
      return null;
    }

    return $SlotDetailsCopyWith<$Res>(_value.slotDetails!, (value) {
      return _then(_value.copyWith(slotDetails: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientDetailsCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $PatientDetailsCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorDetailsCopyWith<$Res>? get doctor {
    if (_value.doctor == null) {
      return null;
    }

    return $DoctorDetailsCopyWith<$Res>(_value.doctor!, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicDetailsCopyWith<$Res>? get clinic {
    if (_value.clinic == null) {
      return null;
    }

    return $ClinicDetailsCopyWith<$Res>(_value.clinic!, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentDetailsImplCopyWith<$Res>
    implements $AppointmentDetailsCopyWith<$Res> {
  factory _$$AppointmentDetailsImplCopyWith(
    _$AppointmentDetailsImpl value,
    $Res Function(_$AppointmentDetailsImpl) then,
  ) = __$$AppointmentDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
    dynamic tokenNumber,
    @JsonKey(name: "mo_id") String? moId,
    @JsonKey(name: "booking_number") String? bookingNumber,
    @JsonKey(name: "consultation_type") String? consultationType,
    @JsonKey(name: "appointment_date_time") String? appointmentDateTime,
    @JsonKey(name: "duration_minutes") int? durationMinutes,
    @JsonKey(name: "session_type") String? sessionType,
    String? status,
    @JsonKey(name: "fee_amount") double? feeAmount,
    @JsonKey(name: "fee_status") String? feeStatus,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "payment_method") String? paymentMethod,
    String? notes,
    @JsonKey(name: "cancellation_reason") String? cancellationReason,
    @JsonKey(name: "slot_details") SlotDetails? slotDetails,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "patient_name") String? patientName,
    @JsonKey(name: "doctor_name") String? doctorName,
    String? department,
    @JsonKey(name: "clinic_patient_id") String? clinicPatientId,
    PatientDetails? patient,
    DoctorDetails? doctor,
    ClinicDetails? clinic,
  });

  @override
  $SlotDetailsCopyWith<$Res>? get slotDetails;
  @override
  $PatientDetailsCopyWith<$Res>? get patient;
  @override
  $DoctorDetailsCopyWith<$Res>? get doctor;
  @override
  $ClinicDetailsCopyWith<$Res>? get clinic;
}

/// @nodoc
class __$$AppointmentDetailsImplCopyWithImpl<$Res>
    extends _$AppointmentDetailsCopyWithImpl<$Res, _$AppointmentDetailsImpl>
    implements _$$AppointmentDetailsImplCopyWith<$Res> {
  __$$AppointmentDetailsImplCopyWithImpl(
    _$AppointmentDetailsImpl _value,
    $Res Function(_$AppointmentDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tokenNumber = freezed,
    Object? moId = freezed,
    Object? bookingNumber = freezed,
    Object? consultationType = freezed,
    Object? appointmentDateTime = freezed,
    Object? durationMinutes = freezed,
    Object? sessionType = freezed,
    Object? status = freezed,
    Object? feeAmount = freezed,
    Object? feeStatus = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? slotDetails = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? patientName = freezed,
    Object? doctorName = freezed,
    Object? department = freezed,
    Object? clinicPatientId = freezed,
    Object? patient = freezed,
    Object? doctor = freezed,
    Object? clinic = freezed,
  }) {
    return _then(
      _$AppointmentDetailsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        tokenNumber: freezed == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        moId: freezed == moId
            ? _value.moId
            : moId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingNumber: freezed == bookingNumber
            ? _value.bookingNumber
            : bookingNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationType: freezed == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentDateTime: freezed == appointmentDateTime
            ? _value.appointmentDateTime
            : appointmentDateTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        sessionType: freezed == sessionType
            ? _value.sessionType
            : sessionType // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        feeAmount: freezed == feeAmount
            ? _value.feeAmount
            : feeAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        feeStatus: freezed == feeStatus
            ? _value.feeStatus
            : feeStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        cancellationReason: freezed == cancellationReason
            ? _value.cancellationReason
            : cancellationReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotDetails: freezed == slotDetails
            ? _value.slotDetails
            : slotDetails // ignore: cast_nullable_to_non_nullable
                  as SlotDetails?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientName: freezed == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicPatientId: freezed == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        patient: freezed == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as PatientDetails?,
        doctor: freezed == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as DoctorDetails?,
        clinic: freezed == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as ClinicDetails?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentDetailsImpl implements _AppointmentDetails {
  const _$AppointmentDetailsImpl({
    this.id,
    @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
    this.tokenNumber,
    @JsonKey(name: "mo_id") this.moId,
    @JsonKey(name: "booking_number") this.bookingNumber,
    @JsonKey(name: "consultation_type") this.consultationType,
    @JsonKey(name: "appointment_date_time") this.appointmentDateTime,
    @JsonKey(name: "duration_minutes") this.durationMinutes,
    @JsonKey(name: "session_type") this.sessionType,
    this.status,
    @JsonKey(name: "fee_amount") this.feeAmount,
    @JsonKey(name: "fee_status") this.feeStatus,
    @JsonKey(name: "payment_status") this.paymentStatus,
    @JsonKey(name: "payment_method") this.paymentMethod,
    this.notes,
    @JsonKey(name: "cancellation_reason") this.cancellationReason,
    @JsonKey(name: "slot_details") this.slotDetails,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "updated_at") this.updatedAt,
    @JsonKey(name: "patient_name") this.patientName,
    @JsonKey(name: "doctor_name") this.doctorName,
    this.department,
    @JsonKey(name: "clinic_patient_id") this.clinicPatientId,
    this.patient,
    this.doctor,
    this.clinic,
  });

  factory _$AppointmentDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
  final dynamic tokenNumber;
  @override
  @JsonKey(name: "mo_id")
  final String? moId;
  @override
  @JsonKey(name: "booking_number")
  final String? bookingNumber;
  @override
  @JsonKey(name: "consultation_type")
  final String? consultationType;
  @override
  @JsonKey(name: "appointment_date_time")
  final String? appointmentDateTime;
  @override
  @JsonKey(name: "duration_minutes")
  final int? durationMinutes;
  @override
  @JsonKey(name: "session_type")
  final String? sessionType;
  @override
  final String? status;
  @override
  @JsonKey(name: "fee_amount")
  final double? feeAmount;
  @override
  @JsonKey(name: "fee_status")
  final String? feeStatus;
  @override
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @override
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  @override
  final String? notes;
  @override
  @JsonKey(name: "cancellation_reason")
  final String? cancellationReason;
  @override
  @JsonKey(name: "slot_details")
  final SlotDetails? slotDetails;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  // Flat structure from API
  @override
  @JsonKey(name: "patient_name")
  final String? patientName;
  @override
  @JsonKey(name: "doctor_name")
  final String? doctorName;
  @override
  final String? department;
  @override
  @JsonKey(name: "clinic_patient_id")
  final String? clinicPatientId;
  // Nested objects (for compatibility)
  @override
  final PatientDetails? patient;
  @override
  final DoctorDetails? doctor;
  @override
  final ClinicDetails? clinic;

  @override
  String toString() {
    return 'AppointmentDetails(id: $id, tokenNumber: $tokenNumber, moId: $moId, bookingNumber: $bookingNumber, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, durationMinutes: $durationMinutes, sessionType: $sessionType, status: $status, feeAmount: $feeAmount, feeStatus: $feeStatus, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, notes: $notes, cancellationReason: $cancellationReason, slotDetails: $slotDetails, createdAt: $createdAt, updatedAt: $updatedAt, patientName: $patientName, doctorName: $doctorName, department: $department, clinicPatientId: $clinicPatientId, patient: $patient, doctor: $doctor, clinic: $clinic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other.tokenNumber,
              tokenNumber,
            ) &&
            (identical(other.moId, moId) || other.moId == moId) &&
            (identical(other.bookingNumber, bookingNumber) ||
                other.bookingNumber == bookingNumber) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.appointmentDateTime, appointmentDateTime) ||
                other.appointmentDateTime == appointmentDateTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.sessionType, sessionType) ||
                other.sessionType == sessionType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.feeStatus, feeStatus) ||
                other.feeStatus == feeStatus) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.slotDetails, slotDetails) ||
                other.slotDetails == slotDetails) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.clinic, clinic) || other.clinic == clinic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    const DeepCollectionEquality().hash(tokenNumber),
    moId,
    bookingNumber,
    consultationType,
    appointmentDateTime,
    durationMinutes,
    sessionType,
    status,
    feeAmount,
    feeStatus,
    paymentStatus,
    paymentMethod,
    notes,
    cancellationReason,
    slotDetails,
    createdAt,
    updatedAt,
    patientName,
    doctorName,
    department,
    clinicPatientId,
    patient,
    doctor,
    clinic,
  ]);

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentDetailsImplCopyWith<_$AppointmentDetailsImpl> get copyWith =>
      __$$AppointmentDetailsImplCopyWithImpl<_$AppointmentDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentDetailsImplToJson(this);
  }
}

abstract class _AppointmentDetails implements AppointmentDetails {
  const factory _AppointmentDetails({
    final String? id,
    @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
    final dynamic tokenNumber,
    @JsonKey(name: "mo_id") final String? moId,
    @JsonKey(name: "booking_number") final String? bookingNumber,
    @JsonKey(name: "consultation_type") final String? consultationType,
    @JsonKey(name: "appointment_date_time") final String? appointmentDateTime,
    @JsonKey(name: "duration_minutes") final int? durationMinutes,
    @JsonKey(name: "session_type") final String? sessionType,
    final String? status,
    @JsonKey(name: "fee_amount") final double? feeAmount,
    @JsonKey(name: "fee_status") final String? feeStatus,
    @JsonKey(name: "payment_status") final String? paymentStatus,
    @JsonKey(name: "payment_method") final String? paymentMethod,
    final String? notes,
    @JsonKey(name: "cancellation_reason") final String? cancellationReason,
    @JsonKey(name: "slot_details") final SlotDetails? slotDetails,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "updated_at") final String? updatedAt,
    @JsonKey(name: "patient_name") final String? patientName,
    @JsonKey(name: "doctor_name") final String? doctorName,
    final String? department,
    @JsonKey(name: "clinic_patient_id") final String? clinicPatientId,
    final PatientDetails? patient,
    final DoctorDetails? doctor,
    final ClinicDetails? clinic,
  }) = _$AppointmentDetailsImpl;

  factory _AppointmentDetails.fromJson(Map<String, dynamic> json) =
      _$AppointmentDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "token_number", fromJson: _tokenNumberFromJson)
  dynamic get tokenNumber;
  @override
  @JsonKey(name: "mo_id")
  String? get moId;
  @override
  @JsonKey(name: "booking_number")
  String? get bookingNumber;
  @override
  @JsonKey(name: "consultation_type")
  String? get consultationType;
  @override
  @JsonKey(name: "appointment_date_time")
  String? get appointmentDateTime;
  @override
  @JsonKey(name: "duration_minutes")
  int? get durationMinutes;
  @override
  @JsonKey(name: "session_type")
  String? get sessionType;
  @override
  String? get status;
  @override
  @JsonKey(name: "fee_amount")
  double? get feeAmount;
  @override
  @JsonKey(name: "fee_status")
  String? get feeStatus;
  @override
  @JsonKey(name: "payment_status")
  String? get paymentStatus;
  @override
  @JsonKey(name: "payment_method")
  String? get paymentMethod;
  @override
  String? get notes;
  @override
  @JsonKey(name: "cancellation_reason")
  String? get cancellationReason;
  @override
  @JsonKey(name: "slot_details")
  SlotDetails? get slotDetails;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt; // Flat structure from API
  @override
  @JsonKey(name: "patient_name")
  String? get patientName;
  @override
  @JsonKey(name: "doctor_name")
  String? get doctorName;
  @override
  String? get department;
  @override
  @JsonKey(name: "clinic_patient_id")
  String? get clinicPatientId; // Nested objects (for compatibility)
  @override
  PatientDetails? get patient;
  @override
  DoctorDetails? get doctor;
  @override
  ClinicDetails? get clinic;

  /// Create a copy of AppointmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentDetailsImplCopyWith<_$AppointmentDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientDetails _$PatientDetailsFromJson(Map<String, dynamic> json) {
  return _PatientDetails.fromJson(json);
}

/// @nodoc
mixin _$PatientDetails {
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this PatientDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDetailsCopyWith<PatientDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDetailsCopyWith<$Res> {
  factory $PatientDetailsCopyWith(
    PatientDetails value,
    $Res Function(PatientDetails) then,
  ) = _$PatientDetailsCopyWithImpl<$Res, PatientDetails>;
  @useResult
  $Res call({
    String? name,
    String? phone,
    String? email,
    int? age,
    String? gender,
  });
}

/// @nodoc
class _$PatientDetailsCopyWithImpl<$Res, $Val extends PatientDetails>
    implements $PatientDetailsCopyWith<$Res> {
  _$PatientDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? age = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientDetailsImplCopyWith<$Res>
    implements $PatientDetailsCopyWith<$Res> {
  factory _$$PatientDetailsImplCopyWith(
    _$PatientDetailsImpl value,
    $Res Function(_$PatientDetailsImpl) then,
  ) = __$$PatientDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? name,
    String? phone,
    String? email,
    int? age,
    String? gender,
  });
}

/// @nodoc
class __$$PatientDetailsImplCopyWithImpl<$Res>
    extends _$PatientDetailsCopyWithImpl<$Res, _$PatientDetailsImpl>
    implements _$$PatientDetailsImplCopyWith<$Res> {
  __$$PatientDetailsImplCopyWithImpl(
    _$PatientDetailsImpl _value,
    $Res Function(_$PatientDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? age = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$PatientDetailsImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDetailsImpl implements _PatientDetails {
  const _$PatientDetailsImpl({
    this.name,
    this.phone,
    this.email,
    this.age,
    this.gender,
  });

  factory _$PatientDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDetailsImplFromJson(json);

  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final int? age;
  @override
  final String? gender;

  @override
  String toString() {
    return 'PatientDetails(name: $name, phone: $phone, email: $email, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, email, age, gender);

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDetailsImplCopyWith<_$PatientDetailsImpl> get copyWith =>
      __$$PatientDetailsImplCopyWithImpl<_$PatientDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientDetailsImplToJson(this);
  }
}

abstract class _PatientDetails implements PatientDetails {
  const factory _PatientDetails({
    final String? name,
    final String? phone,
    final String? email,
    final int? age,
    final String? gender,
  }) = _$PatientDetailsImpl;

  factory _PatientDetails.fromJson(Map<String, dynamic> json) =
      _$PatientDetailsImpl.fromJson;

  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  int? get age;
  @override
  String? get gender;

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDetailsImplCopyWith<_$PatientDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorDetails _$DoctorDetailsFromJson(Map<String, dynamic> json) {
  return _DoctorDetails.fromJson(json);
}

/// @nodoc
mixin _$DoctorDetails {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this DoctorDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorDetailsCopyWith<DoctorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorDetailsCopyWith<$Res> {
  factory $DoctorDetailsCopyWith(
    DoctorDetails value,
    $Res Function(DoctorDetails) then,
  ) = _$DoctorDetailsCopyWithImpl<$Res, DoctorDetails>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$DoctorDetailsCopyWithImpl<$Res, $Val extends DoctorDetails>
    implements $DoctorDetailsCopyWith<$Res> {
  _$DoctorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorDetailsImplCopyWith<$Res>
    implements $DoctorDetailsCopyWith<$Res> {
  factory _$$DoctorDetailsImplCopyWith(
    _$DoctorDetailsImpl value,
    $Res Function(_$DoctorDetailsImpl) then,
  ) = __$$DoctorDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$DoctorDetailsImplCopyWithImpl<$Res>
    extends _$DoctorDetailsCopyWithImpl<$Res, _$DoctorDetailsImpl>
    implements _$$DoctorDetailsImplCopyWith<$Res> {
  __$$DoctorDetailsImplCopyWithImpl(
    _$DoctorDetailsImpl _value,
    $Res Function(_$DoctorDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$DoctorDetailsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorDetailsImpl implements _DoctorDetails {
  const _$DoctorDetailsImpl({this.id, this.name});

  factory _$DoctorDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'DoctorDetails(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DoctorDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorDetailsImplCopyWith<_$DoctorDetailsImpl> get copyWith =>
      __$$DoctorDetailsImplCopyWithImpl<_$DoctorDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorDetailsImplToJson(this);
  }
}

abstract class _DoctorDetails implements DoctorDetails {
  const factory _DoctorDetails({final String? id, final String? name}) =
      _$DoctorDetailsImpl;

  factory _DoctorDetails.fromJson(Map<String, dynamic> json) =
      _$DoctorDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;

  /// Create a copy of DoctorDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorDetailsImplCopyWith<_$DoctorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DepartmentDetails _$DepartmentDetailsFromJson(Map<String, dynamic> json) {
  return _DepartmentDetails.fromJson(json);
}

/// @nodoc
mixin _$DepartmentDetails {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this DepartmentDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentDetailsCopyWith<DepartmentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentDetailsCopyWith<$Res> {
  factory $DepartmentDetailsCopyWith(
    DepartmentDetails value,
    $Res Function(DepartmentDetails) then,
  ) = _$DepartmentDetailsCopyWithImpl<$Res, DepartmentDetails>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$DepartmentDetailsCopyWithImpl<$Res, $Val extends DepartmentDetails>
    implements $DepartmentDetailsCopyWith<$Res> {
  _$DepartmentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepartmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DepartmentDetailsImplCopyWith<$Res>
    implements $DepartmentDetailsCopyWith<$Res> {
  factory _$$DepartmentDetailsImplCopyWith(
    _$DepartmentDetailsImpl value,
    $Res Function(_$DepartmentDetailsImpl) then,
  ) = __$$DepartmentDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$DepartmentDetailsImplCopyWithImpl<$Res>
    extends _$DepartmentDetailsCopyWithImpl<$Res, _$DepartmentDetailsImpl>
    implements _$$DepartmentDetailsImplCopyWith<$Res> {
  __$$DepartmentDetailsImplCopyWithImpl(
    _$DepartmentDetailsImpl _value,
    $Res Function(_$DepartmentDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DepartmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$DepartmentDetailsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentDetailsImpl implements _DepartmentDetails {
  const _$DepartmentDetailsImpl({this.id, this.name});

  factory _$DepartmentDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'DepartmentDetails(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DepartmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentDetailsImplCopyWith<_$DepartmentDetailsImpl> get copyWith =>
      __$$DepartmentDetailsImplCopyWithImpl<_$DepartmentDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentDetailsImplToJson(this);
  }
}

abstract class _DepartmentDetails implements DepartmentDetails {
  const factory _DepartmentDetails({final String? id, final String? name}) =
      _$DepartmentDetailsImpl;

  factory _DepartmentDetails.fromJson(Map<String, dynamic> json) =
      _$DepartmentDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;

  /// Create a copy of DepartmentDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentDetailsImplCopyWith<_$DepartmentDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicDetails _$ClinicDetailsFromJson(Map<String, dynamic> json) {
  return _ClinicDetails.fromJson(json);
}

/// @nodoc
mixin _$ClinicDetails {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ClinicDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicDetailsCopyWith<ClinicDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDetailsCopyWith<$Res> {
  factory $ClinicDetailsCopyWith(
    ClinicDetails value,
    $Res Function(ClinicDetails) then,
  ) = _$ClinicDetailsCopyWithImpl<$Res, ClinicDetails>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$ClinicDetailsCopyWithImpl<$Res, $Val extends ClinicDetails>
    implements $ClinicDetailsCopyWith<$Res> {
  _$ClinicDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicDetailsImplCopyWith<$Res>
    implements $ClinicDetailsCopyWith<$Res> {
  factory _$$ClinicDetailsImplCopyWith(
    _$ClinicDetailsImpl value,
    $Res Function(_$ClinicDetailsImpl) then,
  ) = __$$ClinicDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$ClinicDetailsImplCopyWithImpl<$Res>
    extends _$ClinicDetailsCopyWithImpl<$Res, _$ClinicDetailsImpl>
    implements _$$ClinicDetailsImplCopyWith<$Res> {
  __$$ClinicDetailsImplCopyWithImpl(
    _$ClinicDetailsImpl _value,
    $Res Function(_$ClinicDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$ClinicDetailsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicDetailsImpl implements _ClinicDetails {
  const _$ClinicDetailsImpl({this.id, this.name});

  factory _$ClinicDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ClinicDetails(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ClinicDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicDetailsImplCopyWith<_$ClinicDetailsImpl> get copyWith =>
      __$$ClinicDetailsImplCopyWithImpl<_$ClinicDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicDetailsImplToJson(this);
  }
}

abstract class _ClinicDetails implements ClinicDetails {
  const factory _ClinicDetails({final String? id, final String? name}) =
      _$ClinicDetailsImpl;

  factory _ClinicDetails.fromJson(Map<String, dynamic> json) =
      _$ClinicDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;

  /// Create a copy of ClinicDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicDetailsImplCopyWith<_$ClinicDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SlotDetails _$SlotDetailsFromJson(Map<String, dynamic> json) {
  return _SlotDetails.fromJson(json);
}

/// @nodoc
mixin _$SlotDetails {
  @JsonKey(name: "slot_id")
  String? get slotId => throw _privateConstructorUsedError;
  @JsonKey(name: "slot_status")
  String? get slotStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "slot_start_time")
  String? get slotStartTime => throw _privateConstructorUsedError;
  @JsonKey(name: "slot_end_time")
  String? get slotEndTime => throw _privateConstructorUsedError;
  @JsonKey(name: "slot_date")
  String? get slotDate => throw _privateConstructorUsedError;
  @JsonKey(name: "slot_full_time")
  String? get slotFullTime => throw _privateConstructorUsedError;
  @JsonKey(name: "session_name")
  String? get sessionName => throw _privateConstructorUsedError;

  /// Serializes this SlotDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SlotDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlotDetailsCopyWith<SlotDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotDetailsCopyWith<$Res> {
  factory $SlotDetailsCopyWith(
    SlotDetails value,
    $Res Function(SlotDetails) then,
  ) = _$SlotDetailsCopyWithImpl<$Res, SlotDetails>;
  @useResult
  $Res call({
    @JsonKey(name: "slot_id") String? slotId,
    @JsonKey(name: "slot_status") String? slotStatus,
    @JsonKey(name: "slot_start_time") String? slotStartTime,
    @JsonKey(name: "slot_end_time") String? slotEndTime,
    @JsonKey(name: "slot_date") String? slotDate,
    @JsonKey(name: "slot_full_time") String? slotFullTime,
    @JsonKey(name: "session_name") String? sessionName,
  });
}

/// @nodoc
class _$SlotDetailsCopyWithImpl<$Res, $Val extends SlotDetails>
    implements $SlotDetailsCopyWith<$Res> {
  _$SlotDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SlotDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotId = freezed,
    Object? slotStatus = freezed,
    Object? slotStartTime = freezed,
    Object? slotEndTime = freezed,
    Object? slotDate = freezed,
    Object? slotFullTime = freezed,
    Object? sessionName = freezed,
  }) {
    return _then(
      _value.copyWith(
            slotId: freezed == slotId
                ? _value.slotId
                : slotId // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotStatus: freezed == slotStatus
                ? _value.slotStatus
                : slotStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotStartTime: freezed == slotStartTime
                ? _value.slotStartTime
                : slotStartTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotEndTime: freezed == slotEndTime
                ? _value.slotEndTime
                : slotEndTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotDate: freezed == slotDate
                ? _value.slotDate
                : slotDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            slotFullTime: freezed == slotFullTime
                ? _value.slotFullTime
                : slotFullTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionName: freezed == sessionName
                ? _value.sessionName
                : sessionName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SlotDetailsImplCopyWith<$Res>
    implements $SlotDetailsCopyWith<$Res> {
  factory _$$SlotDetailsImplCopyWith(
    _$SlotDetailsImpl value,
    $Res Function(_$SlotDetailsImpl) then,
  ) = __$$SlotDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "slot_id") String? slotId,
    @JsonKey(name: "slot_status") String? slotStatus,
    @JsonKey(name: "slot_start_time") String? slotStartTime,
    @JsonKey(name: "slot_end_time") String? slotEndTime,
    @JsonKey(name: "slot_date") String? slotDate,
    @JsonKey(name: "slot_full_time") String? slotFullTime,
    @JsonKey(name: "session_name") String? sessionName,
  });
}

/// @nodoc
class __$$SlotDetailsImplCopyWithImpl<$Res>
    extends _$SlotDetailsCopyWithImpl<$Res, _$SlotDetailsImpl>
    implements _$$SlotDetailsImplCopyWith<$Res> {
  __$$SlotDetailsImplCopyWithImpl(
    _$SlotDetailsImpl _value,
    $Res Function(_$SlotDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SlotDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotId = freezed,
    Object? slotStatus = freezed,
    Object? slotStartTime = freezed,
    Object? slotEndTime = freezed,
    Object? slotDate = freezed,
    Object? slotFullTime = freezed,
    Object? sessionName = freezed,
  }) {
    return _then(
      _$SlotDetailsImpl(
        slotId: freezed == slotId
            ? _value.slotId
            : slotId // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotStatus: freezed == slotStatus
            ? _value.slotStatus
            : slotStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotStartTime: freezed == slotStartTime
            ? _value.slotStartTime
            : slotStartTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotEndTime: freezed == slotEndTime
            ? _value.slotEndTime
            : slotEndTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotDate: freezed == slotDate
            ? _value.slotDate
            : slotDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        slotFullTime: freezed == slotFullTime
            ? _value.slotFullTime
            : slotFullTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionName: freezed == sessionName
            ? _value.sessionName
            : sessionName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SlotDetailsImpl implements _SlotDetails {
  const _$SlotDetailsImpl({
    @JsonKey(name: "slot_id") this.slotId,
    @JsonKey(name: "slot_status") this.slotStatus,
    @JsonKey(name: "slot_start_time") this.slotStartTime,
    @JsonKey(name: "slot_end_time") this.slotEndTime,
    @JsonKey(name: "slot_date") this.slotDate,
    @JsonKey(name: "slot_full_time") this.slotFullTime,
    @JsonKey(name: "session_name") this.sessionName,
  });

  factory _$SlotDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlotDetailsImplFromJson(json);

  @override
  @JsonKey(name: "slot_id")
  final String? slotId;
  @override
  @JsonKey(name: "slot_status")
  final String? slotStatus;
  @override
  @JsonKey(name: "slot_start_time")
  final String? slotStartTime;
  @override
  @JsonKey(name: "slot_end_time")
  final String? slotEndTime;
  @override
  @JsonKey(name: "slot_date")
  final String? slotDate;
  @override
  @JsonKey(name: "slot_full_time")
  final String? slotFullTime;
  @override
  @JsonKey(name: "session_name")
  final String? sessionName;

  @override
  String toString() {
    return 'SlotDetails(slotId: $slotId, slotStatus: $slotStatus, slotStartTime: $slotStartTime, slotEndTime: $slotEndTime, slotDate: $slotDate, slotFullTime: $slotFullTime, sessionName: $sessionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlotDetailsImpl &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.slotStatus, slotStatus) ||
                other.slotStatus == slotStatus) &&
            (identical(other.slotStartTime, slotStartTime) ||
                other.slotStartTime == slotStartTime) &&
            (identical(other.slotEndTime, slotEndTime) ||
                other.slotEndTime == slotEndTime) &&
            (identical(other.slotDate, slotDate) ||
                other.slotDate == slotDate) &&
            (identical(other.slotFullTime, slotFullTime) ||
                other.slotFullTime == slotFullTime) &&
            (identical(other.sessionName, sessionName) ||
                other.sessionName == sessionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    slotId,
    slotStatus,
    slotStartTime,
    slotEndTime,
    slotDate,
    slotFullTime,
    sessionName,
  );

  /// Create a copy of SlotDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlotDetailsImplCopyWith<_$SlotDetailsImpl> get copyWith =>
      __$$SlotDetailsImplCopyWithImpl<_$SlotDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlotDetailsImplToJson(this);
  }
}

abstract class _SlotDetails implements SlotDetails {
  const factory _SlotDetails({
    @JsonKey(name: "slot_id") final String? slotId,
    @JsonKey(name: "slot_status") final String? slotStatus,
    @JsonKey(name: "slot_start_time") final String? slotStartTime,
    @JsonKey(name: "slot_end_time") final String? slotEndTime,
    @JsonKey(name: "slot_date") final String? slotDate,
    @JsonKey(name: "slot_full_time") final String? slotFullTime,
    @JsonKey(name: "session_name") final String? sessionName,
  }) = _$SlotDetailsImpl;

  factory _SlotDetails.fromJson(Map<String, dynamic> json) =
      _$SlotDetailsImpl.fromJson;

  @override
  @JsonKey(name: "slot_id")
  String? get slotId;
  @override
  @JsonKey(name: "slot_status")
  String? get slotStatus;
  @override
  @JsonKey(name: "slot_start_time")
  String? get slotStartTime;
  @override
  @JsonKey(name: "slot_end_time")
  String? get slotEndTime;
  @override
  @JsonKey(name: "slot_date")
  String? get slotDate;
  @override
  @JsonKey(name: "slot_full_time")
  String? get slotFullTime;
  @override
  @JsonKey(name: "session_name")
  String? get sessionName;

  /// Create a copy of SlotDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlotDetailsImplCopyWith<_$SlotDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "token_number")
  int? get tokenNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "mo_id")
  String? get moId => throw _privateConstructorUsedError;
  @JsonKey(name: "patient_name")
  String? get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_name")
  String? get doctorName => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: "consultation_type")
  String? get consultationType => throw _privateConstructorUsedError;
  @JsonKey(name: "appointment_date_time")
  String? get appointmentDateTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "fee_status")
  String? get feeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "fee_amount")
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_status")
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "booking_number")
  String? get bookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError; // Legacy fields for backward compatibility
  String? get appointmentId => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get doctorId => throw _privateConstructorUsedError;
  String? get appointmentDate => throw _privateConstructorUsedError;
  String? get appointmentTime => throw _privateConstructorUsedError;
  String? get bookedOn => throw _privateConstructorUsedError;
  String? get reasonForVisit => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double? get fee => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  Patient? get patient => throw _privateConstructorUsedError;
  Doctor? get doctor => throw _privateConstructorUsedError;

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
    Appointment value,
    $Res Function(Appointment) then,
  ) = _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: "token_number") int? tokenNumber,
    @JsonKey(name: "mo_id") String? moId,
    @JsonKey(name: "patient_name") String? patientName,
    @JsonKey(name: "doctor_name") String? doctorName,
    String? department,
    @JsonKey(name: "consultation_type") String? consultationType,
    @JsonKey(name: "appointment_date_time") String? appointmentDateTime,
    String? status,
    @JsonKey(name: "fee_status") String? feeStatus,
    @JsonKey(name: "fee_amount") double? feeAmount,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "booking_number") String? bookingNumber,
    @JsonKey(name: "created_at") String? createdAt,
    String? appointmentId,
    String? patientId,
    String? doctorId,
    String? appointmentDate,
    String? appointmentTime,
    String? bookedOn,
    String? reasonForVisit,
    String? notes,
    double? fee,
    String? paymentMethod,
    Patient? patient,
    Doctor? doctor,
  });

  $PatientCopyWith<$Res>? get patient;
  $DoctorCopyWith<$Res>? get doctor;
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tokenNumber = freezed,
    Object? moId = freezed,
    Object? patientName = freezed,
    Object? doctorName = freezed,
    Object? department = freezed,
    Object? consultationType = freezed,
    Object? appointmentDateTime = freezed,
    Object? status = freezed,
    Object? feeStatus = freezed,
    Object? feeAmount = freezed,
    Object? paymentStatus = freezed,
    Object? bookingNumber = freezed,
    Object? createdAt = freezed,
    Object? appointmentId = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? appointmentDate = freezed,
    Object? appointmentTime = freezed,
    Object? bookedOn = freezed,
    Object? reasonForVisit = freezed,
    Object? notes = freezed,
    Object? fee = freezed,
    Object? paymentMethod = freezed,
    Object? patient = freezed,
    Object? doctor = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            tokenNumber: freezed == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            moId: freezed == moId
                ? _value.moId
                : moId // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientName: freezed == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationType: freezed == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentDateTime: freezed == appointmentDateTime
                ? _value.appointmentDateTime
                : appointmentDateTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            feeStatus: freezed == feeStatus
                ? _value.feeStatus
                : feeStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            feeAmount: freezed == feeAmount
                ? _value.feeAmount
                : feeAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingNumber: freezed == bookingNumber
                ? _value.bookingNumber
                : bookingNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientId: freezed == patientId
                ? _value.patientId
                : patientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentDate: freezed == appointmentDate
                ? _value.appointmentDate
                : appointmentDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentTime: freezed == appointmentTime
                ? _value.appointmentTime
                : appointmentTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookedOn: freezed == bookedOn
                ? _value.bookedOn
                : bookedOn // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasonForVisit: freezed == reasonForVisit
                ? _value.reasonForVisit
                : reasonForVisit // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            fee: freezed == fee
                ? _value.fee
                : fee // ignore: cast_nullable_to_non_nullable
                      as double?,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            patient: freezed == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as Patient?,
            doctor: freezed == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as Doctor?,
          )
          as $Val,
    );
  }

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $PatientCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorCopyWith<$Res>? get doctor {
    if (_value.doctor == null) {
      return null;
    }

    return $DoctorCopyWith<$Res>(_value.doctor!, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentImplCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$AppointmentImplCopyWith(
    _$AppointmentImpl value,
    $Res Function(_$AppointmentImpl) then,
  ) = __$$AppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: "token_number") int? tokenNumber,
    @JsonKey(name: "mo_id") String? moId,
    @JsonKey(name: "patient_name") String? patientName,
    @JsonKey(name: "doctor_name") String? doctorName,
    String? department,
    @JsonKey(name: "consultation_type") String? consultationType,
    @JsonKey(name: "appointment_date_time") String? appointmentDateTime,
    String? status,
    @JsonKey(name: "fee_status") String? feeStatus,
    @JsonKey(name: "fee_amount") double? feeAmount,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "booking_number") String? bookingNumber,
    @JsonKey(name: "created_at") String? createdAt,
    String? appointmentId,
    String? patientId,
    String? doctorId,
    String? appointmentDate,
    String? appointmentTime,
    String? bookedOn,
    String? reasonForVisit,
    String? notes,
    double? fee,
    String? paymentMethod,
    Patient? patient,
    Doctor? doctor,
  });

  @override
  $PatientCopyWith<$Res>? get patient;
  @override
  $DoctorCopyWith<$Res>? get doctor;
}

/// @nodoc
class __$$AppointmentImplCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$AppointmentImpl>
    implements _$$AppointmentImplCopyWith<$Res> {
  __$$AppointmentImplCopyWithImpl(
    _$AppointmentImpl _value,
    $Res Function(_$AppointmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tokenNumber = freezed,
    Object? moId = freezed,
    Object? patientName = freezed,
    Object? doctorName = freezed,
    Object? department = freezed,
    Object? consultationType = freezed,
    Object? appointmentDateTime = freezed,
    Object? status = freezed,
    Object? feeStatus = freezed,
    Object? feeAmount = freezed,
    Object? paymentStatus = freezed,
    Object? bookingNumber = freezed,
    Object? createdAt = freezed,
    Object? appointmentId = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? appointmentDate = freezed,
    Object? appointmentTime = freezed,
    Object? bookedOn = freezed,
    Object? reasonForVisit = freezed,
    Object? notes = freezed,
    Object? fee = freezed,
    Object? paymentMethod = freezed,
    Object? patient = freezed,
    Object? doctor = freezed,
  }) {
    return _then(
      _$AppointmentImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        tokenNumber: freezed == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        moId: freezed == moId
            ? _value.moId
            : moId // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientName: freezed == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationType: freezed == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentDateTime: freezed == appointmentDateTime
            ? _value.appointmentDateTime
            : appointmentDateTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        feeStatus: freezed == feeStatus
            ? _value.feeStatus
            : feeStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        feeAmount: freezed == feeAmount
            ? _value.feeAmount
            : feeAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingNumber: freezed == bookingNumber
            ? _value.bookingNumber
            : bookingNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientId: freezed == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentDate: freezed == appointmentDate
            ? _value.appointmentDate
            : appointmentDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentTime: freezed == appointmentTime
            ? _value.appointmentTime
            : appointmentTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookedOn: freezed == bookedOn
            ? _value.bookedOn
            : bookedOn // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasonForVisit: freezed == reasonForVisit
            ? _value.reasonForVisit
            : reasonForVisit // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        fee: freezed == fee
            ? _value.fee
            : fee // ignore: cast_nullable_to_non_nullable
                  as double?,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        patient: freezed == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as Patient?,
        doctor: freezed == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as Doctor?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentImpl implements _Appointment {
  const _$AppointmentImpl({
    this.id,
    @JsonKey(name: "token_number") this.tokenNumber,
    @JsonKey(name: "mo_id") this.moId,
    @JsonKey(name: "patient_name") this.patientName,
    @JsonKey(name: "doctor_name") this.doctorName,
    this.department,
    @JsonKey(name: "consultation_type") this.consultationType,
    @JsonKey(name: "appointment_date_time") this.appointmentDateTime,
    this.status,
    @JsonKey(name: "fee_status") this.feeStatus,
    @JsonKey(name: "fee_amount") this.feeAmount,
    @JsonKey(name: "payment_status") this.paymentStatus,
    @JsonKey(name: "booking_number") this.bookingNumber,
    @JsonKey(name: "created_at") this.createdAt,
    this.appointmentId,
    this.patientId,
    this.doctorId,
    this.appointmentDate,
    this.appointmentTime,
    this.bookedOn,
    this.reasonForVisit,
    this.notes,
    this.fee,
    this.paymentMethod,
    this.patient,
    this.doctor,
  });

  factory _$AppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: "token_number")
  final int? tokenNumber;
  @override
  @JsonKey(name: "mo_id")
  final String? moId;
  @override
  @JsonKey(name: "patient_name")
  final String? patientName;
  @override
  @JsonKey(name: "doctor_name")
  final String? doctorName;
  @override
  final String? department;
  @override
  @JsonKey(name: "consultation_type")
  final String? consultationType;
  @override
  @JsonKey(name: "appointment_date_time")
  final String? appointmentDateTime;
  @override
  final String? status;
  @override
  @JsonKey(name: "fee_status")
  final String? feeStatus;
  @override
  @JsonKey(name: "fee_amount")
  final double? feeAmount;
  @override
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @override
  @JsonKey(name: "booking_number")
  final String? bookingNumber;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  // Legacy fields for backward compatibility
  @override
  final String? appointmentId;
  @override
  final String? patientId;
  @override
  final String? doctorId;
  @override
  final String? appointmentDate;
  @override
  final String? appointmentTime;
  @override
  final String? bookedOn;
  @override
  final String? reasonForVisit;
  @override
  final String? notes;
  @override
  final double? fee;
  @override
  final String? paymentMethod;
  @override
  final Patient? patient;
  @override
  final Doctor? doctor;

  @override
  String toString() {
    return 'Appointment(id: $id, tokenNumber: $tokenNumber, moId: $moId, patientName: $patientName, doctorName: $doctorName, department: $department, consultationType: $consultationType, appointmentDateTime: $appointmentDateTime, status: $status, feeStatus: $feeStatus, feeAmount: $feeAmount, paymentStatus: $paymentStatus, bookingNumber: $bookingNumber, createdAt: $createdAt, appointmentId: $appointmentId, patientId: $patientId, doctorId: $doctorId, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, bookedOn: $bookedOn, reasonForVisit: $reasonForVisit, notes: $notes, fee: $fee, paymentMethod: $paymentMethod, patient: $patient, doctor: $doctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.moId, moId) || other.moId == moId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.appointmentDateTime, appointmentDateTime) ||
                other.appointmentDateTime == appointmentDateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeStatus, feeStatus) ||
                other.feeStatus == feeStatus) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.bookingNumber, bookingNumber) ||
                other.bookingNumber == bookingNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.bookedOn, bookedOn) ||
                other.bookedOn == bookedOn) &&
            (identical(other.reasonForVisit, reasonForVisit) ||
                other.reasonForVisit == reasonForVisit) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.doctor, doctor) || other.doctor == doctor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    tokenNumber,
    moId,
    patientName,
    doctorName,
    department,
    consultationType,
    appointmentDateTime,
    status,
    feeStatus,
    feeAmount,
    paymentStatus,
    bookingNumber,
    createdAt,
    appointmentId,
    patientId,
    doctorId,
    appointmentDate,
    appointmentTime,
    bookedOn,
    reasonForVisit,
    notes,
    fee,
    paymentMethod,
    patient,
    doctor,
  ]);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      __$$AppointmentImplCopyWithImpl<_$AppointmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentImplToJson(this);
  }
}

abstract class _Appointment implements Appointment {
  const factory _Appointment({
    final String? id,
    @JsonKey(name: "token_number") final int? tokenNumber,
    @JsonKey(name: "mo_id") final String? moId,
    @JsonKey(name: "patient_name") final String? patientName,
    @JsonKey(name: "doctor_name") final String? doctorName,
    final String? department,
    @JsonKey(name: "consultation_type") final String? consultationType,
    @JsonKey(name: "appointment_date_time") final String? appointmentDateTime,
    final String? status,
    @JsonKey(name: "fee_status") final String? feeStatus,
    @JsonKey(name: "fee_amount") final double? feeAmount,
    @JsonKey(name: "payment_status") final String? paymentStatus,
    @JsonKey(name: "booking_number") final String? bookingNumber,
    @JsonKey(name: "created_at") final String? createdAt,
    final String? appointmentId,
    final String? patientId,
    final String? doctorId,
    final String? appointmentDate,
    final String? appointmentTime,
    final String? bookedOn,
    final String? reasonForVisit,
    final String? notes,
    final double? fee,
    final String? paymentMethod,
    final Patient? patient,
    final Doctor? doctor,
  }) = _$AppointmentImpl;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$AppointmentImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "token_number")
  int? get tokenNumber;
  @override
  @JsonKey(name: "mo_id")
  String? get moId;
  @override
  @JsonKey(name: "patient_name")
  String? get patientName;
  @override
  @JsonKey(name: "doctor_name")
  String? get doctorName;
  @override
  String? get department;
  @override
  @JsonKey(name: "consultation_type")
  String? get consultationType;
  @override
  @JsonKey(name: "appointment_date_time")
  String? get appointmentDateTime;
  @override
  String? get status;
  @override
  @JsonKey(name: "fee_status")
  String? get feeStatus;
  @override
  @JsonKey(name: "fee_amount")
  double? get feeAmount;
  @override
  @JsonKey(name: "payment_status")
  String? get paymentStatus;
  @override
  @JsonKey(name: "booking_number")
  String? get bookingNumber;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt; // Legacy fields for backward compatibility
  @override
  String? get appointmentId;
  @override
  String? get patientId;
  @override
  String? get doctorId;
  @override
  String? get appointmentDate;
  @override
  String? get appointmentTime;
  @override
  String? get bookedOn;
  @override
  String? get reasonForVisit;
  @override
  String? get notes;
  @override
  double? get fee;
  @override
  String? get paymentMethod;
  @override
  Patient? get patient;
  @override
  Doctor? get doctor;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentListResponse _$AppointmentListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AppointmentListResponse.fromJson(json);
}

/// @nodoc
mixin _$AppointmentListResponse {
  List<Appointment> get appointments => throw _privateConstructorUsedError;
  @JsonKey(name: "total_count")
  int? get totalCount => throw _privateConstructorUsedError;

  /// Serializes this AppointmentListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentListResponseCopyWith<AppointmentListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentListResponseCopyWith<$Res> {
  factory $AppointmentListResponseCopyWith(
    AppointmentListResponse value,
    $Res Function(AppointmentListResponse) then,
  ) = _$AppointmentListResponseCopyWithImpl<$Res, AppointmentListResponse>;
  @useResult
  $Res call({
    List<Appointment> appointments,
    @JsonKey(name: "total_count") int? totalCount,
  });
}

/// @nodoc
class _$AppointmentListResponseCopyWithImpl<
  $Res,
  $Val extends AppointmentListResponse
>
    implements $AppointmentListResponseCopyWith<$Res> {
  _$AppointmentListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appointments = null, Object? totalCount = freezed}) {
    return _then(
      _value.copyWith(
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<Appointment>,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentListResponseImplCopyWith<$Res>
    implements $AppointmentListResponseCopyWith<$Res> {
  factory _$$AppointmentListResponseImplCopyWith(
    _$AppointmentListResponseImpl value,
    $Res Function(_$AppointmentListResponseImpl) then,
  ) = __$$AppointmentListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Appointment> appointments,
    @JsonKey(name: "total_count") int? totalCount,
  });
}

/// @nodoc
class __$$AppointmentListResponseImplCopyWithImpl<$Res>
    extends
        _$AppointmentListResponseCopyWithImpl<
          $Res,
          _$AppointmentListResponseImpl
        >
    implements _$$AppointmentListResponseImplCopyWith<$Res> {
  __$$AppointmentListResponseImplCopyWithImpl(
    _$AppointmentListResponseImpl _value,
    $Res Function(_$AppointmentListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appointments = null, Object? totalCount = freezed}) {
    return _then(
      _$AppointmentListResponseImpl(
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<Appointment>,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentListResponseImpl implements _AppointmentListResponse {
  const _$AppointmentListResponseImpl({
    required final List<Appointment> appointments,
    @JsonKey(name: "total_count") this.totalCount,
  }) : _appointments = appointments;

  factory _$AppointmentListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentListResponseImplFromJson(json);

  final List<Appointment> _appointments;
  @override
  List<Appointment> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  @JsonKey(name: "total_count")
  final int? totalCount;

  @override
  String toString() {
    return 'AppointmentListResponse(appointments: $appointments, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentListResponseImpl &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_appointments),
    totalCount,
  );

  /// Create a copy of AppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentListResponseImplCopyWith<_$AppointmentListResponseImpl>
  get copyWith =>
      __$$AppointmentListResponseImplCopyWithImpl<
        _$AppointmentListResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentListResponseImplToJson(this);
  }
}

abstract class _AppointmentListResponse implements AppointmentListResponse {
  const factory _AppointmentListResponse({
    required final List<Appointment> appointments,
    @JsonKey(name: "total_count") final int? totalCount,
  }) = _$AppointmentListResponseImpl;

  factory _AppointmentListResponse.fromJson(Map<String, dynamic> json) =
      _$AppointmentListResponseImpl.fromJson;

  @override
  List<Appointment> get appointments;
  @override
  @JsonKey(name: "total_count")
  int? get totalCount;

  /// Create a copy of AppointmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentListResponseImplCopyWith<_$AppointmentListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get mobileId => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get bloodGroup => throw _privateConstructorUsedError;
  String? get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get smokingStatus => throw _privateConstructorUsedError;
  String? get alcoholUse => throw _privateConstructorUsedError;
  VitalSigns? get vitalSigns => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? mobileId,
    String? dateOfBirth,
    String? gender,
    String? bloodGroup,
    String? address1,
    String? address2,
    String? district,
    String? state,
    String? height,
    String? weight,
    String? smokingStatus,
    String? alcoholUse,
    VitalSigns? vitalSigns,
  });

  $VitalSignsCopyWith<$Res>? get vitalSigns;
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? mobileId = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? bloodGroup = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? smokingStatus = freezed,
    Object? alcoholUse = freezed,
    Object? vitalSigns = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            mobileId: freezed == mobileId
                ? _value.mobileId
                : mobileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodGroup: freezed == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            address1: freezed == address1
                ? _value.address1
                : address1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            address2: freezed == address2
                ? _value.address2
                : address2 // ignore: cast_nullable_to_non_nullable
                      as String?,
            district: freezed == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as String?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as String?,
            smokingStatus: freezed == smokingStatus
                ? _value.smokingStatus
                : smokingStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            alcoholUse: freezed == alcoholUse
                ? _value.alcoholUse
                : alcoholUse // ignore: cast_nullable_to_non_nullable
                      as String?,
            vitalSigns: freezed == vitalSigns
                ? _value.vitalSigns
                : vitalSigns // ignore: cast_nullable_to_non_nullable
                      as VitalSigns?,
          )
          as $Val,
    );
  }

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VitalSignsCopyWith<$Res>? get vitalSigns {
    if (_value.vitalSigns == null) {
      return null;
    }

    return $VitalSignsCopyWith<$Res>(_value.vitalSigns!, (value) {
      return _then(_value.copyWith(vitalSigns: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
    _$PatientImpl value,
    $Res Function(_$PatientImpl) then,
  ) = __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? mobileId,
    String? dateOfBirth,
    String? gender,
    String? bloodGroup,
    String? address1,
    String? address2,
    String? district,
    String? state,
    String? height,
    String? weight,
    String? smokingStatus,
    String? alcoholUse,
    VitalSigns? vitalSigns,
  });

  @override
  $VitalSignsCopyWith<$Res>? get vitalSigns;
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
    _$PatientImpl _value,
    $Res Function(_$PatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? mobileId = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? bloodGroup = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? smokingStatus = freezed,
    Object? alcoholUse = freezed,
    Object? vitalSigns = freezed,
  }) {
    return _then(
      _$PatientImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        mobileId: freezed == mobileId
            ? _value.mobileId
            : mobileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodGroup: freezed == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        address1: freezed == address1
            ? _value.address1
            : address1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        address2: freezed == address2
            ? _value.address2
            : address2 // ignore: cast_nullable_to_non_nullable
                  as String?,
        district: freezed == district
            ? _value.district
            : district // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as String?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as String?,
        smokingStatus: freezed == smokingStatus
            ? _value.smokingStatus
            : smokingStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        alcoholUse: freezed == alcoholUse
            ? _value.alcoholUse
            : alcoholUse // ignore: cast_nullable_to_non_nullable
                  as String?,
        vitalSigns: freezed == vitalSigns
            ? _value.vitalSigns
            : vitalSigns // ignore: cast_nullable_to_non_nullable
                  as VitalSigns?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.mobileId,
    this.dateOfBirth,
    this.gender,
    this.bloodGroup,
    this.address1,
    this.address2,
    this.district,
    this.state,
    this.height,
    this.weight,
    this.smokingStatus,
    this.alcoholUse,
    this.vitalSigns,
  });

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? mobileId;
  @override
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  final String? bloodGroup;
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? district;
  @override
  final String? state;
  @override
  final String? height;
  @override
  final String? weight;
  @override
  final String? smokingStatus;
  @override
  final String? alcoholUse;
  @override
  final VitalSigns? vitalSigns;

  @override
  String toString() {
    return 'Patient(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, mobileId: $mobileId, dateOfBirth: $dateOfBirth, gender: $gender, bloodGroup: $bloodGroup, address1: $address1, address2: $address2, district: $district, state: $state, height: $height, weight: $weight, smokingStatus: $smokingStatus, alcoholUse: $alcoholUse, vitalSigns: $vitalSigns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.mobileId, mobileId) ||
                other.mobileId == mobileId) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.smokingStatus, smokingStatus) ||
                other.smokingStatus == smokingStatus) &&
            (identical(other.alcoholUse, alcoholUse) ||
                other.alcoholUse == alcoholUse) &&
            (identical(other.vitalSigns, vitalSigns) ||
                other.vitalSigns == vitalSigns));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    email,
    phone,
    mobileId,
    dateOfBirth,
    gender,
    bloodGroup,
    address1,
    address2,
    district,
    state,
    height,
    weight,
    smokingStatus,
    alcoholUse,
    vitalSigns,
  );

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(this);
  }
}

abstract class _Patient implements Patient {
  const factory _Patient({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? phone,
    final String? mobileId,
    final String? dateOfBirth,
    final String? gender,
    final String? bloodGroup,
    final String? address1,
    final String? address2,
    final String? district,
    final String? state,
    final String? height,
    final String? weight,
    final String? smokingStatus,
    final String? alcoholUse,
    final VitalSigns? vitalSigns,
  }) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get mobileId;
  @override
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  String? get bloodGroup;
  @override
  String? get address1;
  @override
  String? get address2;
  @override
  String? get district;
  @override
  String? get state;
  @override
  String? get height;
  @override
  String? get weight;
  @override
  String? get smokingStatus;
  @override
  String? get alcoholUse;
  @override
  VitalSigns? get vitalSigns;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  String? get qualification => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get consultationFee => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  List<TimeSlot>? get availableSlots => throw _privateConstructorUsedError;

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call({
    String? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phone,
    String? department,
    String? specialization,
    String? qualification,
    String? experience,
    String? consultationFee,
    bool? isAvailable,
    List<TimeSlot>? availableSlots,
  });
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? department = freezed,
    Object? specialization = freezed,
    Object? qualification = freezed,
    Object? experience = freezed,
    Object? consultationFee = freezed,
    Object? isAvailable = freezed,
    Object? availableSlots = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialization: freezed == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String?,
            qualification: freezed == qualification
                ? _value.qualification
                : qualification // ignore: cast_nullable_to_non_nullable
                      as String?,
            experience: freezed == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationFee: freezed == consultationFee
                ? _value.consultationFee
                : consultationFee // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAvailable: freezed == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            availableSlots: freezed == availableSlots
                ? _value.availableSlots
                : availableSlots // ignore: cast_nullable_to_non_nullable
                      as List<TimeSlot>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorImplCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$DoctorImplCopyWith(
    _$DoctorImpl value,
    $Res Function(_$DoctorImpl) then,
  ) = __$$DoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phone,
    String? department,
    String? specialization,
    String? qualification,
    String? experience,
    String? consultationFee,
    bool? isAvailable,
    List<TimeSlot>? availableSlots,
  });
}

/// @nodoc
class __$$DoctorImplCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$DoctorImpl>
    implements _$$DoctorImplCopyWith<$Res> {
  __$$DoctorImplCopyWithImpl(
    _$DoctorImpl _value,
    $Res Function(_$DoctorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? department = freezed,
    Object? specialization = freezed,
    Object? qualification = freezed,
    Object? experience = freezed,
    Object? consultationFee = freezed,
    Object? isAvailable = freezed,
    Object? availableSlots = freezed,
  }) {
    return _then(
      _$DoctorImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialization: freezed == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String?,
        qualification: freezed == qualification
            ? _value.qualification
            : qualification // ignore: cast_nullable_to_non_nullable
                  as String?,
        experience: freezed == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationFee: freezed == consultationFee
            ? _value.consultationFee
            : consultationFee // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAvailable: freezed == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        availableSlots: freezed == availableSlots
            ? _value._availableSlots
            : availableSlots // ignore: cast_nullable_to_non_nullable
                  as List<TimeSlot>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorImpl implements _Doctor {
  const _$DoctorImpl({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.phone,
    this.department,
    this.specialization,
    this.qualification,
    this.experience,
    this.consultationFee,
    this.isAvailable,
    final List<TimeSlot>? availableSlots,
  }) : _availableSlots = availableSlots;

  factory _$DoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? department;
  @override
  final String? specialization;
  @override
  final String? qualification;
  @override
  final String? experience;
  @override
  final String? consultationFee;
  @override
  final bool? isAvailable;
  final List<TimeSlot>? _availableSlots;
  @override
  List<TimeSlot>? get availableSlots {
    final value = _availableSlots;
    if (value == null) return null;
    if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Doctor(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, phone: $phone, department: $department, specialization: $specialization, qualification: $qualification, experience: $experience, consultationFee: $consultationFee, isAvailable: $isAvailable, availableSlots: $availableSlots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.qualification, qualification) ||
                other.qualification == qualification) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.consultationFee, consultationFee) ||
                other.consultationFee == consultationFee) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality().equals(
              other._availableSlots,
              _availableSlots,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    fullName,
    email,
    phone,
    department,
    specialization,
    qualification,
    experience,
    consultationFee,
    isAvailable,
    const DeepCollectionEquality().hash(_availableSlots),
  );

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      __$$DoctorImplCopyWithImpl<_$DoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorImplToJson(this);
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor({
    final String? id,
    final String? firstName,
    final String? lastName,
    final String? fullName,
    final String? email,
    final String? phone,
    final String? department,
    final String? specialization,
    final String? qualification,
    final String? experience,
    final String? consultationFee,
    final bool? isAvailable,
    final List<TimeSlot>? availableSlots,
  }) = _$DoctorImpl;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$DoctorImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get fullName;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get department;
  @override
  String? get specialization;
  @override
  String? get qualification;
  @override
  String? get experience;
  @override
  String? get consultationFee;
  @override
  bool? get isAvailable;
  @override
  List<TimeSlot>? get availableSlots;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) {
  return _TimeSlot.fromJson(json);
}

/// @nodoc
mixin _$TimeSlot {
  String? get id => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  bool? get isBooked => throw _privateConstructorUsedError;
  String? get doctorId => throw _privateConstructorUsedError;

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call({
    String? id,
    String? time,
    String? date,
    bool? isAvailable,
    bool? isBooked,
    String? doctorId,
  });
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
    Object? date = freezed,
    Object? isAvailable = freezed,
    Object? isBooked = freezed,
    Object? doctorId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            time: freezed == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAvailable: freezed == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isBooked: freezed == isBooked
                ? _value.isBooked
                : isBooked // ignore: cast_nullable_to_non_nullable
                      as bool?,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
    _$TimeSlotImpl value,
    $Res Function(_$TimeSlotImpl) then,
  ) = __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? time,
    String? date,
    bool? isAvailable,
    bool? isBooked,
    String? doctorId,
  });
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
    _$TimeSlotImpl _value,
    $Res Function(_$TimeSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
    Object? date = freezed,
    Object? isAvailable = freezed,
    Object? isBooked = freezed,
    Object? doctorId = freezed,
  }) {
    return _then(
      _$TimeSlotImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        time: freezed == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAvailable: freezed == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isBooked: freezed == isBooked
            ? _value.isBooked
            : isBooked // ignore: cast_nullable_to_non_nullable
                  as bool?,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotImpl implements _TimeSlot {
  const _$TimeSlotImpl({
    this.id,
    this.time,
    this.date,
    this.isAvailable,
    this.isBooked,
    this.doctorId,
  });

  factory _$TimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotImplFromJson(json);

  @override
  final String? id;
  @override
  final String? time;
  @override
  final String? date;
  @override
  final bool? isAvailable;
  @override
  final bool? isBooked;
  @override
  final String? doctorId;

  @override
  String toString() {
    return 'TimeSlot(id: $id, time: $time, date: $date, isAvailable: $isAvailable, isBooked: $isBooked, doctorId: $doctorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isBooked, isBooked) ||
                other.isBooked == isBooked) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, time, date, isAvailable, isBooked, doctorId);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotImplToJson(this);
  }
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot({
    final String? id,
    final String? time,
    final String? date,
    final bool? isAvailable,
    final bool? isBooked,
    final String? doctorId,
  }) = _$TimeSlotImpl;

  factory _TimeSlot.fromJson(Map<String, dynamic> json) =
      _$TimeSlotImpl.fromJson;

  @override
  String? get id;
  @override
  String? get time;
  @override
  String? get date;
  @override
  bool? get isAvailable;
  @override
  bool? get isBooked;
  @override
  String? get doctorId;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VitalSigns _$VitalSignsFromJson(Map<String, dynamic> json) {
  return _VitalSigns.fromJson(json);
}

/// @nodoc
mixin _$VitalSigns {
  String? get bloodPressure => throw _privateConstructorUsedError;
  String? get temperature => throw _privateConstructorUsedError;
  String? get pulse => throw _privateConstructorUsedError;
  String? get respiratoryRate => throw _privateConstructorUsedError;
  String? get oxygenSaturation => throw _privateConstructorUsedError;

  /// Serializes this VitalSigns to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VitalSignsCopyWith<VitalSigns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VitalSignsCopyWith<$Res> {
  factory $VitalSignsCopyWith(
    VitalSigns value,
    $Res Function(VitalSigns) then,
  ) = _$VitalSignsCopyWithImpl<$Res, VitalSigns>;
  @useResult
  $Res call({
    String? bloodPressure,
    String? temperature,
    String? pulse,
    String? respiratoryRate,
    String? oxygenSaturation,
  });
}

/// @nodoc
class _$VitalSignsCopyWithImpl<$Res, $Val extends VitalSigns>
    implements $VitalSignsCopyWith<$Res> {
  _$VitalSignsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulse = freezed,
    Object? respiratoryRate = freezed,
    Object? oxygenSaturation = freezed,
  }) {
    return _then(
      _value.copyWith(
            bloodPressure: freezed == bloodPressure
                ? _value.bloodPressure
                : bloodPressure // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String?,
            pulse: freezed == pulse
                ? _value.pulse
                : pulse // ignore: cast_nullable_to_non_nullable
                      as String?,
            respiratoryRate: freezed == respiratoryRate
                ? _value.respiratoryRate
                : respiratoryRate // ignore: cast_nullable_to_non_nullable
                      as String?,
            oxygenSaturation: freezed == oxygenSaturation
                ? _value.oxygenSaturation
                : oxygenSaturation // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VitalSignsImplCopyWith<$Res>
    implements $VitalSignsCopyWith<$Res> {
  factory _$$VitalSignsImplCopyWith(
    _$VitalSignsImpl value,
    $Res Function(_$VitalSignsImpl) then,
  ) = __$$VitalSignsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? bloodPressure,
    String? temperature,
    String? pulse,
    String? respiratoryRate,
    String? oxygenSaturation,
  });
}

/// @nodoc
class __$$VitalSignsImplCopyWithImpl<$Res>
    extends _$VitalSignsCopyWithImpl<$Res, _$VitalSignsImpl>
    implements _$$VitalSignsImplCopyWith<$Res> {
  __$$VitalSignsImplCopyWithImpl(
    _$VitalSignsImpl _value,
    $Res Function(_$VitalSignsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bloodPressure = freezed,
    Object? temperature = freezed,
    Object? pulse = freezed,
    Object? respiratoryRate = freezed,
    Object? oxygenSaturation = freezed,
  }) {
    return _then(
      _$VitalSignsImpl(
        bloodPressure: freezed == bloodPressure
            ? _value.bloodPressure
            : bloodPressure // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String?,
        pulse: freezed == pulse
            ? _value.pulse
            : pulse // ignore: cast_nullable_to_non_nullable
                  as String?,
        respiratoryRate: freezed == respiratoryRate
            ? _value.respiratoryRate
            : respiratoryRate // ignore: cast_nullable_to_non_nullable
                  as String?,
        oxygenSaturation: freezed == oxygenSaturation
            ? _value.oxygenSaturation
            : oxygenSaturation // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VitalSignsImpl implements _VitalSigns {
  const _$VitalSignsImpl({
    this.bloodPressure,
    this.temperature,
    this.pulse,
    this.respiratoryRate,
    this.oxygenSaturation,
  });

  factory _$VitalSignsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VitalSignsImplFromJson(json);

  @override
  final String? bloodPressure;
  @override
  final String? temperature;
  @override
  final String? pulse;
  @override
  final String? respiratoryRate;
  @override
  final String? oxygenSaturation;

  @override
  String toString() {
    return 'VitalSigns(bloodPressure: $bloodPressure, temperature: $temperature, pulse: $pulse, respiratoryRate: $respiratoryRate, oxygenSaturation: $oxygenSaturation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VitalSignsImpl &&
            (identical(other.bloodPressure, bloodPressure) ||
                other.bloodPressure == bloodPressure) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.pulse, pulse) || other.pulse == pulse) &&
            (identical(other.respiratoryRate, respiratoryRate) ||
                other.respiratoryRate == respiratoryRate) &&
            (identical(other.oxygenSaturation, oxygenSaturation) ||
                other.oxygenSaturation == oxygenSaturation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bloodPressure,
    temperature,
    pulse,
    respiratoryRate,
    oxygenSaturation,
  );

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VitalSignsImplCopyWith<_$VitalSignsImpl> get copyWith =>
      __$$VitalSignsImplCopyWithImpl<_$VitalSignsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VitalSignsImplToJson(this);
  }
}

abstract class _VitalSigns implements VitalSigns {
  const factory _VitalSigns({
    final String? bloodPressure,
    final String? temperature,
    final String? pulse,
    final String? respiratoryRate,
    final String? oxygenSaturation,
  }) = _$VitalSignsImpl;

  factory _VitalSigns.fromJson(Map<String, dynamic> json) =
      _$VitalSignsImpl.fromJson;

  @override
  String? get bloodPressure;
  @override
  String? get temperature;
  @override
  String? get pulse;
  @override
  String? get respiratoryRate;
  @override
  String? get oxygenSaturation;

  /// Create a copy of VitalSigns
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VitalSignsImplCopyWith<_$VitalSignsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentSummary _$AppointmentSummaryFromJson(Map<String, dynamic> json) {
  return _AppointmentSummary.fromJson(json);
}

/// @nodoc
mixin _$AppointmentSummary {
  int? get todayAppointments => throw _privateConstructorUsedError;
  int? get upcomingAppointments => throw _privateConstructorUsedError;
  int? get completedAppointments => throw _privateConstructorUsedError;
  int? get cancelledAppointments => throw _privateConstructorUsedError;

  /// Serializes this AppointmentSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentSummaryCopyWith<AppointmentSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentSummaryCopyWith<$Res> {
  factory $AppointmentSummaryCopyWith(
    AppointmentSummary value,
    $Res Function(AppointmentSummary) then,
  ) = _$AppointmentSummaryCopyWithImpl<$Res, AppointmentSummary>;
  @useResult
  $Res call({
    int? todayAppointments,
    int? upcomingAppointments,
    int? completedAppointments,
    int? cancelledAppointments,
  });
}

/// @nodoc
class _$AppointmentSummaryCopyWithImpl<$Res, $Val extends AppointmentSummary>
    implements $AppointmentSummaryCopyWith<$Res> {
  _$AppointmentSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayAppointments = freezed,
    Object? upcomingAppointments = freezed,
    Object? completedAppointments = freezed,
    Object? cancelledAppointments = freezed,
  }) {
    return _then(
      _value.copyWith(
            todayAppointments: freezed == todayAppointments
                ? _value.todayAppointments
                : todayAppointments // ignore: cast_nullable_to_non_nullable
                      as int?,
            upcomingAppointments: freezed == upcomingAppointments
                ? _value.upcomingAppointments
                : upcomingAppointments // ignore: cast_nullable_to_non_nullable
                      as int?,
            completedAppointments: freezed == completedAppointments
                ? _value.completedAppointments
                : completedAppointments // ignore: cast_nullable_to_non_nullable
                      as int?,
            cancelledAppointments: freezed == cancelledAppointments
                ? _value.cancelledAppointments
                : cancelledAppointments // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentSummaryImplCopyWith<$Res>
    implements $AppointmentSummaryCopyWith<$Res> {
  factory _$$AppointmentSummaryImplCopyWith(
    _$AppointmentSummaryImpl value,
    $Res Function(_$AppointmentSummaryImpl) then,
  ) = __$$AppointmentSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? todayAppointments,
    int? upcomingAppointments,
    int? completedAppointments,
    int? cancelledAppointments,
  });
}

/// @nodoc
class __$$AppointmentSummaryImplCopyWithImpl<$Res>
    extends _$AppointmentSummaryCopyWithImpl<$Res, _$AppointmentSummaryImpl>
    implements _$$AppointmentSummaryImplCopyWith<$Res> {
  __$$AppointmentSummaryImplCopyWithImpl(
    _$AppointmentSummaryImpl _value,
    $Res Function(_$AppointmentSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayAppointments = freezed,
    Object? upcomingAppointments = freezed,
    Object? completedAppointments = freezed,
    Object? cancelledAppointments = freezed,
  }) {
    return _then(
      _$AppointmentSummaryImpl(
        todayAppointments: freezed == todayAppointments
            ? _value.todayAppointments
            : todayAppointments // ignore: cast_nullable_to_non_nullable
                  as int?,
        upcomingAppointments: freezed == upcomingAppointments
            ? _value.upcomingAppointments
            : upcomingAppointments // ignore: cast_nullable_to_non_nullable
                  as int?,
        completedAppointments: freezed == completedAppointments
            ? _value.completedAppointments
            : completedAppointments // ignore: cast_nullable_to_non_nullable
                  as int?,
        cancelledAppointments: freezed == cancelledAppointments
            ? _value.cancelledAppointments
            : cancelledAppointments // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentSummaryImpl implements _AppointmentSummary {
  const _$AppointmentSummaryImpl({
    this.todayAppointments,
    this.upcomingAppointments,
    this.completedAppointments,
    this.cancelledAppointments,
  });

  factory _$AppointmentSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentSummaryImplFromJson(json);

  @override
  final int? todayAppointments;
  @override
  final int? upcomingAppointments;
  @override
  final int? completedAppointments;
  @override
  final int? cancelledAppointments;

  @override
  String toString() {
    return 'AppointmentSummary(todayAppointments: $todayAppointments, upcomingAppointments: $upcomingAppointments, completedAppointments: $completedAppointments, cancelledAppointments: $cancelledAppointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentSummaryImpl &&
            (identical(other.todayAppointments, todayAppointments) ||
                other.todayAppointments == todayAppointments) &&
            (identical(other.upcomingAppointments, upcomingAppointments) ||
                other.upcomingAppointments == upcomingAppointments) &&
            (identical(other.completedAppointments, completedAppointments) ||
                other.completedAppointments == completedAppointments) &&
            (identical(other.cancelledAppointments, cancelledAppointments) ||
                other.cancelledAppointments == cancelledAppointments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    todayAppointments,
    upcomingAppointments,
    completedAppointments,
    cancelledAppointments,
  );

  /// Create a copy of AppointmentSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentSummaryImplCopyWith<_$AppointmentSummaryImpl> get copyWith =>
      __$$AppointmentSummaryImplCopyWithImpl<_$AppointmentSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentSummaryImplToJson(this);
  }
}

abstract class _AppointmentSummary implements AppointmentSummary {
  const factory _AppointmentSummary({
    final int? todayAppointments,
    final int? upcomingAppointments,
    final int? completedAppointments,
    final int? cancelledAppointments,
  }) = _$AppointmentSummaryImpl;

  factory _AppointmentSummary.fromJson(Map<String, dynamic> json) =
      _$AppointmentSummaryImpl.fromJson;

  @override
  int? get todayAppointments;
  @override
  int? get upcomingAppointments;
  @override
  int? get completedAppointments;
  @override
  int? get cancelledAppointments;

  /// Create a copy of AppointmentSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentSummaryImplCopyWith<_$AppointmentSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleAppointment _$SimpleAppointmentFromJson(Map<String, dynamic> json) {
  return _SimpleAppointment.fromJson(json);
}

/// @nodoc
mixin _$SimpleAppointment {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_number')
  String get bookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int get tokenNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_date')
  String get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_time')
  String get appointmentTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'consultation_type')
  String get consultationType => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount')
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_mode')
  String? get paymentMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SimpleAppointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleAppointmentCopyWith<SimpleAppointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleAppointmentCopyWith<$Res> {
  factory $SimpleAppointmentCopyWith(
    SimpleAppointment value,
    $Res Function(SimpleAppointment) then,
  ) = _$SimpleAppointmentCopyWithImpl<$Res, SimpleAppointment>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'booking_number') String bookingNumber,
    @JsonKey(name: 'token_number') int tokenNumber,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'appointment_time') String appointmentTime,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'consultation_type') String consultationType,
    String? reason,
    String status,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$SimpleAppointmentCopyWithImpl<$Res, $Val extends SimpleAppointment>
    implements $SimpleAppointmentCopyWith<$Res> {
  _$SimpleAppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicPatientId = null,
    Object? clinicId = null,
    Object? doctorId = null,
    Object? bookingNumber = null,
    Object? tokenNumber = null,
    Object? appointmentDate = null,
    Object? appointmentTime = null,
    Object? durationMinutes = freezed,
    Object? consultationType = null,
    Object? reason = freezed,
    Object? status = null,
    Object? feeAmount = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMode = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicPatientId: null == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
            bookingNumber: null == bookingNumber
                ? _value.bookingNumber
                : bookingNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenNumber: null == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            appointmentDate: null == appointmentDate
                ? _value.appointmentDate
                : appointmentDate // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentTime: null == appointmentTime
                ? _value.appointmentTime
                : appointmentTime // ignore: cast_nullable_to_non_nullable
                      as String,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            consultationType: null == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            feeAmount: freezed == feeAmount
                ? _value.feeAmount
                : feeAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentMode: freezed == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SimpleAppointmentImplCopyWith<$Res>
    implements $SimpleAppointmentCopyWith<$Res> {
  factory _$$SimpleAppointmentImplCopyWith(
    _$SimpleAppointmentImpl value,
    $Res Function(_$SimpleAppointmentImpl) then,
  ) = __$$SimpleAppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'clinic_patient_id') String clinicPatientId,
    @JsonKey(name: 'clinic_id') String clinicId,
    @JsonKey(name: 'doctor_id') String doctorId,
    @JsonKey(name: 'booking_number') String bookingNumber,
    @JsonKey(name: 'token_number') int tokenNumber,
    @JsonKey(name: 'appointment_date') String appointmentDate,
    @JsonKey(name: 'appointment_time') String appointmentTime,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'consultation_type') String consultationType,
    String? reason,
    String status,
    @JsonKey(name: 'fee_amount') double? feeAmount,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$SimpleAppointmentImplCopyWithImpl<$Res>
    extends _$SimpleAppointmentCopyWithImpl<$Res, _$SimpleAppointmentImpl>
    implements _$$SimpleAppointmentImplCopyWith<$Res> {
  __$$SimpleAppointmentImplCopyWithImpl(
    _$SimpleAppointmentImpl _value,
    $Res Function(_$SimpleAppointmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicPatientId = null,
    Object? clinicId = null,
    Object? doctorId = null,
    Object? bookingNumber = null,
    Object? tokenNumber = null,
    Object? appointmentDate = null,
    Object? appointmentTime = null,
    Object? durationMinutes = freezed,
    Object? consultationType = null,
    Object? reason = freezed,
    Object? status = null,
    Object? feeAmount = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMode = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$SimpleAppointmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicPatientId: null == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
        bookingNumber: null == bookingNumber
            ? _value.bookingNumber
            : bookingNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenNumber: null == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        appointmentDate: null == appointmentDate
            ? _value.appointmentDate
            : appointmentDate // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentTime: null == appointmentTime
            ? _value.appointmentTime
            : appointmentTime // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        consultationType: null == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        feeAmount: freezed == feeAmount
            ? _value.feeAmount
            : feeAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentMode: freezed == paymentMode
            ? _value.paymentMode
            : paymentMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleAppointmentImpl implements _SimpleAppointment {
  const _$SimpleAppointmentImpl({
    required this.id,
    @JsonKey(name: 'clinic_patient_id') required this.clinicPatientId,
    @JsonKey(name: 'clinic_id') required this.clinicId,
    @JsonKey(name: 'doctor_id') required this.doctorId,
    @JsonKey(name: 'booking_number') required this.bookingNumber,
    @JsonKey(name: 'token_number') required this.tokenNumber,
    @JsonKey(name: 'appointment_date') required this.appointmentDate,
    @JsonKey(name: 'appointment_time') required this.appointmentTime,
    @JsonKey(name: 'duration_minutes') this.durationMinutes,
    @JsonKey(name: 'consultation_type') required this.consultationType,
    this.reason,
    required this.status,
    @JsonKey(name: 'fee_amount') this.feeAmount,
    @JsonKey(name: 'payment_status') this.paymentStatus,
    @JsonKey(name: 'payment_mode') this.paymentMode,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$SimpleAppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleAppointmentImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  final String clinicId;
  @override
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @override
  @JsonKey(name: 'booking_number')
  final String bookingNumber;
  @override
  @JsonKey(name: 'token_number')
  final int tokenNumber;
  @override
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  @override
  @JsonKey(name: 'appointment_time')
  final String appointmentTime;
  @override
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  @override
  @JsonKey(name: 'consultation_type')
  final String consultationType;
  @override
  final String? reason;
  @override
  final String status;
  @override
  @JsonKey(name: 'fee_amount')
  final double? feeAmount;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'payment_mode')
  final String? paymentMode;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'SimpleAppointment(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, doctorId: $doctorId, bookingNumber: $bookingNumber, tokenNumber: $tokenNumber, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, durationMinutes: $durationMinutes, consultationType: $consultationType, reason: $reason, status: $status, feeAmount: $feeAmount, paymentStatus: $paymentStatus, paymentMode: $paymentMode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleAppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.bookingNumber, bookingNumber) ||
                other.bookingNumber == bookingNumber) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    clinicPatientId,
    clinicId,
    doctorId,
    bookingNumber,
    tokenNumber,
    appointmentDate,
    appointmentTime,
    durationMinutes,
    consultationType,
    reason,
    status,
    feeAmount,
    paymentStatus,
    paymentMode,
    createdAt,
    updatedAt,
  );

  /// Create a copy of SimpleAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleAppointmentImplCopyWith<_$SimpleAppointmentImpl> get copyWith =>
      __$$SimpleAppointmentImplCopyWithImpl<_$SimpleAppointmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleAppointmentImplToJson(this);
  }
}

abstract class _SimpleAppointment implements SimpleAppointment {
  const factory _SimpleAppointment({
    required final String id,
    @JsonKey(name: 'clinic_patient_id') required final String clinicPatientId,
    @JsonKey(name: 'clinic_id') required final String clinicId,
    @JsonKey(name: 'doctor_id') required final String doctorId,
    @JsonKey(name: 'booking_number') required final String bookingNumber,
    @JsonKey(name: 'token_number') required final int tokenNumber,
    @JsonKey(name: 'appointment_date') required final String appointmentDate,
    @JsonKey(name: 'appointment_time') required final String appointmentTime,
    @JsonKey(name: 'duration_minutes') final int? durationMinutes,
    @JsonKey(name: 'consultation_type') required final String consultationType,
    final String? reason,
    required final String status,
    @JsonKey(name: 'fee_amount') final double? feeAmount,
    @JsonKey(name: 'payment_status') final String? paymentStatus,
    @JsonKey(name: 'payment_mode') final String? paymentMode,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$SimpleAppointmentImpl;

  factory _SimpleAppointment.fromJson(Map<String, dynamic> json) =
      _$SimpleAppointmentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String get clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  String get clinicId;
  @override
  @JsonKey(name: 'doctor_id')
  String get doctorId;
  @override
  @JsonKey(name: 'booking_number')
  String get bookingNumber;
  @override
  @JsonKey(name: 'token_number')
  int get tokenNumber;
  @override
  @JsonKey(name: 'appointment_date')
  String get appointmentDate;
  @override
  @JsonKey(name: 'appointment_time')
  String get appointmentTime;
  @override
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes;
  @override
  @JsonKey(name: 'consultation_type')
  String get consultationType;
  @override
  String? get reason;
  @override
  String get status;
  @override
  @JsonKey(name: 'fee_amount')
  double? get feeAmount;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'payment_mode')
  String? get paymentMode;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of SimpleAppointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleAppointmentImplCopyWith<_$SimpleAppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleAppointmentResponse _$SimpleAppointmentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SimpleAppointmentResponse.fromJson(json);
}

/// @nodoc
mixin _$SimpleAppointmentResponse {
  String get message => throw _privateConstructorUsedError;
  SimpleAppointment get appointment =>
      throw _privateConstructorUsedError; // ✅ NEW: Follow-up information
  FollowUpInfo? get followUp => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_update')
  ClinicPatientUpdate? get clinicPatientUpdate =>
      throw _privateConstructorUsedError; // ✅ NEW: Appointment type flags
  @JsonKey(name: 'is_regular_appointment')
  bool? get isRegularAppointment => throw _privateConstructorUsedError;
  @JsonKey(name: 'followup_granted')
  bool? get followupGranted => throw _privateConstructorUsedError;
  @JsonKey(name: 'followup_message')
  String? get followupMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'followup_valid_until')
  String? get followupValidUntil => throw _privateConstructorUsedError; // ✅ NEW: Free follow-up flags
  @JsonKey(name: 'is_free_followup')
  bool? get isFreeFollowup => throw _privateConstructorUsedError;
  @JsonKey(name: 'followup_type')
  String? get followupType => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_info')
  FollowUpInfo? get followUpInfo => throw _privateConstructorUsedError; // ✅ NEW: Renewal options
  RenewalOptions? get renewalOptions => throw _privateConstructorUsedError;

  /// Serializes this SimpleAppointmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleAppointmentResponseCopyWith<SimpleAppointmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleAppointmentResponseCopyWith<$Res> {
  factory $SimpleAppointmentResponseCopyWith(
    SimpleAppointmentResponse value,
    $Res Function(SimpleAppointmentResponse) then,
  ) = _$SimpleAppointmentResponseCopyWithImpl<$Res, SimpleAppointmentResponse>;
  @useResult
  $Res call({
    String message,
    SimpleAppointment appointment,
    FollowUpInfo? followUp,
    @JsonKey(name: 'clinic_patient_update')
    ClinicPatientUpdate? clinicPatientUpdate,
    @JsonKey(name: 'is_regular_appointment') bool? isRegularAppointment,
    @JsonKey(name: 'followup_granted') bool? followupGranted,
    @JsonKey(name: 'followup_message') String? followupMessage,
    @JsonKey(name: 'followup_valid_until') String? followupValidUntil,
    @JsonKey(name: 'is_free_followup') bool? isFreeFollowup,
    @JsonKey(name: 'followup_type') String? followupType,
    @JsonKey(name: 'follow_up_info') FollowUpInfo? followUpInfo,
    RenewalOptions? renewalOptions,
  });

  $SimpleAppointmentCopyWith<$Res> get appointment;
  $FollowUpInfoCopyWith<$Res>? get followUp;
  $ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate;
  $FollowUpInfoCopyWith<$Res>? get followUpInfo;
  $RenewalOptionsCopyWith<$Res>? get renewalOptions;
}

/// @nodoc
class _$SimpleAppointmentResponseCopyWithImpl<
  $Res,
  $Val extends SimpleAppointmentResponse
>
    implements $SimpleAppointmentResponseCopyWith<$Res> {
  _$SimpleAppointmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? appointment = null,
    Object? followUp = freezed,
    Object? clinicPatientUpdate = freezed,
    Object? isRegularAppointment = freezed,
    Object? followupGranted = freezed,
    Object? followupMessage = freezed,
    Object? followupValidUntil = freezed,
    Object? isFreeFollowup = freezed,
    Object? followupType = freezed,
    Object? followUpInfo = freezed,
    Object? renewalOptions = freezed,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            appointment: null == appointment
                ? _value.appointment
                : appointment // ignore: cast_nullable_to_non_nullable
                      as SimpleAppointment,
            followUp: freezed == followUp
                ? _value.followUp
                : followUp // ignore: cast_nullable_to_non_nullable
                      as FollowUpInfo?,
            clinicPatientUpdate: freezed == clinicPatientUpdate
                ? _value.clinicPatientUpdate
                : clinicPatientUpdate // ignore: cast_nullable_to_non_nullable
                      as ClinicPatientUpdate?,
            isRegularAppointment: freezed == isRegularAppointment
                ? _value.isRegularAppointment
                : isRegularAppointment // ignore: cast_nullable_to_non_nullable
                      as bool?,
            followupGranted: freezed == followupGranted
                ? _value.followupGranted
                : followupGranted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            followupMessage: freezed == followupMessage
                ? _value.followupMessage
                : followupMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            followupValidUntil: freezed == followupValidUntil
                ? _value.followupValidUntil
                : followupValidUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFreeFollowup: freezed == isFreeFollowup
                ? _value.isFreeFollowup
                : isFreeFollowup // ignore: cast_nullable_to_non_nullable
                      as bool?,
            followupType: freezed == followupType
                ? _value.followupType
                : followupType // ignore: cast_nullable_to_non_nullable
                      as String?,
            followUpInfo: freezed == followUpInfo
                ? _value.followUpInfo
                : followUpInfo // ignore: cast_nullable_to_non_nullable
                      as FollowUpInfo?,
            renewalOptions: freezed == renewalOptions
                ? _value.renewalOptions
                : renewalOptions // ignore: cast_nullable_to_non_nullable
                      as RenewalOptions?,
          )
          as $Val,
    );
  }

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SimpleAppointmentCopyWith<$Res> get appointment {
    return $SimpleAppointmentCopyWith<$Res>(_value.appointment, (value) {
      return _then(_value.copyWith(appointment: value) as $Val);
    });
  }

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpInfoCopyWith<$Res>? get followUp {
    if (_value.followUp == null) {
      return null;
    }

    return $FollowUpInfoCopyWith<$Res>(_value.followUp!, (value) {
      return _then(_value.copyWith(followUp: value) as $Val);
    });
  }

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate {
    if (_value.clinicPatientUpdate == null) {
      return null;
    }

    return $ClinicPatientUpdateCopyWith<$Res>(_value.clinicPatientUpdate!, (
      value,
    ) {
      return _then(_value.copyWith(clinicPatientUpdate: value) as $Val);
    });
  }

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpInfoCopyWith<$Res>? get followUpInfo {
    if (_value.followUpInfo == null) {
      return null;
    }

    return $FollowUpInfoCopyWith<$Res>(_value.followUpInfo!, (value) {
      return _then(_value.copyWith(followUpInfo: value) as $Val);
    });
  }

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RenewalOptionsCopyWith<$Res>? get renewalOptions {
    if (_value.renewalOptions == null) {
      return null;
    }

    return $RenewalOptionsCopyWith<$Res>(_value.renewalOptions!, (value) {
      return _then(_value.copyWith(renewalOptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimpleAppointmentResponseImplCopyWith<$Res>
    implements $SimpleAppointmentResponseCopyWith<$Res> {
  factory _$$SimpleAppointmentResponseImplCopyWith(
    _$SimpleAppointmentResponseImpl value,
    $Res Function(_$SimpleAppointmentResponseImpl) then,
  ) = __$$SimpleAppointmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    SimpleAppointment appointment,
    FollowUpInfo? followUp,
    @JsonKey(name: 'clinic_patient_update')
    ClinicPatientUpdate? clinicPatientUpdate,
    @JsonKey(name: 'is_regular_appointment') bool? isRegularAppointment,
    @JsonKey(name: 'followup_granted') bool? followupGranted,
    @JsonKey(name: 'followup_message') String? followupMessage,
    @JsonKey(name: 'followup_valid_until') String? followupValidUntil,
    @JsonKey(name: 'is_free_followup') bool? isFreeFollowup,
    @JsonKey(name: 'followup_type') String? followupType,
    @JsonKey(name: 'follow_up_info') FollowUpInfo? followUpInfo,
    RenewalOptions? renewalOptions,
  });

  @override
  $SimpleAppointmentCopyWith<$Res> get appointment;
  @override
  $FollowUpInfoCopyWith<$Res>? get followUp;
  @override
  $ClinicPatientUpdateCopyWith<$Res>? get clinicPatientUpdate;
  @override
  $FollowUpInfoCopyWith<$Res>? get followUpInfo;
  @override
  $RenewalOptionsCopyWith<$Res>? get renewalOptions;
}

/// @nodoc
class __$$SimpleAppointmentResponseImplCopyWithImpl<$Res>
    extends
        _$SimpleAppointmentResponseCopyWithImpl<
          $Res,
          _$SimpleAppointmentResponseImpl
        >
    implements _$$SimpleAppointmentResponseImplCopyWith<$Res> {
  __$$SimpleAppointmentResponseImplCopyWithImpl(
    _$SimpleAppointmentResponseImpl _value,
    $Res Function(_$SimpleAppointmentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? appointment = null,
    Object? followUp = freezed,
    Object? clinicPatientUpdate = freezed,
    Object? isRegularAppointment = freezed,
    Object? followupGranted = freezed,
    Object? followupMessage = freezed,
    Object? followupValidUntil = freezed,
    Object? isFreeFollowup = freezed,
    Object? followupType = freezed,
    Object? followUpInfo = freezed,
    Object? renewalOptions = freezed,
  }) {
    return _then(
      _$SimpleAppointmentResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        appointment: null == appointment
            ? _value.appointment
            : appointment // ignore: cast_nullable_to_non_nullable
                  as SimpleAppointment,
        followUp: freezed == followUp
            ? _value.followUp
            : followUp // ignore: cast_nullable_to_non_nullable
                  as FollowUpInfo?,
        clinicPatientUpdate: freezed == clinicPatientUpdate
            ? _value.clinicPatientUpdate
            : clinicPatientUpdate // ignore: cast_nullable_to_non_nullable
                  as ClinicPatientUpdate?,
        isRegularAppointment: freezed == isRegularAppointment
            ? _value.isRegularAppointment
            : isRegularAppointment // ignore: cast_nullable_to_non_nullable
                  as bool?,
        followupGranted: freezed == followupGranted
            ? _value.followupGranted
            : followupGranted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        followupMessage: freezed == followupMessage
            ? _value.followupMessage
            : followupMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        followupValidUntil: freezed == followupValidUntil
            ? _value.followupValidUntil
            : followupValidUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFreeFollowup: freezed == isFreeFollowup
            ? _value.isFreeFollowup
            : isFreeFollowup // ignore: cast_nullable_to_non_nullable
                  as bool?,
        followupType: freezed == followupType
            ? _value.followupType
            : followupType // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpInfo: freezed == followUpInfo
            ? _value.followUpInfo
            : followUpInfo // ignore: cast_nullable_to_non_nullable
                  as FollowUpInfo?,
        renewalOptions: freezed == renewalOptions
            ? _value.renewalOptions
            : renewalOptions // ignore: cast_nullable_to_non_nullable
                  as RenewalOptions?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleAppointmentResponseImpl implements _SimpleAppointmentResponse {
  const _$SimpleAppointmentResponseImpl({
    required this.message,
    required this.appointment,
    this.followUp,
    @JsonKey(name: 'clinic_patient_update') this.clinicPatientUpdate,
    @JsonKey(name: 'is_regular_appointment') this.isRegularAppointment,
    @JsonKey(name: 'followup_granted') this.followupGranted,
    @JsonKey(name: 'followup_message') this.followupMessage,
    @JsonKey(name: 'followup_valid_until') this.followupValidUntil,
    @JsonKey(name: 'is_free_followup') this.isFreeFollowup,
    @JsonKey(name: 'followup_type') this.followupType,
    @JsonKey(name: 'follow_up_info') this.followUpInfo,
    this.renewalOptions,
  });

  factory _$SimpleAppointmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleAppointmentResponseImplFromJson(json);

  @override
  final String message;
  @override
  final SimpleAppointment appointment;
  // ✅ NEW: Follow-up information
  @override
  final FollowUpInfo? followUp;
  @override
  @JsonKey(name: 'clinic_patient_update')
  final ClinicPatientUpdate? clinicPatientUpdate;
  // ✅ NEW: Appointment type flags
  @override
  @JsonKey(name: 'is_regular_appointment')
  final bool? isRegularAppointment;
  @override
  @JsonKey(name: 'followup_granted')
  final bool? followupGranted;
  @override
  @JsonKey(name: 'followup_message')
  final String? followupMessage;
  @override
  @JsonKey(name: 'followup_valid_until')
  final String? followupValidUntil;
  // ✅ NEW: Free follow-up flags
  @override
  @JsonKey(name: 'is_free_followup')
  final bool? isFreeFollowup;
  @override
  @JsonKey(name: 'followup_type')
  final String? followupType;
  @override
  @JsonKey(name: 'follow_up_info')
  final FollowUpInfo? followUpInfo;
  // ✅ NEW: Renewal options
  @override
  final RenewalOptions? renewalOptions;

  @override
  String toString() {
    return 'SimpleAppointmentResponse(message: $message, appointment: $appointment, followUp: $followUp, clinicPatientUpdate: $clinicPatientUpdate, isRegularAppointment: $isRegularAppointment, followupGranted: $followupGranted, followupMessage: $followupMessage, followupValidUntil: $followupValidUntil, isFreeFollowup: $isFreeFollowup, followupType: $followupType, followUpInfo: $followUpInfo, renewalOptions: $renewalOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleAppointmentResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.appointment, appointment) ||
                other.appointment == appointment) &&
            (identical(other.followUp, followUp) ||
                other.followUp == followUp) &&
            (identical(other.clinicPatientUpdate, clinicPatientUpdate) ||
                other.clinicPatientUpdate == clinicPatientUpdate) &&
            (identical(other.isRegularAppointment, isRegularAppointment) ||
                other.isRegularAppointment == isRegularAppointment) &&
            (identical(other.followupGranted, followupGranted) ||
                other.followupGranted == followupGranted) &&
            (identical(other.followupMessage, followupMessage) ||
                other.followupMessage == followupMessage) &&
            (identical(other.followupValidUntil, followupValidUntil) ||
                other.followupValidUntil == followupValidUntil) &&
            (identical(other.isFreeFollowup, isFreeFollowup) ||
                other.isFreeFollowup == isFreeFollowup) &&
            (identical(other.followupType, followupType) ||
                other.followupType == followupType) &&
            (identical(other.followUpInfo, followUpInfo) ||
                other.followUpInfo == followUpInfo) &&
            (identical(other.renewalOptions, renewalOptions) ||
                other.renewalOptions == renewalOptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    appointment,
    followUp,
    clinicPatientUpdate,
    isRegularAppointment,
    followupGranted,
    followupMessage,
    followupValidUntil,
    isFreeFollowup,
    followupType,
    followUpInfo,
    renewalOptions,
  );

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleAppointmentResponseImplCopyWith<_$SimpleAppointmentResponseImpl>
  get copyWith =>
      __$$SimpleAppointmentResponseImplCopyWithImpl<
        _$SimpleAppointmentResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleAppointmentResponseImplToJson(this);
  }
}

abstract class _SimpleAppointmentResponse implements SimpleAppointmentResponse {
  const factory _SimpleAppointmentResponse({
    required final String message,
    required final SimpleAppointment appointment,
    final FollowUpInfo? followUp,
    @JsonKey(name: 'clinic_patient_update')
    final ClinicPatientUpdate? clinicPatientUpdate,
    @JsonKey(name: 'is_regular_appointment') final bool? isRegularAppointment,
    @JsonKey(name: 'followup_granted') final bool? followupGranted,
    @JsonKey(name: 'followup_message') final String? followupMessage,
    @JsonKey(name: 'followup_valid_until') final String? followupValidUntil,
    @JsonKey(name: 'is_free_followup') final bool? isFreeFollowup,
    @JsonKey(name: 'followup_type') final String? followupType,
    @JsonKey(name: 'follow_up_info') final FollowUpInfo? followUpInfo,
    final RenewalOptions? renewalOptions,
  }) = _$SimpleAppointmentResponseImpl;

  factory _SimpleAppointmentResponse.fromJson(Map<String, dynamic> json) =
      _$SimpleAppointmentResponseImpl.fromJson;

  @override
  String get message;
  @override
  SimpleAppointment get appointment; // ✅ NEW: Follow-up information
  @override
  FollowUpInfo? get followUp;
  @override
  @JsonKey(name: 'clinic_patient_update')
  ClinicPatientUpdate? get clinicPatientUpdate; // ✅ NEW: Appointment type flags
  @override
  @JsonKey(name: 'is_regular_appointment')
  bool? get isRegularAppointment;
  @override
  @JsonKey(name: 'followup_granted')
  bool? get followupGranted;
  @override
  @JsonKey(name: 'followup_message')
  String? get followupMessage;
  @override
  @JsonKey(name: 'followup_valid_until')
  String? get followupValidUntil; // ✅ NEW: Free follow-up flags
  @override
  @JsonKey(name: 'is_free_followup')
  bool? get isFreeFollowup;
  @override
  @JsonKey(name: 'followup_type')
  String? get followupType;
  @override
  @JsonKey(name: 'follow_up_info')
  FollowUpInfo? get followUpInfo; // ✅ NEW: Renewal options
  @override
  RenewalOptions? get renewalOptions;

  /// Create a copy of SimpleAppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleAppointmentResponseImplCopyWith<_$SimpleAppointmentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FollowUpInfo _$FollowUpInfoFromJson(Map<String, dynamic> json) {
  return _FollowUpInfo.fromJson(json);
}

/// @nodoc
mixin _$FollowUpInfo {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  String? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_name')
  String? get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  String? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String? get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_appointment_id')
  String? get sourceAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_status')
  String? get followUpStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_free')
  bool? get isFree => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_from')
  String? get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until')
  String? get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_appointment_id')
  String? get usedAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_at')
  String? get usedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'renewed_at')
  String? get renewedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'renewed_by_appointment_id')
  String? get renewedByAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_slot_type')
  String? get appointmentSlotType => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_type')
  String? get followUpType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FollowUpInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpInfoCopyWith<FollowUpInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpInfoCopyWith<$Res> {
  factory $FollowUpInfoCopyWith(
    FollowUpInfo value,
    $Res Function(FollowUpInfo) then,
  ) = _$FollowUpInfoCopyWithImpl<$Res, FollowUpInfo>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'patient_name') String? patientName,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    @JsonKey(name: 'source_appointment_id') String? sourceAppointmentId,
    @JsonKey(name: 'follow_up_status') String? followUpStatus,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'valid_from') String? validFrom,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'used_appointment_id') String? usedAppointmentId,
    @JsonKey(name: 'used_at') String? usedAt,
    @JsonKey(name: 'renewed_at') String? renewedAt,
    @JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,
    @JsonKey(name: 'appointment_slot_type') String? appointmentSlotType,
    @JsonKey(name: 'follow_up_type') String? followUpType,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$FollowUpInfoCopyWithImpl<$Res, $Val extends FollowUpInfo>
    implements $FollowUpInfoCopyWith<$Res> {
  _$FollowUpInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clinicPatientId = freezed,
    Object? clinicId = freezed,
    Object? patientName = freezed,
    Object? doctorId = freezed,
    Object? doctorName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? sourceAppointmentId = freezed,
    Object? followUpStatus = freezed,
    Object? isFree = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? daysRemaining = freezed,
    Object? usedAppointmentId = freezed,
    Object? usedAt = freezed,
    Object? renewedAt = freezed,
    Object? renewedByAppointmentId = freezed,
    Object? appointmentSlotType = freezed,
    Object? followUpType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicPatientId: freezed == clinicPatientId
                ? _value.clinicPatientId
                : clinicPatientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicId: freezed == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientName: freezed == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorId: freezed == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentName: freezed == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String?,
            sourceAppointmentId: freezed == sourceAppointmentId
                ? _value.sourceAppointmentId
                : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            followUpStatus: freezed == followUpStatus
                ? _value.followUpStatus
                : followUpStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFree: freezed == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as bool?,
            validFrom: freezed == validFrom
                ? _value.validFrom
                : validFrom // ignore: cast_nullable_to_non_nullable
                      as String?,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
            daysRemaining: freezed == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int?,
            usedAppointmentId: freezed == usedAppointmentId
                ? _value.usedAppointmentId
                : usedAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            usedAt: freezed == usedAt
                ? _value.usedAt
                : usedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            renewedAt: freezed == renewedAt
                ? _value.renewedAt
                : renewedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            renewedByAppointmentId: freezed == renewedByAppointmentId
                ? _value.renewedByAppointmentId
                : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentSlotType: freezed == appointmentSlotType
                ? _value.appointmentSlotType
                : appointmentSlotType // ignore: cast_nullable_to_non_nullable
                      as String?,
            followUpType: freezed == followUpType
                ? _value.followUpType
                : followUpType // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowUpInfoImplCopyWith<$Res>
    implements $FollowUpInfoCopyWith<$Res> {
  factory _$$FollowUpInfoImplCopyWith(
    _$FollowUpInfoImpl value,
    $Res Function(_$FollowUpInfoImpl) then,
  ) = __$$FollowUpInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'clinic_patient_id') String? clinicPatientId,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'patient_name') String? patientName,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'doctor_name') String? doctorName,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    @JsonKey(name: 'source_appointment_id') String? sourceAppointmentId,
    @JsonKey(name: 'follow_up_status') String? followUpStatus,
    @JsonKey(name: 'is_free') bool? isFree,
    @JsonKey(name: 'valid_from') String? validFrom,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'used_appointment_id') String? usedAppointmentId,
    @JsonKey(name: 'used_at') String? usedAt,
    @JsonKey(name: 'renewed_at') String? renewedAt,
    @JsonKey(name: 'renewed_by_appointment_id') String? renewedByAppointmentId,
    @JsonKey(name: 'appointment_slot_type') String? appointmentSlotType,
    @JsonKey(name: 'follow_up_type') String? followUpType,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$FollowUpInfoImplCopyWithImpl<$Res>
    extends _$FollowUpInfoCopyWithImpl<$Res, _$FollowUpInfoImpl>
    implements _$$FollowUpInfoImplCopyWith<$Res> {
  __$$FollowUpInfoImplCopyWithImpl(
    _$FollowUpInfoImpl _value,
    $Res Function(_$FollowUpInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clinicPatientId = freezed,
    Object? clinicId = freezed,
    Object? patientName = freezed,
    Object? doctorId = freezed,
    Object? doctorName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? sourceAppointmentId = freezed,
    Object? followUpStatus = freezed,
    Object? isFree = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? daysRemaining = freezed,
    Object? usedAppointmentId = freezed,
    Object? usedAt = freezed,
    Object? renewedAt = freezed,
    Object? renewedByAppointmentId = freezed,
    Object? appointmentSlotType = freezed,
    Object? followUpType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$FollowUpInfoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicPatientId: freezed == clinicPatientId
            ? _value.clinicPatientId
            : clinicPatientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicId: freezed == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientName: freezed == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorId: freezed == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentName: freezed == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sourceAppointmentId: freezed == sourceAppointmentId
            ? _value.sourceAppointmentId
            : sourceAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpStatus: freezed == followUpStatus
            ? _value.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFree: freezed == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as bool?,
        validFrom: freezed == validFrom
            ? _value.validFrom
            : validFrom // ignore: cast_nullable_to_non_nullable
                  as String?,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
        daysRemaining: freezed == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int?,
        usedAppointmentId: freezed == usedAppointmentId
            ? _value.usedAppointmentId
            : usedAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        usedAt: freezed == usedAt
            ? _value.usedAt
            : usedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        renewedAt: freezed == renewedAt
            ? _value.renewedAt
            : renewedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        renewedByAppointmentId: freezed == renewedByAppointmentId
            ? _value.renewedByAppointmentId
            : renewedByAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentSlotType: freezed == appointmentSlotType
            ? _value.appointmentSlotType
            : appointmentSlotType // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpType: freezed == followUpType
            ? _value.followUpType
            : followUpType // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpInfoImpl implements _FollowUpInfo {
  const _$FollowUpInfoImpl({
    this.id,
    @JsonKey(name: 'clinic_patient_id') this.clinicPatientId,
    @JsonKey(name: 'clinic_id') this.clinicId,
    @JsonKey(name: 'patient_name') this.patientName,
    @JsonKey(name: 'doctor_id') this.doctorId,
    @JsonKey(name: 'doctor_name') this.doctorName,
    @JsonKey(name: 'department_id') this.departmentId,
    @JsonKey(name: 'department_name') this.departmentName,
    @JsonKey(name: 'source_appointment_id') this.sourceAppointmentId,
    @JsonKey(name: 'follow_up_status') this.followUpStatus,
    @JsonKey(name: 'is_free') this.isFree,
    @JsonKey(name: 'valid_from') this.validFrom,
    @JsonKey(name: 'valid_until') this.validUntil,
    @JsonKey(name: 'days_remaining') this.daysRemaining,
    @JsonKey(name: 'used_appointment_id') this.usedAppointmentId,
    @JsonKey(name: 'used_at') this.usedAt,
    @JsonKey(name: 'renewed_at') this.renewedAt,
    @JsonKey(name: 'renewed_by_appointment_id') this.renewedByAppointmentId,
    @JsonKey(name: 'appointment_slot_type') this.appointmentSlotType,
    @JsonKey(name: 'follow_up_type') this.followUpType,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$FollowUpInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpInfoImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  final String? clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  final String? clinicId;
  @override
  @JsonKey(name: 'patient_name')
  final String? patientName;
  @override
  @JsonKey(name: 'doctor_id')
  final String? doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  final String? doctorName;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;
  @override
  @JsonKey(name: 'department_name')
  final String? departmentName;
  @override
  @JsonKey(name: 'source_appointment_id')
  final String? sourceAppointmentId;
  @override
  @JsonKey(name: 'follow_up_status')
  final String? followUpStatus;
  @override
  @JsonKey(name: 'is_free')
  final bool? isFree;
  @override
  @JsonKey(name: 'valid_from')
  final String? validFrom;
  @override
  @JsonKey(name: 'valid_until')
  final String? validUntil;
  @override
  @JsonKey(name: 'days_remaining')
  final int? daysRemaining;
  @override
  @JsonKey(name: 'used_appointment_id')
  final String? usedAppointmentId;
  @override
  @JsonKey(name: 'used_at')
  final String? usedAt;
  @override
  @JsonKey(name: 'renewed_at')
  final String? renewedAt;
  @override
  @JsonKey(name: 'renewed_by_appointment_id')
  final String? renewedByAppointmentId;
  @override
  @JsonKey(name: 'appointment_slot_type')
  final String? appointmentSlotType;
  @override
  @JsonKey(name: 'follow_up_type')
  final String? followUpType;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'FollowUpInfo(id: $id, clinicPatientId: $clinicPatientId, clinicId: $clinicId, patientName: $patientName, doctorId: $doctorId, doctorName: $doctorName, departmentId: $departmentId, departmentName: $departmentName, sourceAppointmentId: $sourceAppointmentId, followUpStatus: $followUpStatus, isFree: $isFree, validFrom: $validFrom, validUntil: $validUntil, daysRemaining: $daysRemaining, usedAppointmentId: $usedAppointmentId, usedAt: $usedAt, renewedAt: $renewedAt, renewedByAppointmentId: $renewedByAppointmentId, appointmentSlotType: $appointmentSlotType, followUpType: $followUpType, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicPatientId, clinicPatientId) ||
                other.clinicPatientId == clinicPatientId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.sourceAppointmentId, sourceAppointmentId) ||
                other.sourceAppointmentId == sourceAppointmentId) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.usedAppointmentId, usedAppointmentId) ||
                other.usedAppointmentId == usedAppointmentId) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.renewedAt, renewedAt) ||
                other.renewedAt == renewedAt) &&
            (identical(other.renewedByAppointmentId, renewedByAppointmentId) ||
                other.renewedByAppointmentId == renewedByAppointmentId) &&
            (identical(other.appointmentSlotType, appointmentSlotType) ||
                other.appointmentSlotType == appointmentSlotType) &&
            (identical(other.followUpType, followUpType) ||
                other.followUpType == followUpType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    clinicPatientId,
    clinicId,
    patientName,
    doctorId,
    doctorName,
    departmentId,
    departmentName,
    sourceAppointmentId,
    followUpStatus,
    isFree,
    validFrom,
    validUntil,
    daysRemaining,
    usedAppointmentId,
    usedAt,
    renewedAt,
    renewedByAppointmentId,
    appointmentSlotType,
    followUpType,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of FollowUpInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpInfoImplCopyWith<_$FollowUpInfoImpl> get copyWith =>
      __$$FollowUpInfoImplCopyWithImpl<_$FollowUpInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpInfoImplToJson(this);
  }
}

abstract class _FollowUpInfo implements FollowUpInfo {
  const factory _FollowUpInfo({
    final String? id,
    @JsonKey(name: 'clinic_patient_id') final String? clinicPatientId,
    @JsonKey(name: 'clinic_id') final String? clinicId,
    @JsonKey(name: 'patient_name') final String? patientName,
    @JsonKey(name: 'doctor_id') final String? doctorId,
    @JsonKey(name: 'doctor_name') final String? doctorName,
    @JsonKey(name: 'department_id') final String? departmentId,
    @JsonKey(name: 'department_name') final String? departmentName,
    @JsonKey(name: 'source_appointment_id') final String? sourceAppointmentId,
    @JsonKey(name: 'follow_up_status') final String? followUpStatus,
    @JsonKey(name: 'is_free') final bool? isFree,
    @JsonKey(name: 'valid_from') final String? validFrom,
    @JsonKey(name: 'valid_until') final String? validUntil,
    @JsonKey(name: 'days_remaining') final int? daysRemaining,
    @JsonKey(name: 'used_appointment_id') final String? usedAppointmentId,
    @JsonKey(name: 'used_at') final String? usedAt,
    @JsonKey(name: 'renewed_at') final String? renewedAt,
    @JsonKey(name: 'renewed_by_appointment_id')
    final String? renewedByAppointmentId,
    @JsonKey(name: 'appointment_slot_type') final String? appointmentSlotType,
    @JsonKey(name: 'follow_up_type') final String? followUpType,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$FollowUpInfoImpl;

  factory _FollowUpInfo.fromJson(Map<String, dynamic> json) =
      _$FollowUpInfoImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'clinic_patient_id')
  String? get clinicPatientId;
  @override
  @JsonKey(name: 'clinic_id')
  String? get clinicId;
  @override
  @JsonKey(name: 'patient_name')
  String? get patientName;
  @override
  @JsonKey(name: 'doctor_id')
  String? get doctorId;
  @override
  @JsonKey(name: 'doctor_name')
  String? get doctorName;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;
  @override
  @JsonKey(name: 'department_name')
  String? get departmentName;
  @override
  @JsonKey(name: 'source_appointment_id')
  String? get sourceAppointmentId;
  @override
  @JsonKey(name: 'follow_up_status')
  String? get followUpStatus;
  @override
  @JsonKey(name: 'is_free')
  bool? get isFree;
  @override
  @JsonKey(name: 'valid_from')
  String? get validFrom;
  @override
  @JsonKey(name: 'valid_until')
  String? get validUntil;
  @override
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining;
  @override
  @JsonKey(name: 'used_appointment_id')
  String? get usedAppointmentId;
  @override
  @JsonKey(name: 'used_at')
  String? get usedAt;
  @override
  @JsonKey(name: 'renewed_at')
  String? get renewedAt;
  @override
  @JsonKey(name: 'renewed_by_appointment_id')
  String? get renewedByAppointmentId;
  @override
  @JsonKey(name: 'appointment_slot_type')
  String? get appointmentSlotType;
  @override
  @JsonKey(name: 'follow_up_type')
  String? get followUpType;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of FollowUpInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpInfoImplCopyWith<_$FollowUpInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicPatientUpdate _$ClinicPatientUpdateFromJson(Map<String, dynamic> json) {
  return _ClinicPatientUpdate.fromJson(json);
}

/// @nodoc
mixin _$ClinicPatientUpdate {
  @JsonKey(name: 'current_followup_status')
  String? get currentFollowupStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_appointment_id')
  String? get lastAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_followup_id')
  String? get lastFollowupId => throw _privateConstructorUsedError;

  /// Serializes this ClinicPatientUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicPatientUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicPatientUpdateCopyWith<ClinicPatientUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicPatientUpdateCopyWith<$Res> {
  factory $ClinicPatientUpdateCopyWith(
    ClinicPatientUpdate value,
    $Res Function(ClinicPatientUpdate) then,
  ) = _$ClinicPatientUpdateCopyWithImpl<$Res, ClinicPatientUpdate>;
  @useResult
  $Res call({
    @JsonKey(name: 'current_followup_status') String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') String? lastFollowupId,
  });
}

/// @nodoc
class _$ClinicPatientUpdateCopyWithImpl<$Res, $Val extends ClinicPatientUpdate>
    implements $ClinicPatientUpdateCopyWith<$Res> {
  _$ClinicPatientUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicPatientUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFollowupStatus = freezed,
    Object? lastAppointmentId = freezed,
    Object? lastFollowupId = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentFollowupStatus: freezed == currentFollowupStatus
                ? _value.currentFollowupStatus
                : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastAppointmentId: freezed == lastAppointmentId
                ? _value.lastAppointmentId
                : lastAppointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastFollowupId: freezed == lastFollowupId
                ? _value.lastFollowupId
                : lastFollowupId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicPatientUpdateImplCopyWith<$Res>
    implements $ClinicPatientUpdateCopyWith<$Res> {
  factory _$$ClinicPatientUpdateImplCopyWith(
    _$ClinicPatientUpdateImpl value,
    $Res Function(_$ClinicPatientUpdateImpl) then,
  ) = __$$ClinicPatientUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'current_followup_status') String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') String? lastFollowupId,
  });
}

/// @nodoc
class __$$ClinicPatientUpdateImplCopyWithImpl<$Res>
    extends _$ClinicPatientUpdateCopyWithImpl<$Res, _$ClinicPatientUpdateImpl>
    implements _$$ClinicPatientUpdateImplCopyWith<$Res> {
  __$$ClinicPatientUpdateImplCopyWithImpl(
    _$ClinicPatientUpdateImpl _value,
    $Res Function(_$ClinicPatientUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicPatientUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFollowupStatus = freezed,
    Object? lastAppointmentId = freezed,
    Object? lastFollowupId = freezed,
  }) {
    return _then(
      _$ClinicPatientUpdateImpl(
        currentFollowupStatus: freezed == currentFollowupStatus
            ? _value.currentFollowupStatus
            : currentFollowupStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastAppointmentId: freezed == lastAppointmentId
            ? _value.lastAppointmentId
            : lastAppointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastFollowupId: freezed == lastFollowupId
            ? _value.lastFollowupId
            : lastFollowupId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicPatientUpdateImpl implements _ClinicPatientUpdate {
  const _$ClinicPatientUpdateImpl({
    @JsonKey(name: 'current_followup_status') this.currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') this.lastAppointmentId,
    @JsonKey(name: 'last_followup_id') this.lastFollowupId,
  });

  factory _$ClinicPatientUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicPatientUpdateImplFromJson(json);

  @override
  @JsonKey(name: 'current_followup_status')
  final String? currentFollowupStatus;
  @override
  @JsonKey(name: 'last_appointment_id')
  final String? lastAppointmentId;
  @override
  @JsonKey(name: 'last_followup_id')
  final String? lastFollowupId;

  @override
  String toString() {
    return 'ClinicPatientUpdate(currentFollowupStatus: $currentFollowupStatus, lastAppointmentId: $lastAppointmentId, lastFollowupId: $lastFollowupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicPatientUpdateImpl &&
            (identical(other.currentFollowupStatus, currentFollowupStatus) ||
                other.currentFollowupStatus == currentFollowupStatus) &&
            (identical(other.lastAppointmentId, lastAppointmentId) ||
                other.lastAppointmentId == lastAppointmentId) &&
            (identical(other.lastFollowupId, lastFollowupId) ||
                other.lastFollowupId == lastFollowupId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentFollowupStatus,
    lastAppointmentId,
    lastFollowupId,
  );

  /// Create a copy of ClinicPatientUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicPatientUpdateImplCopyWith<_$ClinicPatientUpdateImpl> get copyWith =>
      __$$ClinicPatientUpdateImplCopyWithImpl<_$ClinicPatientUpdateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicPatientUpdateImplToJson(this);
  }
}

abstract class _ClinicPatientUpdate implements ClinicPatientUpdate {
  const factory _ClinicPatientUpdate({
    @JsonKey(name: 'current_followup_status')
    final String? currentFollowupStatus,
    @JsonKey(name: 'last_appointment_id') final String? lastAppointmentId,
    @JsonKey(name: 'last_followup_id') final String? lastFollowupId,
  }) = _$ClinicPatientUpdateImpl;

  factory _ClinicPatientUpdate.fromJson(Map<String, dynamic> json) =
      _$ClinicPatientUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'current_followup_status')
  String? get currentFollowupStatus;
  @override
  @JsonKey(name: 'last_appointment_id')
  String? get lastAppointmentId;
  @override
  @JsonKey(name: 'last_followup_id')
  String? get lastFollowupId;

  /// Create a copy of ClinicPatientUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicPatientUpdateImplCopyWith<_$ClinicPatientUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RenewalOptions _$RenewalOptionsFromJson(Map<String, dynamic> json) {
  return _RenewalOptions.fromJson(json);
}

/// @nodoc
mixin _$RenewalOptions {
  @JsonKey(name: 'can_renew')
  bool? get canRenew => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_followup_id')
  String? get previousFollowupId => throw _privateConstructorUsedError;

  /// Serializes this RenewalOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RenewalOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RenewalOptionsCopyWith<RenewalOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenewalOptionsCopyWith<$Res> {
  factory $RenewalOptionsCopyWith(
    RenewalOptions value,
    $Res Function(RenewalOptions) then,
  ) = _$RenewalOptionsCopyWithImpl<$Res, RenewalOptions>;
  @useResult
  $Res call({
    @JsonKey(name: 'can_renew') bool? canRenew,
    String? message,
    @JsonKey(name: 'previous_followup_id') String? previousFollowupId,
  });
}

/// @nodoc
class _$RenewalOptionsCopyWithImpl<$Res, $Val extends RenewalOptions>
    implements $RenewalOptionsCopyWith<$Res> {
  _$RenewalOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RenewalOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRenew = freezed,
    Object? message = freezed,
    Object? previousFollowupId = freezed,
  }) {
    return _then(
      _value.copyWith(
            canRenew: freezed == canRenew
                ? _value.canRenew
                : canRenew // ignore: cast_nullable_to_non_nullable
                      as bool?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            previousFollowupId: freezed == previousFollowupId
                ? _value.previousFollowupId
                : previousFollowupId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RenewalOptionsImplCopyWith<$Res>
    implements $RenewalOptionsCopyWith<$Res> {
  factory _$$RenewalOptionsImplCopyWith(
    _$RenewalOptionsImpl value,
    $Res Function(_$RenewalOptionsImpl) then,
  ) = __$$RenewalOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'can_renew') bool? canRenew,
    String? message,
    @JsonKey(name: 'previous_followup_id') String? previousFollowupId,
  });
}

/// @nodoc
class __$$RenewalOptionsImplCopyWithImpl<$Res>
    extends _$RenewalOptionsCopyWithImpl<$Res, _$RenewalOptionsImpl>
    implements _$$RenewalOptionsImplCopyWith<$Res> {
  __$$RenewalOptionsImplCopyWithImpl(
    _$RenewalOptionsImpl _value,
    $Res Function(_$RenewalOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RenewalOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canRenew = freezed,
    Object? message = freezed,
    Object? previousFollowupId = freezed,
  }) {
    return _then(
      _$RenewalOptionsImpl(
        canRenew: freezed == canRenew
            ? _value.canRenew
            : canRenew // ignore: cast_nullable_to_non_nullable
                  as bool?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        previousFollowupId: freezed == previousFollowupId
            ? _value.previousFollowupId
            : previousFollowupId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RenewalOptionsImpl implements _RenewalOptions {
  const _$RenewalOptionsImpl({
    @JsonKey(name: 'can_renew') this.canRenew,
    this.message,
    @JsonKey(name: 'previous_followup_id') this.previousFollowupId,
  });

  factory _$RenewalOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RenewalOptionsImplFromJson(json);

  @override
  @JsonKey(name: 'can_renew')
  final bool? canRenew;
  @override
  final String? message;
  @override
  @JsonKey(name: 'previous_followup_id')
  final String? previousFollowupId;

  @override
  String toString() {
    return 'RenewalOptions(canRenew: $canRenew, message: $message, previousFollowupId: $previousFollowupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RenewalOptionsImpl &&
            (identical(other.canRenew, canRenew) ||
                other.canRenew == canRenew) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.previousFollowupId, previousFollowupId) ||
                other.previousFollowupId == previousFollowupId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, canRenew, message, previousFollowupId);

  /// Create a copy of RenewalOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RenewalOptionsImplCopyWith<_$RenewalOptionsImpl> get copyWith =>
      __$$RenewalOptionsImplCopyWithImpl<_$RenewalOptionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RenewalOptionsImplToJson(this);
  }
}

abstract class _RenewalOptions implements RenewalOptions {
  const factory _RenewalOptions({
    @JsonKey(name: 'can_renew') final bool? canRenew,
    final String? message,
    @JsonKey(name: 'previous_followup_id') final String? previousFollowupId,
  }) = _$RenewalOptionsImpl;

  factory _RenewalOptions.fromJson(Map<String, dynamic> json) =
      _$RenewalOptionsImpl.fromJson;

  @override
  @JsonKey(name: 'can_renew')
  bool? get canRenew;
  @override
  String? get message;
  @override
  @JsonKey(name: 'previous_followup_id')
  String? get previousFollowupId;

  /// Create a copy of RenewalOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RenewalOptionsImplCopyWith<_$RenewalOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return _Department.fromJson(json);
}

/// @nodoc
mixin _$Department {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Doctor>? get doctors => throw _privateConstructorUsedError;

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentCopyWith<Department> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentCopyWith<$Res> {
  factory $DepartmentCopyWith(
    Department value,
    $Res Function(Department) then,
  ) = _$DepartmentCopyWithImpl<$Res, Department>;
  @useResult
  $Res call({
    String? id,
    String? name,
    String? description,
    List<Doctor>? doctors,
  });
}

/// @nodoc
class _$DepartmentCopyWithImpl<$Res, $Val extends Department>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? doctors = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            doctors: freezed == doctors
                ? _value.doctors
                : doctors // ignore: cast_nullable_to_non_nullable
                      as List<Doctor>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DepartmentImplCopyWith<$Res>
    implements $DepartmentCopyWith<$Res> {
  factory _$$DepartmentImplCopyWith(
    _$DepartmentImpl value,
    $Res Function(_$DepartmentImpl) then,
  ) = __$$DepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? name,
    String? description,
    List<Doctor>? doctors,
  });
}

/// @nodoc
class __$$DepartmentImplCopyWithImpl<$Res>
    extends _$DepartmentCopyWithImpl<$Res, _$DepartmentImpl>
    implements _$$DepartmentImplCopyWith<$Res> {
  __$$DepartmentImplCopyWithImpl(
    _$DepartmentImpl _value,
    $Res Function(_$DepartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? doctors = freezed,
  }) {
    return _then(
      _$DepartmentImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        doctors: freezed == doctors
            ? _value._doctors
            : doctors // ignore: cast_nullable_to_non_nullable
                  as List<Doctor>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentImpl implements _Department {
  const _$DepartmentImpl({
    this.id,
    this.name,
    this.description,
    final List<Doctor>? doctors,
  }) : _doctors = doctors;

  factory _$DepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  final List<Doctor>? _doctors;
  @override
  List<Doctor>? get doctors {
    final value = _doctors;
    if (value == null) return null;
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Department(id: $id, name: $name, description: $description, doctors: $doctors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_doctors),
  );

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      __$$DepartmentImplCopyWithImpl<_$DepartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentImplToJson(this);
  }
}

abstract class _Department implements Department {
  const factory _Department({
    final String? id,
    final String? name,
    final String? description,
    final List<Doctor>? doctors,
  }) = _$DepartmentImpl;

  factory _Department.fromJson(Map<String, dynamic> json) =
      _$DepartmentImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  List<Doctor>? get doctors;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConsultationType _$ConsultationTypeFromJson(Map<String, dynamic> json) {
  return _ConsultationType.fromJson(json);
}

/// @nodoc
mixin _$ConsultationType {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get baseFee => throw _privateConstructorUsedError;

  /// Serializes this ConsultationType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationTypeCopyWith<ConsultationType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationTypeCopyWith<$Res> {
  factory $ConsultationTypeCopyWith(
    ConsultationType value,
    $Res Function(ConsultationType) then,
  ) = _$ConsultationTypeCopyWithImpl<$Res, ConsultationType>;
  @useResult
  $Res call({String? id, String? name, String? description, double? baseFee});
}

/// @nodoc
class _$ConsultationTypeCopyWithImpl<$Res, $Val extends ConsultationType>
    implements $ConsultationTypeCopyWith<$Res> {
  _$ConsultationTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? baseFee = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            baseFee: freezed == baseFee
                ? _value.baseFee
                : baseFee // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsultationTypeImplCopyWith<$Res>
    implements $ConsultationTypeCopyWith<$Res> {
  factory _$$ConsultationTypeImplCopyWith(
    _$ConsultationTypeImpl value,
    $Res Function(_$ConsultationTypeImpl) then,
  ) = __$$ConsultationTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? description, double? baseFee});
}

/// @nodoc
class __$$ConsultationTypeImplCopyWithImpl<$Res>
    extends _$ConsultationTypeCopyWithImpl<$Res, _$ConsultationTypeImpl>
    implements _$$ConsultationTypeImplCopyWith<$Res> {
  __$$ConsultationTypeImplCopyWithImpl(
    _$ConsultationTypeImpl _value,
    $Res Function(_$ConsultationTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsultationType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? baseFee = freezed,
  }) {
    return _then(
      _$ConsultationTypeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        baseFee: freezed == baseFee
            ? _value.baseFee
            : baseFee // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationTypeImpl implements _ConsultationType {
  const _$ConsultationTypeImpl({
    this.id,
    this.name,
    this.description,
    this.baseFee,
  });

  factory _$ConsultationTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationTypeImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? baseFee;

  @override
  String toString() {
    return 'ConsultationType(id: $id, name: $name, description: $description, baseFee: $baseFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.baseFee, baseFee) || other.baseFee == baseFee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, baseFee);

  /// Create a copy of ConsultationType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationTypeImplCopyWith<_$ConsultationTypeImpl> get copyWith =>
      __$$ConsultationTypeImplCopyWithImpl<_$ConsultationTypeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationTypeImplToJson(this);
  }
}

abstract class _ConsultationType implements ConsultationType {
  const factory _ConsultationType({
    final String? id,
    final String? name,
    final String? description,
    final double? baseFee,
  }) = _$ConsultationTypeImpl;

  factory _ConsultationType.fromJson(Map<String, dynamic> json) =
      _$ConsultationTypeImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get baseFee;

  /// Create a copy of ConsultationType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationTypeImplCopyWith<_$ConsultationTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
    PaymentMethod value,
    $Res Function(PaymentMethod) then,
  ) = _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call({String? id, String? name, String? type, bool? isActive});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
    _$PaymentMethodImpl value,
    $Res Function(_$PaymentMethodImpl) then,
  ) = __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? type, bool? isActive});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
    _$PaymentMethodImpl _value,
    $Res Function(_$PaymentMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _$PaymentMethodImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl({this.id, this.name, this.type, this.isActive});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, name: $name, type: $type, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, isActive);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(this);
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod({
    final String? id,
    final String? name,
    final String? type,
    final bool? isActive,
  }) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get type;
  @override
  bool? get isActive;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) {
  return _MedicalRecord.fromJson(json);
}

/// @nodoc
mixin _$MedicalRecord {
  String? get id => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get appointmentId => throw _privateConstructorUsedError;
  String? get recordType => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  String? get uploadDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this MedicalRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalRecordCopyWith<MedicalRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalRecordCopyWith<$Res> {
  factory $MedicalRecordCopyWith(
    MedicalRecord value,
    $Res Function(MedicalRecord) then,
  ) = _$MedicalRecordCopyWithImpl<$Res, MedicalRecord>;
  @useResult
  $Res call({
    String? id,
    String? patientId,
    String? appointmentId,
    String? recordType,
    String? fileName,
    String? fileUrl,
    String? uploadDate,
    String? description,
  });
}

/// @nodoc
class _$MedicalRecordCopyWithImpl<$Res, $Val extends MedicalRecord>
    implements $MedicalRecordCopyWith<$Res> {
  _$MedicalRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? appointmentId = freezed,
    Object? recordType = freezed,
    Object? fileName = freezed,
    Object? fileUrl = freezed,
    Object? uploadDate = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientId: freezed == patientId
                ? _value.patientId
                : patientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordType: freezed == recordType
                ? _value.recordType
                : recordType // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileName: freezed == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadDate: freezed == uploadDate
                ? _value.uploadDate
                : uploadDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicalRecordImplCopyWith<$Res>
    implements $MedicalRecordCopyWith<$Res> {
  factory _$$MedicalRecordImplCopyWith(
    _$MedicalRecordImpl value,
    $Res Function(_$MedicalRecordImpl) then,
  ) = __$$MedicalRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? patientId,
    String? appointmentId,
    String? recordType,
    String? fileName,
    String? fileUrl,
    String? uploadDate,
    String? description,
  });
}

/// @nodoc
class __$$MedicalRecordImplCopyWithImpl<$Res>
    extends _$MedicalRecordCopyWithImpl<$Res, _$MedicalRecordImpl>
    implements _$$MedicalRecordImplCopyWith<$Res> {
  __$$MedicalRecordImplCopyWithImpl(
    _$MedicalRecordImpl _value,
    $Res Function(_$MedicalRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? appointmentId = freezed,
    Object? recordType = freezed,
    Object? fileName = freezed,
    Object? fileUrl = freezed,
    Object? uploadDate = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$MedicalRecordImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientId: freezed == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordType: freezed == recordType
            ? _value.recordType
            : recordType // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileName: freezed == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadDate: freezed == uploadDate
            ? _value.uploadDate
            : uploadDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicalRecordImpl implements _MedicalRecord {
  const _$MedicalRecordImpl({
    this.id,
    this.patientId,
    this.appointmentId,
    this.recordType,
    this.fileName,
    this.fileUrl,
    this.uploadDate,
    this.description,
  });

  factory _$MedicalRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicalRecordImplFromJson(json);

  @override
  final String? id;
  @override
  final String? patientId;
  @override
  final String? appointmentId;
  @override
  final String? recordType;
  @override
  final String? fileName;
  @override
  final String? fileUrl;
  @override
  final String? uploadDate;
  @override
  final String? description;

  @override
  String toString() {
    return 'MedicalRecord(id: $id, patientId: $patientId, appointmentId: $appointmentId, recordType: $recordType, fileName: $fileName, fileUrl: $fileUrl, uploadDate: $uploadDate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.recordType, recordType) ||
                other.recordType == recordType) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    patientId,
    appointmentId,
    recordType,
    fileName,
    fileUrl,
    uploadDate,
    description,
  );

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalRecordImplCopyWith<_$MedicalRecordImpl> get copyWith =>
      __$$MedicalRecordImplCopyWithImpl<_$MedicalRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalRecordImplToJson(this);
  }
}

abstract class _MedicalRecord implements MedicalRecord {
  const factory _MedicalRecord({
    final String? id,
    final String? patientId,
    final String? appointmentId,
    final String? recordType,
    final String? fileName,
    final String? fileUrl,
    final String? uploadDate,
    final String? description,
  }) = _$MedicalRecordImpl;

  factory _MedicalRecord.fromJson(Map<String, dynamic> json) =
      _$MedicalRecordImpl.fromJson;

  @override
  String? get id;
  @override
  String? get patientId;
  @override
  String? get appointmentId;
  @override
  String? get recordType;
  @override
  String? get fileName;
  @override
  String? get fileUrl;
  @override
  String? get uploadDate;
  @override
  String? get description;

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalRecordImplCopyWith<_$MedicalRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Prescription _$PrescriptionFromJson(Map<String, dynamic> json) {
  return _Prescription.fromJson(json);
}

/// @nodoc
mixin _$Prescription {
  String? get id => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get appointmentId => throw _privateConstructorUsedError;
  String? get medication => throw _privateConstructorUsedError;
  String? get dosage => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  String? get prescribedDate => throw _privateConstructorUsedError;

  /// Serializes this Prescription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionCopyWith<Prescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionCopyWith<$Res> {
  factory $PrescriptionCopyWith(
    Prescription value,
    $Res Function(Prescription) then,
  ) = _$PrescriptionCopyWithImpl<$Res, Prescription>;
  @useResult
  $Res call({
    String? id,
    String? patientId,
    String? appointmentId,
    String? medication,
    String? dosage,
    String? frequency,
    String? duration,
    String? instructions,
    String? prescribedDate,
  });
}

/// @nodoc
class _$PrescriptionCopyWithImpl<$Res, $Val extends Prescription>
    implements $PrescriptionCopyWith<$Res> {
  _$PrescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? appointmentId = freezed,
    Object? medication = freezed,
    Object? dosage = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? instructions = freezed,
    Object? prescribedDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            patientId: freezed == patientId
                ? _value.patientId
                : patientId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointmentId: freezed == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            medication: freezed == medication
                ? _value.medication
                : medication // ignore: cast_nullable_to_non_nullable
                      as String?,
            dosage: freezed == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String?,
            frequency: freezed == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            instructions: freezed == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            prescribedDate: freezed == prescribedDate
                ? _value.prescribedDate
                : prescribedDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionImplCopyWith<$Res>
    implements $PrescriptionCopyWith<$Res> {
  factory _$$PrescriptionImplCopyWith(
    _$PrescriptionImpl value,
    $Res Function(_$PrescriptionImpl) then,
  ) = __$$PrescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? patientId,
    String? appointmentId,
    String? medication,
    String? dosage,
    String? frequency,
    String? duration,
    String? instructions,
    String? prescribedDate,
  });
}

/// @nodoc
class __$$PrescriptionImplCopyWithImpl<$Res>
    extends _$PrescriptionCopyWithImpl<$Res, _$PrescriptionImpl>
    implements _$$PrescriptionImplCopyWith<$Res> {
  __$$PrescriptionImplCopyWithImpl(
    _$PrescriptionImpl _value,
    $Res Function(_$PrescriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? appointmentId = freezed,
    Object? medication = freezed,
    Object? dosage = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? instructions = freezed,
    Object? prescribedDate = freezed,
  }) {
    return _then(
      _$PrescriptionImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        patientId: freezed == patientId
            ? _value.patientId
            : patientId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointmentId: freezed == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        medication: freezed == medication
            ? _value.medication
            : medication // ignore: cast_nullable_to_non_nullable
                  as String?,
        dosage: freezed == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String?,
        frequency: freezed == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        instructions: freezed == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        prescribedDate: freezed == prescribedDate
            ? _value.prescribedDate
            : prescribedDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionImpl implements _Prescription {
  const _$PrescriptionImpl({
    this.id,
    this.patientId,
    this.appointmentId,
    this.medication,
    this.dosage,
    this.frequency,
    this.duration,
    this.instructions,
    this.prescribedDate,
  });

  factory _$PrescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionImplFromJson(json);

  @override
  final String? id;
  @override
  final String? patientId;
  @override
  final String? appointmentId;
  @override
  final String? medication;
  @override
  final String? dosage;
  @override
  final String? frequency;
  @override
  final String? duration;
  @override
  final String? instructions;
  @override
  final String? prescribedDate;

  @override
  String toString() {
    return 'Prescription(id: $id, patientId: $patientId, appointmentId: $appointmentId, medication: $medication, dosage: $dosage, frequency: $frequency, duration: $duration, instructions: $instructions, prescribedDate: $prescribedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.medication, medication) ||
                other.medication == medication) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.prescribedDate, prescribedDate) ||
                other.prescribedDate == prescribedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    patientId,
    appointmentId,
    medication,
    dosage,
    frequency,
    duration,
    instructions,
    prescribedDate,
  );

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionImplCopyWith<_$PrescriptionImpl> get copyWith =>
      __$$PrescriptionImplCopyWithImpl<_$PrescriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionImplToJson(this);
  }
}

abstract class _Prescription implements Prescription {
  const factory _Prescription({
    final String? id,
    final String? patientId,
    final String? appointmentId,
    final String? medication,
    final String? dosage,
    final String? frequency,
    final String? duration,
    final String? instructions,
    final String? prescribedDate,
  }) = _$PrescriptionImpl;

  factory _Prescription.fromJson(Map<String, dynamic> json) =
      _$PrescriptionImpl.fromJson;

  @override
  String? get id;
  @override
  String? get patientId;
  @override
  String? get appointmentId;
  @override
  String? get medication;
  @override
  String? get dosage;
  @override
  String? get frequency;
  @override
  String? get duration;
  @override
  String? get instructions;
  @override
  String? get prescribedDate;

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionImplCopyWith<_$PrescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
