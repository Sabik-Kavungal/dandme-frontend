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

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  String? get id => throw _privateConstructorUsedError;
  String? get appointmentId => throw _privateConstructorUsedError;
  String? get patientId => throw _privateConstructorUsedError;
  String? get doctorId => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get consultationType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get feeStatus => throw _privateConstructorUsedError;
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
    String? appointmentId,
    String? patientId,
    String? doctorId,
    String? department,
    String? consultationType,
    String? status,
    String? feeStatus,
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
    Object? appointmentId = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? department = freezed,
    Object? consultationType = freezed,
    Object? status = freezed,
    Object? feeStatus = freezed,
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
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationType: freezed == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            feeStatus: freezed == feeStatus
                ? _value.feeStatus
                : feeStatus // ignore: cast_nullable_to_non_nullable
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
    String? appointmentId,
    String? patientId,
    String? doctorId,
    String? department,
    String? consultationType,
    String? status,
    String? feeStatus,
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
    Object? appointmentId = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? department = freezed,
    Object? consultationType = freezed,
    Object? status = freezed,
    Object? feeStatus = freezed,
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
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationType: freezed == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        feeStatus: freezed == feeStatus
            ? _value.feeStatus
            : feeStatus // ignore: cast_nullable_to_non_nullable
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
    this.appointmentId,
    this.patientId,
    this.doctorId,
    this.department,
    this.consultationType,
    this.status,
    this.feeStatus,
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
  final String? appointmentId;
  @override
  final String? patientId;
  @override
  final String? doctorId;
  @override
  final String? department;
  @override
  final String? consultationType;
  @override
  final String? status;
  @override
  final String? feeStatus;
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
    return 'Appointment(id: $id, appointmentId: $appointmentId, patientId: $patientId, doctorId: $doctorId, department: $department, consultationType: $consultationType, status: $status, feeStatus: $feeStatus, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, bookedOn: $bookedOn, reasonForVisit: $reasonForVisit, notes: $notes, fee: $fee, paymentMethod: $paymentMethod, patient: $patient, doctor: $doctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feeStatus, feeStatus) ||
                other.feeStatus == feeStatus) &&
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
  int get hashCode => Object.hash(
    runtimeType,
    id,
    appointmentId,
    patientId,
    doctorId,
    department,
    consultationType,
    status,
    feeStatus,
    appointmentDate,
    appointmentTime,
    bookedOn,
    reasonForVisit,
    notes,
    fee,
    paymentMethod,
    patient,
    doctor,
  );

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
    final String? appointmentId,
    final String? patientId,
    final String? doctorId,
    final String? department,
    final String? consultationType,
    final String? status,
    final String? feeStatus,
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
  String? get appointmentId;
  @override
  String? get patientId;
  @override
  String? get doctorId;
  @override
  String? get department;
  @override
  String? get consultationType;
  @override
  String? get status;
  @override
  String? get feeStatus;
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
    return 'Doctor(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, department: $department, specialization: $specialization, qualification: $qualification, experience: $experience, consultationFee: $consultationFee, isAvailable: $isAvailable, availableSlots: $availableSlots)';
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
