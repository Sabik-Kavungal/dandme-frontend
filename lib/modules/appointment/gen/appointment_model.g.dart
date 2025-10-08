// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
      id: json['id'] as String?,
      appointmentId: json['appointmentId'] as String?,
      patientId: json['patientId'] as String?,
      doctorId: json['doctorId'] as String?,
      department: json['department'] as String?,
      consultationType: json['consultationType'] as String?,
      status: json['status'] as String?,
      feeStatus: json['feeStatus'] as String?,
      appointmentDate: json['appointmentDate'] as String?,
      appointmentTime: json['appointmentTime'] as String?,
      bookedOn: json['bookedOn'] as String?,
      reasonForVisit: json['reasonForVisit'] as String?,
      notes: json['notes'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppointmentImplToJson(
  _$AppointmentImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.appointmentId case final value?) 'appointmentId': value,
  if (instance.patientId case final value?) 'patientId': value,
  if (instance.doctorId case final value?) 'doctorId': value,
  if (instance.department case final value?) 'department': value,
  if (instance.consultationType case final value?) 'consultationType': value,
  if (instance.status case final value?) 'status': value,
  if (instance.feeStatus case final value?) 'feeStatus': value,
  if (instance.appointmentDate case final value?) 'appointmentDate': value,
  if (instance.appointmentTime case final value?) 'appointmentTime': value,
  if (instance.bookedOn case final value?) 'bookedOn': value,
  if (instance.reasonForVisit case final value?) 'reasonForVisit': value,
  if (instance.notes case final value?) 'notes': value,
  if (instance.fee case final value?) 'fee': value,
  if (instance.paymentMethod case final value?) 'paymentMethod': value,
  if (instance.patient?.toJson() case final value?) 'patient': value,
  if (instance.doctor?.toJson() case final value?) 'doctor': value,
};

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      mobileId: json['mobileId'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      smokingStatus: json['smokingStatus'] as String?,
      alcoholUse: json['alcoholUse'] as String?,
      vitalSigns: json['vitalSigns'] == null
          ? null
          : VitalSigns.fromJson(json['vitalSigns'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.mobileId case final value?) 'mobileId': value,
      if (instance.dateOfBirth case final value?) 'dateOfBirth': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.bloodGroup case final value?) 'bloodGroup': value,
      if (instance.address1 case final value?) 'address1': value,
      if (instance.address2 case final value?) 'address2': value,
      if (instance.district case final value?) 'district': value,
      if (instance.state case final value?) 'state': value,
      if (instance.height case final value?) 'height': value,
      if (instance.weight case final value?) 'weight': value,
      if (instance.smokingStatus case final value?) 'smokingStatus': value,
      if (instance.alcoholUse case final value?) 'alcoholUse': value,
      if (instance.vitalSigns?.toJson() case final value?) 'vitalSigns': value,
    };

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  department: json['department'] as String?,
  specialization: json['specialization'] as String?,
  qualification: json['qualification'] as String?,
  experience: json['experience'] as String?,
  consultationFee: json['consultationFee'] as String?,
  isAvailable: json['isAvailable'] as bool?,
  availableSlots: (json['availableSlots'] as List<dynamic>?)
      ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.department case final value?) 'department': value,
      if (instance.specialization case final value?) 'specialization': value,
      if (instance.qualification case final value?) 'qualification': value,
      if (instance.experience case final value?) 'experience': value,
      if (instance.consultationFee case final value?) 'consultationFee': value,
      if (instance.isAvailable case final value?) 'isAvailable': value,
      if (instance.availableSlots?.map((e) => e.toJson()).toList()
          case final value?)
        'availableSlots': value,
    };

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      id: json['id'] as String?,
      time: json['time'] as String?,
      date: json['date'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      isBooked: json['isBooked'] as bool?,
      doctorId: json['doctorId'] as String?,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.time case final value?) 'time': value,
      if (instance.date case final value?) 'date': value,
      if (instance.isAvailable case final value?) 'isAvailable': value,
      if (instance.isBooked case final value?) 'isBooked': value,
      if (instance.doctorId case final value?) 'doctorId': value,
    };

_$VitalSignsImpl _$$VitalSignsImplFromJson(Map<String, dynamic> json) =>
    _$VitalSignsImpl(
      bloodPressure: json['bloodPressure'] as String?,
      temperature: json['temperature'] as String?,
      pulse: json['pulse'] as String?,
      respiratoryRate: json['respiratoryRate'] as String?,
      oxygenSaturation: json['oxygenSaturation'] as String?,
    );

Map<String, dynamic> _$$VitalSignsImplToJson(
  _$VitalSignsImpl instance,
) => <String, dynamic>{
  if (instance.bloodPressure case final value?) 'bloodPressure': value,
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.pulse case final value?) 'pulse': value,
  if (instance.respiratoryRate case final value?) 'respiratoryRate': value,
  if (instance.oxygenSaturation case final value?) 'oxygenSaturation': value,
};

_$AppointmentSummaryImpl _$$AppointmentSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentSummaryImpl(
  todayAppointments: (json['todayAppointments'] as num?)?.toInt(),
  upcomingAppointments: (json['upcomingAppointments'] as num?)?.toInt(),
  completedAppointments: (json['completedAppointments'] as num?)?.toInt(),
  cancelledAppointments: (json['cancelledAppointments'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AppointmentSummaryImplToJson(
  _$AppointmentSummaryImpl instance,
) => <String, dynamic>{
  if (instance.todayAppointments case final value?) 'todayAppointments': value,
  if (instance.upcomingAppointments case final value?)
    'upcomingAppointments': value,
  if (instance.completedAppointments case final value?)
    'completedAppointments': value,
  if (instance.cancelledAppointments case final value?)
    'cancelledAppointments': value,
};

_$DepartmentImpl _$$DepartmentImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DepartmentImplToJson(_$DepartmentImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.doctors?.map((e) => e.toJson()).toList() case final value?)
        'doctors': value,
    };

_$ConsultationTypeImpl _$$ConsultationTypeImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationTypeImpl(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  baseFee: (json['baseFee'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$ConsultationTypeImplToJson(
  _$ConsultationTypeImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.name case final value?) 'name': value,
  if (instance.description case final value?) 'description': value,
  if (instance.baseFee case final value?) 'baseFee': value,
};

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.type case final value?) 'type': value,
      if (instance.isActive case final value?) 'isActive': value,
    };

_$MedicalRecordImpl _$$MedicalRecordImplFromJson(Map<String, dynamic> json) =>
    _$MedicalRecordImpl(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      appointmentId: json['appointmentId'] as String?,
      recordType: json['recordType'] as String?,
      fileName: json['fileName'] as String?,
      fileUrl: json['fileUrl'] as String?,
      uploadDate: json['uploadDate'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$MedicalRecordImplToJson(_$MedicalRecordImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.patientId case final value?) 'patientId': value,
      if (instance.appointmentId case final value?) 'appointmentId': value,
      if (instance.recordType case final value?) 'recordType': value,
      if (instance.fileName case final value?) 'fileName': value,
      if (instance.fileUrl case final value?) 'fileUrl': value,
      if (instance.uploadDate case final value?) 'uploadDate': value,
      if (instance.description case final value?) 'description': value,
    };

_$PrescriptionImpl _$$PrescriptionImplFromJson(Map<String, dynamic> json) =>
    _$PrescriptionImpl(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      appointmentId: json['appointmentId'] as String?,
      medication: json['medication'] as String?,
      dosage: json['dosage'] as String?,
      frequency: json['frequency'] as String?,
      duration: json['duration'] as String?,
      instructions: json['instructions'] as String?,
      prescribedDate: json['prescribedDate'] as String?,
    );

Map<String, dynamic> _$$PrescriptionImplToJson(_$PrescriptionImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.patientId case final value?) 'patientId': value,
      if (instance.appointmentId case final value?) 'appointmentId': value,
      if (instance.medication case final value?) 'medication': value,
      if (instance.dosage case final value?) 'dosage': value,
      if (instance.frequency case final value?) 'frequency': value,
      if (instance.duration case final value?) 'duration': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (instance.prescribedDate case final value?) 'prescribedDate': value,
    };
