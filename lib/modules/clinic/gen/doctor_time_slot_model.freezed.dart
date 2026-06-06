// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_time_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorTimeSlotResponse {

 String get id;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'doctor_name') String? get doctorName;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'clinic_name') String? get clinicName;@JsonKey(name: 'date') String get date;// YYYY-MM-DD format - NEW
@JsonKey(name: 'day_of_week') int? get dayOfWeek;// Optional for backward compatibility
@JsonKey(name: 'day_name') String? get dayName;// Optional for backward compatibility
@JsonKey(name: 'slot_type') String get slotType;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'max_patients') int get maxPatients;@JsonKey(name: 'booked_patients') int get bookedPatients;@JsonKey(name: 'available_spots') int get availableSpots;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'is_bookable') bool get isBookable;// NEW: for past slots
 String get status;@JsonKey(name: 'display_message') String get displayMessage;// NEW: for past slots message
@JsonKey(name: 'start_datetime') String? get startDateTime;// NEW: Full ISO 8601
@JsonKey(name: 'end_datetime') String? get endDateTime;// NEW: Full ISO 8601
 String? get notes;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of DoctorTimeSlotResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorTimeSlotResponseCopyWith<DoctorTimeSlotResponse> get copyWith => _$DoctorTimeSlotResponseCopyWithImpl<DoctorTimeSlotResponse>(this as DoctorTimeSlotResponse, _$identity);

  /// Serializes this DoctorTimeSlotResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorTimeSlotResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.bookedPatients, bookedPatients) || other.bookedPatients == bookedPatients)&&(identical(other.availableSpots, availableSpots) || other.availableSpots == availableSpots)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isBookable, isBookable) || other.isBookable == isBookable)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayMessage, displayMessage) || other.displayMessage == displayMessage)&&(identical(other.startDateTime, startDateTime) || other.startDateTime == startDateTime)&&(identical(other.endDateTime, endDateTime) || other.endDateTime == endDateTime)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,doctorId,doctorName,clinicId,clinicName,date,dayOfWeek,dayName,slotType,startTime,endTime,isActive,maxPatients,bookedPatients,availableSpots,isAvailable,isBookable,status,displayMessage,startDateTime,endDateTime,notes,createdAt,updatedAt]);

@override
String toString() {
  return 'DoctorTimeSlotResponse(id: $id, doctorId: $doctorId, doctorName: $doctorName, clinicId: $clinicId, clinicName: $clinicName, date: $date, dayOfWeek: $dayOfWeek, dayName: $dayName, slotType: $slotType, startTime: $startTime, endTime: $endTime, isActive: $isActive, maxPatients: $maxPatients, bookedPatients: $bookedPatients, availableSpots: $availableSpots, isAvailable: $isAvailable, isBookable: $isBookable, status: $status, displayMessage: $displayMessage, startDateTime: $startDateTime, endDateTime: $endDateTime, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DoctorTimeSlotResponseCopyWith<$Res>  {
  factory $DoctorTimeSlotResponseCopyWith(DoctorTimeSlotResponse value, $Res Function(DoctorTimeSlotResponse) _then) = _$DoctorTimeSlotResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_name') String? clinicName,@JsonKey(name: 'date') String date,@JsonKey(name: 'day_of_week') int? dayOfWeek,@JsonKey(name: 'day_name') String? dayName,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'booked_patients') int bookedPatients,@JsonKey(name: 'available_spots') int availableSpots,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'is_bookable') bool isBookable, String status,@JsonKey(name: 'display_message') String displayMessage,@JsonKey(name: 'start_datetime') String? startDateTime,@JsonKey(name: 'end_datetime') String? endDateTime, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$DoctorTimeSlotResponseCopyWithImpl<$Res>
    implements $DoctorTimeSlotResponseCopyWith<$Res> {
  _$DoctorTimeSlotResponseCopyWithImpl(this._self, this._then);

  final DoctorTimeSlotResponse _self;
  final $Res Function(DoctorTimeSlotResponse) _then;

/// Create a copy of DoctorTimeSlotResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = freezed,Object? clinicId = null,Object? clinicName = freezed,Object? date = null,Object? dayOfWeek = freezed,Object? dayName = freezed,Object? slotType = null,Object? startTime = null,Object? endTime = null,Object? isActive = null,Object? maxPatients = null,Object? bookedPatients = null,Object? availableSpots = null,Object? isAvailable = null,Object? isBookable = null,Object? status = null,Object? displayMessage = null,Object? startDateTime = freezed,Object? endDateTime = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,dayName: freezed == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String?,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,bookedPatients: null == bookedPatients ? _self.bookedPatients : bookedPatients // ignore: cast_nullable_to_non_nullable
as int,availableSpots: null == availableSpots ? _self.availableSpots : availableSpots // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isBookable: null == isBookable ? _self.isBookable : isBookable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayMessage: null == displayMessage ? _self.displayMessage : displayMessage // ignore: cast_nullable_to_non_nullable
as String,startDateTime: freezed == startDateTime ? _self.startDateTime : startDateTime // ignore: cast_nullable_to_non_nullable
as String?,endDateTime: freezed == endDateTime ? _self.endDateTime : endDateTime // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorTimeSlotResponse].
extension DoctorTimeSlotResponsePatterns on DoctorTimeSlotResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorTimeSlotResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorTimeSlotResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorTimeSlotResponse value)  $default,){
final _that = this;
switch (_that) {
case _DoctorTimeSlotResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorTimeSlotResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorTimeSlotResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'date')  String date, @JsonKey(name: 'day_of_week')  int? dayOfWeek, @JsonKey(name: 'day_name')  String? dayName, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'booked_patients')  int bookedPatients, @JsonKey(name: 'available_spots')  int availableSpots, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'is_bookable')  bool isBookable,  String status, @JsonKey(name: 'display_message')  String displayMessage, @JsonKey(name: 'start_datetime')  String? startDateTime, @JsonKey(name: 'end_datetime')  String? endDateTime,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorTimeSlotResponse() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.clinicId,_that.clinicName,_that.date,_that.dayOfWeek,_that.dayName,_that.slotType,_that.startTime,_that.endTime,_that.isActive,_that.maxPatients,_that.bookedPatients,_that.availableSpots,_that.isAvailable,_that.isBookable,_that.status,_that.displayMessage,_that.startDateTime,_that.endDateTime,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'date')  String date, @JsonKey(name: 'day_of_week')  int? dayOfWeek, @JsonKey(name: 'day_name')  String? dayName, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'booked_patients')  int bookedPatients, @JsonKey(name: 'available_spots')  int availableSpots, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'is_bookable')  bool isBookable,  String status, @JsonKey(name: 'display_message')  String displayMessage, @JsonKey(name: 'start_datetime')  String? startDateTime, @JsonKey(name: 'end_datetime')  String? endDateTime,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DoctorTimeSlotResponse():
return $default(_that.id,_that.doctorId,_that.doctorName,_that.clinicId,_that.clinicName,_that.date,_that.dayOfWeek,_that.dayName,_that.slotType,_that.startTime,_that.endTime,_that.isActive,_that.maxPatients,_that.bookedPatients,_that.availableSpots,_that.isAvailable,_that.isBookable,_that.status,_that.displayMessage,_that.startDateTime,_that.endDateTime,_that.notes,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'doctor_name')  String? doctorName, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'date')  String date, @JsonKey(name: 'day_of_week')  int? dayOfWeek, @JsonKey(name: 'day_name')  String? dayName, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'booked_patients')  int bookedPatients, @JsonKey(name: 'available_spots')  int availableSpots, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'is_bookable')  bool isBookable,  String status, @JsonKey(name: 'display_message')  String displayMessage, @JsonKey(name: 'start_datetime')  String? startDateTime, @JsonKey(name: 'end_datetime')  String? endDateTime,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DoctorTimeSlotResponse() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorName,_that.clinicId,_that.clinicName,_that.date,_that.dayOfWeek,_that.dayName,_that.slotType,_that.startTime,_that.endTime,_that.isActive,_that.maxPatients,_that.bookedPatients,_that.availableSpots,_that.isAvailable,_that.isBookable,_that.status,_that.displayMessage,_that.startDateTime,_that.endDateTime,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorTimeSlotResponse implements DoctorTimeSlotResponse {
  const _DoctorTimeSlotResponse({required this.id, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'doctor_name') this.doctorName, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'clinic_name') this.clinicName, @JsonKey(name: 'date') required this.date, @JsonKey(name: 'day_of_week') this.dayOfWeek, @JsonKey(name: 'day_name') this.dayName, @JsonKey(name: 'slot_type') required this.slotType, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'max_patients') required this.maxPatients, @JsonKey(name: 'booked_patients') this.bookedPatients = 0, @JsonKey(name: 'available_spots') this.availableSpots = 0, @JsonKey(name: 'is_available') this.isAvailable = true, @JsonKey(name: 'is_bookable') this.isBookable = true, this.status = 'available', @JsonKey(name: 'display_message') this.displayMessage = 'Available', @JsonKey(name: 'start_datetime') this.startDateTime, @JsonKey(name: 'end_datetime') this.endDateTime, this.notes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _DoctorTimeSlotResponse.fromJson(Map<String, dynamic> json) => _$DoctorTimeSlotResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'doctor_name') final  String? doctorName;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'clinic_name') final  String? clinicName;
@override@JsonKey(name: 'date') final  String date;
// YYYY-MM-DD format - NEW
@override@JsonKey(name: 'day_of_week') final  int? dayOfWeek;
// Optional for backward compatibility
@override@JsonKey(name: 'day_name') final  String? dayName;
// Optional for backward compatibility
@override@JsonKey(name: 'slot_type') final  String slotType;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override@JsonKey(name: 'booked_patients') final  int bookedPatients;
@override@JsonKey(name: 'available_spots') final  int availableSpots;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'is_bookable') final  bool isBookable;
// NEW: for past slots
@override@JsonKey() final  String status;
@override@JsonKey(name: 'display_message') final  String displayMessage;
// NEW: for past slots message
@override@JsonKey(name: 'start_datetime') final  String? startDateTime;
// NEW: Full ISO 8601
@override@JsonKey(name: 'end_datetime') final  String? endDateTime;
// NEW: Full ISO 8601
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of DoctorTimeSlotResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorTimeSlotResponseCopyWith<_DoctorTimeSlotResponse> get copyWith => __$DoctorTimeSlotResponseCopyWithImpl<_DoctorTimeSlotResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorTimeSlotResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorTimeSlotResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.bookedPatients, bookedPatients) || other.bookedPatients == bookedPatients)&&(identical(other.availableSpots, availableSpots) || other.availableSpots == availableSpots)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isBookable, isBookable) || other.isBookable == isBookable)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayMessage, displayMessage) || other.displayMessage == displayMessage)&&(identical(other.startDateTime, startDateTime) || other.startDateTime == startDateTime)&&(identical(other.endDateTime, endDateTime) || other.endDateTime == endDateTime)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,doctorId,doctorName,clinicId,clinicName,date,dayOfWeek,dayName,slotType,startTime,endTime,isActive,maxPatients,bookedPatients,availableSpots,isAvailable,isBookable,status,displayMessage,startDateTime,endDateTime,notes,createdAt,updatedAt]);

@override
String toString() {
  return 'DoctorTimeSlotResponse(id: $id, doctorId: $doctorId, doctorName: $doctorName, clinicId: $clinicId, clinicName: $clinicName, date: $date, dayOfWeek: $dayOfWeek, dayName: $dayName, slotType: $slotType, startTime: $startTime, endTime: $endTime, isActive: $isActive, maxPatients: $maxPatients, bookedPatients: $bookedPatients, availableSpots: $availableSpots, isAvailable: $isAvailable, isBookable: $isBookable, status: $status, displayMessage: $displayMessage, startDateTime: $startDateTime, endDateTime: $endDateTime, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorTimeSlotResponseCopyWith<$Res> implements $DoctorTimeSlotResponseCopyWith<$Res> {
  factory _$DoctorTimeSlotResponseCopyWith(_DoctorTimeSlotResponse value, $Res Function(_DoctorTimeSlotResponse) _then) = __$DoctorTimeSlotResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'doctor_name') String? doctorName,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_name') String? clinicName,@JsonKey(name: 'date') String date,@JsonKey(name: 'day_of_week') int? dayOfWeek,@JsonKey(name: 'day_name') String? dayName,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'booked_patients') int bookedPatients,@JsonKey(name: 'available_spots') int availableSpots,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'is_bookable') bool isBookable, String status,@JsonKey(name: 'display_message') String displayMessage,@JsonKey(name: 'start_datetime') String? startDateTime,@JsonKey(name: 'end_datetime') String? endDateTime, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$DoctorTimeSlotResponseCopyWithImpl<$Res>
    implements _$DoctorTimeSlotResponseCopyWith<$Res> {
  __$DoctorTimeSlotResponseCopyWithImpl(this._self, this._then);

  final _DoctorTimeSlotResponse _self;
  final $Res Function(_DoctorTimeSlotResponse) _then;

/// Create a copy of DoctorTimeSlotResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? doctorName = freezed,Object? clinicId = null,Object? clinicName = freezed,Object? date = null,Object? dayOfWeek = freezed,Object? dayName = freezed,Object? slotType = null,Object? startTime = null,Object? endTime = null,Object? isActive = null,Object? maxPatients = null,Object? bookedPatients = null,Object? availableSpots = null,Object? isAvailable = null,Object? isBookable = null,Object? status = null,Object? displayMessage = null,Object? startDateTime = freezed,Object? endDateTime = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DoctorTimeSlotResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorName: freezed == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String?,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,dayName: freezed == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String?,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,bookedPatients: null == bookedPatients ? _self.bookedPatients : bookedPatients // ignore: cast_nullable_to_non_nullable
as int,availableSpots: null == availableSpots ? _self.availableSpots : availableSpots // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isBookable: null == isBookable ? _self.isBookable : isBookable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayMessage: null == displayMessage ? _self.displayMessage : displayMessage // ignore: cast_nullable_to_non_nullable
as String,startDateTime: freezed == startDateTime ? _self.startDateTime : startDateTime // ignore: cast_nullable_to_non_nullable
as String?,endDateTime: freezed == endDateTime ? _self.endDateTime : endDateTime // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$TimeSlotDefinition {

@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'max_patients') int get maxPatients; String? get notes;
/// Create a copy of TimeSlotDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotDefinitionCopyWith<TimeSlotDefinition> get copyWith => _$TimeSlotDefinitionCopyWithImpl<TimeSlotDefinition>(this as TimeSlotDefinition, _$identity);

  /// Serializes this TimeSlotDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotDefinition&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,maxPatients,notes);

@override
String toString() {
  return 'TimeSlotDefinition(startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TimeSlotDefinitionCopyWith<$Res>  {
  factory $TimeSlotDefinitionCopyWith(TimeSlotDefinition value, $Res Function(TimeSlotDefinition) _then) = _$TimeSlotDefinitionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients, String? notes
});




}
/// @nodoc
class _$TimeSlotDefinitionCopyWithImpl<$Res>
    implements $TimeSlotDefinitionCopyWith<$Res> {
  _$TimeSlotDefinitionCopyWithImpl(this._self, this._then);

  final TimeSlotDefinition _self;
  final $Res Function(TimeSlotDefinition) _then;

/// Create a copy of TimeSlotDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlotDefinition].
extension TimeSlotDefinitionPatterns on TimeSlotDefinition {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlotDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlotDefinition() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlotDefinition value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlotDefinition():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlotDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlotDefinition() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlotDefinition() when $default != null:
return $default(_that.startTime,_that.endTime,_that.maxPatients,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TimeSlotDefinition():
return $default(_that.startTime,_that.endTime,_that.maxPatients,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlotDefinition() when $default != null:
return $default(_that.startTime,_that.endTime,_that.maxPatients,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlotDefinition implements TimeSlotDefinition {
  const _TimeSlotDefinition({@JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'max_patients') this.maxPatients = 1, this.notes});
  factory _TimeSlotDefinition.fromJson(Map<String, dynamic> json) => _$TimeSlotDefinitionFromJson(json);

@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override final  String? notes;

/// Create a copy of TimeSlotDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotDefinitionCopyWith<_TimeSlotDefinition> get copyWith => __$TimeSlotDefinitionCopyWithImpl<_TimeSlotDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlotDefinition&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,maxPatients,notes);

@override
String toString() {
  return 'TimeSlotDefinition(startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotDefinitionCopyWith<$Res> implements $TimeSlotDefinitionCopyWith<$Res> {
  factory _$TimeSlotDefinitionCopyWith(_TimeSlotDefinition value, $Res Function(_TimeSlotDefinition) _then) = __$TimeSlotDefinitionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients, String? notes
});




}
/// @nodoc
class __$TimeSlotDefinitionCopyWithImpl<$Res>
    implements _$TimeSlotDefinitionCopyWith<$Res> {
  __$TimeSlotDefinitionCopyWithImpl(this._self, this._then);

  final _TimeSlotDefinition _self;
  final $Res Function(_TimeSlotDefinition) _then;

/// Create a copy of TimeSlotDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? notes = freezed,}) {
  return _then(_TimeSlotDefinition(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateDoctorTimeSlotInput {

@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'slot_type') String get slotType;@JsonKey(name: 'date') String get date;// YYYY-MM-DD format - NEW
 List<TimeSlotDefinition> get slots;
/// Create a copy of CreateDoctorTimeSlotInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDoctorTimeSlotInputCopyWith<CreateDoctorTimeSlotInput> get copyWith => _$CreateDoctorTimeSlotInputCopyWithImpl<CreateDoctorTimeSlotInput>(this as CreateDoctorTimeSlotInput, _$identity);

  /// Serializes this CreateDoctorTimeSlotInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDoctorTimeSlotInput&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'CreateDoctorTimeSlotInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $CreateDoctorTimeSlotInputCopyWith<$Res>  {
  factory $CreateDoctorTimeSlotInputCopyWith(CreateDoctorTimeSlotInput value, $Res Function(CreateDoctorTimeSlotInput) _then) = _$CreateDoctorTimeSlotInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'date') String date, List<TimeSlotDefinition> slots
});




}
/// @nodoc
class _$CreateDoctorTimeSlotInputCopyWithImpl<$Res>
    implements $CreateDoctorTimeSlotInputCopyWith<$Res> {
  _$CreateDoctorTimeSlotInputCopyWithImpl(this._self, this._then);

  final CreateDoctorTimeSlotInput _self;
  final $Res Function(CreateDoctorTimeSlotInput) _then;

/// Create a copy of CreateDoctorTimeSlotInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? clinicId = null,Object? slotType = null,Object? date = null,Object? slots = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotDefinition>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDoctorTimeSlotInput].
extension CreateDoctorTimeSlotInputPatterns on CreateDoctorTimeSlotInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDoctorTimeSlotInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDoctorTimeSlotInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDoctorTimeSlotInput value)  $default,){
final _that = this;
switch (_that) {
case _CreateDoctorTimeSlotInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDoctorTimeSlotInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDoctorTimeSlotInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'date')  String date,  List<TimeSlotDefinition> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDoctorTimeSlotInput() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.slots);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'date')  String date,  List<TimeSlotDefinition> slots)  $default,) {final _that = this;
switch (_that) {
case _CreateDoctorTimeSlotInput():
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.slots);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'date')  String date,  List<TimeSlotDefinition> slots)?  $default,) {final _that = this;
switch (_that) {
case _CreateDoctorTimeSlotInput() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDoctorTimeSlotInput implements CreateDoctorTimeSlotInput {
  const _CreateDoctorTimeSlotInput({@JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'slot_type') required this.slotType, @JsonKey(name: 'date') required this.date, required final  List<TimeSlotDefinition> slots}): _slots = slots;
  factory _CreateDoctorTimeSlotInput.fromJson(Map<String, dynamic> json) => _$CreateDoctorTimeSlotInputFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'slot_type') final  String slotType;
@override@JsonKey(name: 'date') final  String date;
// YYYY-MM-DD format - NEW
 final  List<TimeSlotDefinition> _slots;
// YYYY-MM-DD format - NEW
@override List<TimeSlotDefinition> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of CreateDoctorTimeSlotInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDoctorTimeSlotInputCopyWith<_CreateDoctorTimeSlotInput> get copyWith => __$CreateDoctorTimeSlotInputCopyWithImpl<_CreateDoctorTimeSlotInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDoctorTimeSlotInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDoctorTimeSlotInput&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'CreateDoctorTimeSlotInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$CreateDoctorTimeSlotInputCopyWith<$Res> implements $CreateDoctorTimeSlotInputCopyWith<$Res> {
  factory _$CreateDoctorTimeSlotInputCopyWith(_CreateDoctorTimeSlotInput value, $Res Function(_CreateDoctorTimeSlotInput) _then) = __$CreateDoctorTimeSlotInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'date') String date, List<TimeSlotDefinition> slots
});




}
/// @nodoc
class __$CreateDoctorTimeSlotInputCopyWithImpl<$Res>
    implements _$CreateDoctorTimeSlotInputCopyWith<$Res> {
  __$CreateDoctorTimeSlotInputCopyWithImpl(this._self, this._then);

  final _CreateDoctorTimeSlotInput _self;
  final $Res Function(_CreateDoctorTimeSlotInput) _then;

/// Create a copy of CreateDoctorTimeSlotInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? clinicId = null,Object? slotType = null,Object? date = null,Object? slots = null,}) {
  return _then(_CreateDoctorTimeSlotInput(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotDefinition>,
  ));
}


}


/// @nodoc
mixin _$BulkCreateDoctorTimeSlotsResponse {

 String get message;@JsonKey(name: 'created_slots') List<DoctorTimeSlotResponse> get createdSlots;@JsonKey(name: 'failed_slots') List<dynamic> get failedSlots;@JsonKey(name: 'total_created') int get totalCreated;@JsonKey(name: 'total_failed') int get totalFailed;
/// Create a copy of BulkCreateDoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkCreateDoctorTimeSlotsResponseCopyWith<BulkCreateDoctorTimeSlotsResponse> get copyWith => _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<BulkCreateDoctorTimeSlotsResponse>(this as BulkCreateDoctorTimeSlotsResponse, _$identity);

  /// Serializes this BulkCreateDoctorTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkCreateDoctorTimeSlotsResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.createdSlots, createdSlots)&&const DeepCollectionEquality().equals(other.failedSlots, failedSlots)&&(identical(other.totalCreated, totalCreated) || other.totalCreated == totalCreated)&&(identical(other.totalFailed, totalFailed) || other.totalFailed == totalFailed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(createdSlots),const DeepCollectionEquality().hash(failedSlots),totalCreated,totalFailed);

@override
String toString() {
  return 'BulkCreateDoctorTimeSlotsResponse(message: $message, createdSlots: $createdSlots, failedSlots: $failedSlots, totalCreated: $totalCreated, totalFailed: $totalFailed)';
}


}

/// @nodoc
abstract mixin class $BulkCreateDoctorTimeSlotsResponseCopyWith<$Res>  {
  factory $BulkCreateDoctorTimeSlotsResponseCopyWith(BulkCreateDoctorTimeSlotsResponse value, $Res Function(BulkCreateDoctorTimeSlotsResponse) _then) = _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl;
@useResult
$Res call({
 String message,@JsonKey(name: 'created_slots') List<DoctorTimeSlotResponse> createdSlots,@JsonKey(name: 'failed_slots') List<dynamic> failedSlots,@JsonKey(name: 'total_created') int totalCreated,@JsonKey(name: 'total_failed') int totalFailed
});




}
/// @nodoc
class _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<$Res>
    implements $BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> {
  _$BulkCreateDoctorTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final BulkCreateDoctorTimeSlotsResponse _self;
  final $Res Function(BulkCreateDoctorTimeSlotsResponse) _then;

/// Create a copy of BulkCreateDoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? createdSlots = null,Object? failedSlots = null,Object? totalCreated = null,Object? totalFailed = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdSlots: null == createdSlots ? _self.createdSlots : createdSlots // ignore: cast_nullable_to_non_nullable
as List<DoctorTimeSlotResponse>,failedSlots: null == failedSlots ? _self.failedSlots : failedSlots // ignore: cast_nullable_to_non_nullable
as List<dynamic>,totalCreated: null == totalCreated ? _self.totalCreated : totalCreated // ignore: cast_nullable_to_non_nullable
as int,totalFailed: null == totalFailed ? _self.totalFailed : totalFailed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BulkCreateDoctorTimeSlotsResponse].
extension BulkCreateDoctorTimeSlotsResponsePatterns on BulkCreateDoctorTimeSlotsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulkCreateDoctorTimeSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulkCreateDoctorTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulkCreateDoctorTimeSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _BulkCreateDoctorTimeSlotsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulkCreateDoctorTimeSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BulkCreateDoctorTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'created_slots')  List<DoctorTimeSlotResponse> createdSlots, @JsonKey(name: 'failed_slots')  List<dynamic> failedSlots, @JsonKey(name: 'total_created')  int totalCreated, @JsonKey(name: 'total_failed')  int totalFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulkCreateDoctorTimeSlotsResponse() when $default != null:
return $default(_that.message,_that.createdSlots,_that.failedSlots,_that.totalCreated,_that.totalFailed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'created_slots')  List<DoctorTimeSlotResponse> createdSlots, @JsonKey(name: 'failed_slots')  List<dynamic> failedSlots, @JsonKey(name: 'total_created')  int totalCreated, @JsonKey(name: 'total_failed')  int totalFailed)  $default,) {final _that = this;
switch (_that) {
case _BulkCreateDoctorTimeSlotsResponse():
return $default(_that.message,_that.createdSlots,_that.failedSlots,_that.totalCreated,_that.totalFailed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message, @JsonKey(name: 'created_slots')  List<DoctorTimeSlotResponse> createdSlots, @JsonKey(name: 'failed_slots')  List<dynamic> failedSlots, @JsonKey(name: 'total_created')  int totalCreated, @JsonKey(name: 'total_failed')  int totalFailed)?  $default,) {final _that = this;
switch (_that) {
case _BulkCreateDoctorTimeSlotsResponse() when $default != null:
return $default(_that.message,_that.createdSlots,_that.failedSlots,_that.totalCreated,_that.totalFailed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BulkCreateDoctorTimeSlotsResponse implements BulkCreateDoctorTimeSlotsResponse {
  const _BulkCreateDoctorTimeSlotsResponse({required this.message, @JsonKey(name: 'created_slots') final  List<DoctorTimeSlotResponse> createdSlots = const [], @JsonKey(name: 'failed_slots') final  List<dynamic> failedSlots = const [], @JsonKey(name: 'total_created') required this.totalCreated, @JsonKey(name: 'total_failed') required this.totalFailed}): _createdSlots = createdSlots,_failedSlots = failedSlots;
  factory _BulkCreateDoctorTimeSlotsResponse.fromJson(Map<String, dynamic> json) => _$BulkCreateDoctorTimeSlotsResponseFromJson(json);

@override final  String message;
 final  List<DoctorTimeSlotResponse> _createdSlots;
@override@JsonKey(name: 'created_slots') List<DoctorTimeSlotResponse> get createdSlots {
  if (_createdSlots is EqualUnmodifiableListView) return _createdSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_createdSlots);
}

 final  List<dynamic> _failedSlots;
@override@JsonKey(name: 'failed_slots') List<dynamic> get failedSlots {
  if (_failedSlots is EqualUnmodifiableListView) return _failedSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failedSlots);
}

@override@JsonKey(name: 'total_created') final  int totalCreated;
@override@JsonKey(name: 'total_failed') final  int totalFailed;

/// Create a copy of BulkCreateDoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulkCreateDoctorTimeSlotsResponseCopyWith<_BulkCreateDoctorTimeSlotsResponse> get copyWith => __$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<_BulkCreateDoctorTimeSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BulkCreateDoctorTimeSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulkCreateDoctorTimeSlotsResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._createdSlots, _createdSlots)&&const DeepCollectionEquality().equals(other._failedSlots, _failedSlots)&&(identical(other.totalCreated, totalCreated) || other.totalCreated == totalCreated)&&(identical(other.totalFailed, totalFailed) || other.totalFailed == totalFailed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_createdSlots),const DeepCollectionEquality().hash(_failedSlots),totalCreated,totalFailed);

@override
String toString() {
  return 'BulkCreateDoctorTimeSlotsResponse(message: $message, createdSlots: $createdSlots, failedSlots: $failedSlots, totalCreated: $totalCreated, totalFailed: $totalFailed)';
}


}

/// @nodoc
abstract mixin class _$BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> implements $BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> {
  factory _$BulkCreateDoctorTimeSlotsResponseCopyWith(_BulkCreateDoctorTimeSlotsResponse value, $Res Function(_BulkCreateDoctorTimeSlotsResponse) _then) = __$BulkCreateDoctorTimeSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
 String message,@JsonKey(name: 'created_slots') List<DoctorTimeSlotResponse> createdSlots,@JsonKey(name: 'failed_slots') List<dynamic> failedSlots,@JsonKey(name: 'total_created') int totalCreated,@JsonKey(name: 'total_failed') int totalFailed
});




}
/// @nodoc
class __$BulkCreateDoctorTimeSlotsResponseCopyWithImpl<$Res>
    implements _$BulkCreateDoctorTimeSlotsResponseCopyWith<$Res> {
  __$BulkCreateDoctorTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final _BulkCreateDoctorTimeSlotsResponse _self;
  final $Res Function(_BulkCreateDoctorTimeSlotsResponse) _then;

/// Create a copy of BulkCreateDoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? createdSlots = null,Object? failedSlots = null,Object? totalCreated = null,Object? totalFailed = null,}) {
  return _then(_BulkCreateDoctorTimeSlotsResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdSlots: null == createdSlots ? _self._createdSlots : createdSlots // ignore: cast_nullable_to_non_nullable
as List<DoctorTimeSlotResponse>,failedSlots: null == failedSlots ? _self._failedSlots : failedSlots // ignore: cast_nullable_to_non_nullable
as List<dynamic>,totalCreated: null == totalCreated ? _self.totalCreated : totalCreated // ignore: cast_nullable_to_non_nullable
as int,totalFailed: null == totalFailed ? _self.totalFailed : totalFailed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AvailableSlot {

 String get id;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'clinic_name') String? get clinicName;@JsonKey(name: 'day_of_week') int get dayOfWeek;@JsonKey(name: 'day_name') String get dayName;@JsonKey(name: 'slot_type') String get slotType;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'max_patients') int get maxPatients; String? get notes;
/// Create a copy of AvailableSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableSlotCopyWith<AvailableSlot> get copyWith => _$AvailableSlotCopyWithImpl<AvailableSlot>(this as AvailableSlot, _$identity);

  /// Serializes this AvailableSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicId,clinicName,dayOfWeek,dayName,slotType,startTime,endTime,maxPatients,notes);

@override
String toString() {
  return 'AvailableSlot(id: $id, clinicId: $clinicId, clinicName: $clinicName, dayOfWeek: $dayOfWeek, dayName: $dayName, slotType: $slotType, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AvailableSlotCopyWith<$Res>  {
  factory $AvailableSlotCopyWith(AvailableSlot value, $Res Function(AvailableSlot) _then) = _$AvailableSlotCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_name') String? clinicName,@JsonKey(name: 'day_of_week') int dayOfWeek,@JsonKey(name: 'day_name') String dayName,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients, String? notes
});




}
/// @nodoc
class _$AvailableSlotCopyWithImpl<$Res>
    implements $AvailableSlotCopyWith<$Res> {
  _$AvailableSlotCopyWithImpl(this._self, this._then);

  final AvailableSlot _self;
  final $Res Function(AvailableSlot) _then;

/// Create a copy of AvailableSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clinicId = null,Object? clinicName = freezed,Object? dayOfWeek = null,Object? dayName = null,Object? slotType = null,Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailableSlot].
extension AvailableSlotPatterns on AvailableSlot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailableSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailableSlot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailableSlot value)  $default,){
final _that = this;
switch (_that) {
case _AvailableSlot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailableSlot value)?  $default,){
final _that = this;
switch (_that) {
case _AvailableSlot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'day_of_week')  int dayOfWeek, @JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailableSlot() when $default != null:
return $default(_that.id,_that.clinicId,_that.clinicName,_that.dayOfWeek,_that.dayName,_that.slotType,_that.startTime,_that.endTime,_that.maxPatients,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'day_of_week')  int dayOfWeek, @JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AvailableSlot():
return $default(_that.id,_that.clinicId,_that.clinicName,_that.dayOfWeek,_that.dayName,_that.slotType,_that.startTime,_that.endTime,_that.maxPatients,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'clinic_name')  String? clinicName, @JsonKey(name: 'day_of_week')  int dayOfWeek, @JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AvailableSlot() when $default != null:
return $default(_that.id,_that.clinicId,_that.clinicName,_that.dayOfWeek,_that.dayName,_that.slotType,_that.startTime,_that.endTime,_that.maxPatients,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailableSlot implements AvailableSlot {
  const _AvailableSlot({required this.id, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'clinic_name') this.clinicName, @JsonKey(name: 'day_of_week') required this.dayOfWeek, @JsonKey(name: 'day_name') required this.dayName, @JsonKey(name: 'slot_type') required this.slotType, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'max_patients') required this.maxPatients, this.notes});
  factory _AvailableSlot.fromJson(Map<String, dynamic> json) => _$AvailableSlotFromJson(json);

@override final  String id;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'clinic_name') final  String? clinicName;
@override@JsonKey(name: 'day_of_week') final  int dayOfWeek;
@override@JsonKey(name: 'day_name') final  String dayName;
@override@JsonKey(name: 'slot_type') final  String slotType;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override final  String? notes;

/// Create a copy of AvailableSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableSlotCopyWith<_AvailableSlot> get copyWith => __$AvailableSlotCopyWithImpl<_AvailableSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailableSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailableSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicId,clinicName,dayOfWeek,dayName,slotType,startTime,endTime,maxPatients,notes);

@override
String toString() {
  return 'AvailableSlot(id: $id, clinicId: $clinicId, clinicName: $clinicName, dayOfWeek: $dayOfWeek, dayName: $dayName, slotType: $slotType, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AvailableSlotCopyWith<$Res> implements $AvailableSlotCopyWith<$Res> {
  factory _$AvailableSlotCopyWith(_AvailableSlot value, $Res Function(_AvailableSlot) _then) = __$AvailableSlotCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'clinic_name') String? clinicName,@JsonKey(name: 'day_of_week') int dayOfWeek,@JsonKey(name: 'day_name') String dayName,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients, String? notes
});




}
/// @nodoc
class __$AvailableSlotCopyWithImpl<$Res>
    implements _$AvailableSlotCopyWith<$Res> {
  __$AvailableSlotCopyWithImpl(this._self, this._then);

  final _AvailableSlot _self;
  final $Res Function(_AvailableSlot) _then;

/// Create a copy of AvailableSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clinicId = null,Object? clinicName = freezed,Object? dayOfWeek = null,Object? dayName = null,Object? slotType = null,Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? notes = freezed,}) {
  return _then(_AvailableSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DoctorTimeSlotsResponse {

@JsonKey(name: 'available_slots') List<AvailableSlot> get availableSlots;
/// Create a copy of DoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorTimeSlotsResponseCopyWith<DoctorTimeSlotsResponse> get copyWith => _$DoctorTimeSlotsResponseCopyWithImpl<DoctorTimeSlotsResponse>(this as DoctorTimeSlotsResponse, _$identity);

  /// Serializes this DoctorTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorTimeSlotsResponse&&const DeepCollectionEquality().equals(other.availableSlots, availableSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableSlots));

@override
String toString() {
  return 'DoctorTimeSlotsResponse(availableSlots: $availableSlots)';
}


}

/// @nodoc
abstract mixin class $DoctorTimeSlotsResponseCopyWith<$Res>  {
  factory $DoctorTimeSlotsResponseCopyWith(DoctorTimeSlotsResponse value, $Res Function(DoctorTimeSlotsResponse) _then) = _$DoctorTimeSlotsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'available_slots') List<AvailableSlot> availableSlots
});




}
/// @nodoc
class _$DoctorTimeSlotsResponseCopyWithImpl<$Res>
    implements $DoctorTimeSlotsResponseCopyWith<$Res> {
  _$DoctorTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final DoctorTimeSlotsResponse _self;
  final $Res Function(DoctorTimeSlotsResponse) _then;

/// Create a copy of DoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableSlots = null,}) {
  return _then(_self.copyWith(
availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as List<AvailableSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorTimeSlotsResponse].
extension DoctorTimeSlotsResponsePatterns on DoctorTimeSlotsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorTimeSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorTimeSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _DoctorTimeSlotsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorTimeSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'available_slots')  List<AvailableSlot> availableSlots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorTimeSlotsResponse() when $default != null:
return $default(_that.availableSlots);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'available_slots')  List<AvailableSlot> availableSlots)  $default,) {final _that = this;
switch (_that) {
case _DoctorTimeSlotsResponse():
return $default(_that.availableSlots);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'available_slots')  List<AvailableSlot> availableSlots)?  $default,) {final _that = this;
switch (_that) {
case _DoctorTimeSlotsResponse() when $default != null:
return $default(_that.availableSlots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorTimeSlotsResponse implements DoctorTimeSlotsResponse {
  const _DoctorTimeSlotsResponse({@JsonKey(name: 'available_slots') required final  List<AvailableSlot> availableSlots}): _availableSlots = availableSlots;
  factory _DoctorTimeSlotsResponse.fromJson(Map<String, dynamic> json) => _$DoctorTimeSlotsResponseFromJson(json);

 final  List<AvailableSlot> _availableSlots;
@override@JsonKey(name: 'available_slots') List<AvailableSlot> get availableSlots {
  if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableSlots);
}


/// Create a copy of DoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorTimeSlotsResponseCopyWith<_DoctorTimeSlotsResponse> get copyWith => __$DoctorTimeSlotsResponseCopyWithImpl<_DoctorTimeSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorTimeSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorTimeSlotsResponse&&const DeepCollectionEquality().equals(other._availableSlots, _availableSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableSlots));

@override
String toString() {
  return 'DoctorTimeSlotsResponse(availableSlots: $availableSlots)';
}


}

/// @nodoc
abstract mixin class _$DoctorTimeSlotsResponseCopyWith<$Res> implements $DoctorTimeSlotsResponseCopyWith<$Res> {
  factory _$DoctorTimeSlotsResponseCopyWith(_DoctorTimeSlotsResponse value, $Res Function(_DoctorTimeSlotsResponse) _then) = __$DoctorTimeSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'available_slots') List<AvailableSlot> availableSlots
});




}
/// @nodoc
class __$DoctorTimeSlotsResponseCopyWithImpl<$Res>
    implements _$DoctorTimeSlotsResponseCopyWith<$Res> {
  __$DoctorTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final _DoctorTimeSlotsResponse _self;
  final $Res Function(_DoctorTimeSlotsResponse) _then;

/// Create a copy of DoctorTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableSlots = null,}) {
  return _then(_DoctorTimeSlotsResponse(
availableSlots: null == availableSlots ? _self._availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as List<AvailableSlot>,
  ));
}


}


/// @nodoc
mixin _$DaySlotGroup {

@JsonKey(name: 'day_name') String get dayName;@JsonKey(name: 'day_of_week') int get dayOfWeek; List<DoctorTimeSlotResponse> get slots;@JsonKey(name: 'has_slots') bool get hasSlots;@JsonKey(name: 'total_slots') int get totalSlots;@JsonKey(name: 'available_slots') int get availableSlots;@JsonKey(name: 'is_available') bool get isAvailable; String get status;
/// Create a copy of DaySlotGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaySlotGroupCopyWith<DaySlotGroup> get copyWith => _$DaySlotGroupCopyWithImpl<DaySlotGroup>(this as DaySlotGroup, _$identity);

  /// Serializes this DaySlotGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaySlotGroup&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.hasSlots, hasSlots) || other.hasSlots == hasSlots)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&(identical(other.availableSlots, availableSlots) || other.availableSlots == availableSlots)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayName,dayOfWeek,const DeepCollectionEquality().hash(slots),hasSlots,totalSlots,availableSlots,isAvailable,status);

@override
String toString() {
  return 'DaySlotGroup(dayName: $dayName, dayOfWeek: $dayOfWeek, slots: $slots, hasSlots: $hasSlots, totalSlots: $totalSlots, availableSlots: $availableSlots, isAvailable: $isAvailable, status: $status)';
}


}

/// @nodoc
abstract mixin class $DaySlotGroupCopyWith<$Res>  {
  factory $DaySlotGroupCopyWith(DaySlotGroup value, $Res Function(DaySlotGroup) _then) = _$DaySlotGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'day_name') String dayName,@JsonKey(name: 'day_of_week') int dayOfWeek, List<DoctorTimeSlotResponse> slots,@JsonKey(name: 'has_slots') bool hasSlots,@JsonKey(name: 'total_slots') int totalSlots,@JsonKey(name: 'available_slots') int availableSlots,@JsonKey(name: 'is_available') bool isAvailable, String status
});




}
/// @nodoc
class _$DaySlotGroupCopyWithImpl<$Res>
    implements $DaySlotGroupCopyWith<$Res> {
  _$DaySlotGroupCopyWithImpl(this._self, this._then);

  final DaySlotGroup _self;
  final $Res Function(DaySlotGroup) _then;

/// Create a copy of DaySlotGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayName = null,Object? dayOfWeek = null,Object? slots = null,Object? hasSlots = null,Object? totalSlots = null,Object? availableSlots = null,Object? isAvailable = null,Object? status = null,}) {
  return _then(_self.copyWith(
dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorTimeSlotResponse>,hasSlots: null == hasSlots ? _self.hasSlots : hasSlots // ignore: cast_nullable_to_non_nullable
as bool,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DaySlotGroup].
extension DaySlotGroupPatterns on DaySlotGroup {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DaySlotGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DaySlotGroup() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DaySlotGroup value)  $default,){
final _that = this;
switch (_that) {
case _DaySlotGroup():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DaySlotGroup value)?  $default,){
final _that = this;
switch (_that) {
case _DaySlotGroup() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'day_of_week')  int dayOfWeek,  List<DoctorTimeSlotResponse> slots, @JsonKey(name: 'has_slots')  bool hasSlots, @JsonKey(name: 'total_slots')  int totalSlots, @JsonKey(name: 'available_slots')  int availableSlots, @JsonKey(name: 'is_available')  bool isAvailable,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DaySlotGroup() when $default != null:
return $default(_that.dayName,_that.dayOfWeek,_that.slots,_that.hasSlots,_that.totalSlots,_that.availableSlots,_that.isAvailable,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'day_of_week')  int dayOfWeek,  List<DoctorTimeSlotResponse> slots, @JsonKey(name: 'has_slots')  bool hasSlots, @JsonKey(name: 'total_slots')  int totalSlots, @JsonKey(name: 'available_slots')  int availableSlots, @JsonKey(name: 'is_available')  bool isAvailable,  String status)  $default,) {final _that = this;
switch (_that) {
case _DaySlotGroup():
return $default(_that.dayName,_that.dayOfWeek,_that.slots,_that.hasSlots,_that.totalSlots,_that.availableSlots,_that.isAvailable,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'day_name')  String dayName, @JsonKey(name: 'day_of_week')  int dayOfWeek,  List<DoctorTimeSlotResponse> slots, @JsonKey(name: 'has_slots')  bool hasSlots, @JsonKey(name: 'total_slots')  int totalSlots, @JsonKey(name: 'available_slots')  int availableSlots, @JsonKey(name: 'is_available')  bool isAvailable,  String status)?  $default,) {final _that = this;
switch (_that) {
case _DaySlotGroup() when $default != null:
return $default(_that.dayName,_that.dayOfWeek,_that.slots,_that.hasSlots,_that.totalSlots,_that.availableSlots,_that.isAvailable,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DaySlotGroup implements DaySlotGroup {
  const _DaySlotGroup({@JsonKey(name: 'day_name') required this.dayName, @JsonKey(name: 'day_of_week') required this.dayOfWeek, final  List<DoctorTimeSlotResponse> slots = const [], @JsonKey(name: 'has_slots') this.hasSlots = false, @JsonKey(name: 'total_slots') this.totalSlots = 0, @JsonKey(name: 'available_slots') this.availableSlots = 0, @JsonKey(name: 'is_available') this.isAvailable = false, this.status = 'unavailable'}): _slots = slots;
  factory _DaySlotGroup.fromJson(Map<String, dynamic> json) => _$DaySlotGroupFromJson(json);

@override@JsonKey(name: 'day_name') final  String dayName;
@override@JsonKey(name: 'day_of_week') final  int dayOfWeek;
 final  List<DoctorTimeSlotResponse> _slots;
@override@JsonKey() List<DoctorTimeSlotResponse> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override@JsonKey(name: 'has_slots') final  bool hasSlots;
@override@JsonKey(name: 'total_slots') final  int totalSlots;
@override@JsonKey(name: 'available_slots') final  int availableSlots;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey() final  String status;

/// Create a copy of DaySlotGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaySlotGroupCopyWith<_DaySlotGroup> get copyWith => __$DaySlotGroupCopyWithImpl<_DaySlotGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DaySlotGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaySlotGroup&&(identical(other.dayName, dayName) || other.dayName == dayName)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.hasSlots, hasSlots) || other.hasSlots == hasSlots)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&(identical(other.availableSlots, availableSlots) || other.availableSlots == availableSlots)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayName,dayOfWeek,const DeepCollectionEquality().hash(_slots),hasSlots,totalSlots,availableSlots,isAvailable,status);

@override
String toString() {
  return 'DaySlotGroup(dayName: $dayName, dayOfWeek: $dayOfWeek, slots: $slots, hasSlots: $hasSlots, totalSlots: $totalSlots, availableSlots: $availableSlots, isAvailable: $isAvailable, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DaySlotGroupCopyWith<$Res> implements $DaySlotGroupCopyWith<$Res> {
  factory _$DaySlotGroupCopyWith(_DaySlotGroup value, $Res Function(_DaySlotGroup) _then) = __$DaySlotGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'day_name') String dayName,@JsonKey(name: 'day_of_week') int dayOfWeek, List<DoctorTimeSlotResponse> slots,@JsonKey(name: 'has_slots') bool hasSlots,@JsonKey(name: 'total_slots') int totalSlots,@JsonKey(name: 'available_slots') int availableSlots,@JsonKey(name: 'is_available') bool isAvailable, String status
});




}
/// @nodoc
class __$DaySlotGroupCopyWithImpl<$Res>
    implements _$DaySlotGroupCopyWith<$Res> {
  __$DaySlotGroupCopyWithImpl(this._self, this._then);

  final _DaySlotGroup _self;
  final $Res Function(_DaySlotGroup) _then;

/// Create a copy of DaySlotGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayName = null,Object? dayOfWeek = null,Object? slots = null,Object? hasSlots = null,Object? totalSlots = null,Object? availableSlots = null,Object? isAvailable = null,Object? status = null,}) {
  return _then(_DaySlotGroup(
dayName: null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorTimeSlotResponse>,hasSlots: null == hasSlots ? _self.hasSlots : hasSlots // ignore: cast_nullable_to_non_nullable
as bool,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GroupedTimeSlotsResponse {

@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'slot_type') String? get slotType; String? get date; List<DaySlotGroup> get days;
/// Create a copy of GroupedTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupedTimeSlotsResponseCopyWith<GroupedTimeSlotsResponse> get copyWith => _$GroupedTimeSlotsResponseCopyWithImpl<GroupedTimeSlotsResponse>(this as GroupedTimeSlotsResponse, _$identity);

  /// Serializes this GroupedTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupedTimeSlotsResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.days, days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,const DeepCollectionEquality().hash(days));

@override
String toString() {
  return 'GroupedTimeSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, days: $days)';
}


}

/// @nodoc
abstract mixin class $GroupedTimeSlotsResponseCopyWith<$Res>  {
  factory $GroupedTimeSlotsResponseCopyWith(GroupedTimeSlotsResponse value, $Res Function(GroupedTimeSlotsResponse) _then) = _$GroupedTimeSlotsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_type') String? slotType, String? date, List<DaySlotGroup> days
});




}
/// @nodoc
class _$GroupedTimeSlotsResponseCopyWithImpl<$Res>
    implements $GroupedTimeSlotsResponseCopyWith<$Res> {
  _$GroupedTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final GroupedTimeSlotsResponse _self;
  final $Res Function(GroupedTimeSlotsResponse) _then;

/// Create a copy of GroupedTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? clinicId = freezed,Object? slotType = freezed,Object? date = freezed,Object? days = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DaySlotGroup>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupedTimeSlotsResponse].
extension GroupedTimeSlotsResponsePatterns on GroupedTimeSlotsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupedTimeSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupedTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupedTimeSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _GroupedTimeSlotsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupedTimeSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GroupedTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date,  List<DaySlotGroup> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupedTimeSlotsResponse() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.days);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date,  List<DaySlotGroup> days)  $default,) {final _that = this;
switch (_that) {
case _GroupedTimeSlotsResponse():
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.days);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date,  List<DaySlotGroup> days)?  $default,) {final _that = this;
switch (_that) {
case _GroupedTimeSlotsResponse() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupedTimeSlotsResponse implements GroupedTimeSlotsResponse {
  const _GroupedTimeSlotsResponse({@JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'slot_type') this.slotType, this.date, final  List<DaySlotGroup> days = const []}): _days = days;
  factory _GroupedTimeSlotsResponse.fromJson(Map<String, dynamic> json) => _$GroupedTimeSlotsResponseFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'slot_type') final  String? slotType;
@override final  String? date;
 final  List<DaySlotGroup> _days;
@override@JsonKey() List<DaySlotGroup> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of GroupedTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupedTimeSlotsResponseCopyWith<_GroupedTimeSlotsResponse> get copyWith => __$GroupedTimeSlotsResponseCopyWithImpl<_GroupedTimeSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupedTimeSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupedTimeSlotsResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._days, _days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'GroupedTimeSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, days: $days)';
}


}

/// @nodoc
abstract mixin class _$GroupedTimeSlotsResponseCopyWith<$Res> implements $GroupedTimeSlotsResponseCopyWith<$Res> {
  factory _$GroupedTimeSlotsResponseCopyWith(_GroupedTimeSlotsResponse value, $Res Function(_GroupedTimeSlotsResponse) _then) = __$GroupedTimeSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_type') String? slotType, String? date, List<DaySlotGroup> days
});




}
/// @nodoc
class __$GroupedTimeSlotsResponseCopyWithImpl<$Res>
    implements _$GroupedTimeSlotsResponseCopyWith<$Res> {
  __$GroupedTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final _GroupedTimeSlotsResponse _self;
  final $Res Function(_GroupedTimeSlotsResponse) _then;

/// Create a copy of GroupedTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? clinicId = freezed,Object? slotType = freezed,Object? date = freezed,Object? days = null,}) {
  return _then(_GroupedTimeSlotsResponse(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DaySlotGroup>,
  ));
}


}


/// @nodoc
mixin _$ListTimeSlotsResponse {

@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'slot_type') String? get slotType; String? get date; List<DoctorTimeSlotResponse> get slots; int get total;
/// Create a copy of ListTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListTimeSlotsResponseCopyWith<ListTimeSlotsResponse> get copyWith => _$ListTimeSlotsResponseCopyWithImpl<ListTimeSlotsResponse>(this as ListTimeSlotsResponse, _$identity);

  /// Serializes this ListTimeSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListTimeSlotsResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,const DeepCollectionEquality().hash(slots),total);

@override
String toString() {
  return 'ListTimeSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, slots: $slots, total: $total)';
}


}

/// @nodoc
abstract mixin class $ListTimeSlotsResponseCopyWith<$Res>  {
  factory $ListTimeSlotsResponseCopyWith(ListTimeSlotsResponse value, $Res Function(ListTimeSlotsResponse) _then) = _$ListTimeSlotsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_type') String? slotType, String? date, List<DoctorTimeSlotResponse> slots, int total
});




}
/// @nodoc
class _$ListTimeSlotsResponseCopyWithImpl<$Res>
    implements $ListTimeSlotsResponseCopyWith<$Res> {
  _$ListTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final ListTimeSlotsResponse _self;
  final $Res Function(ListTimeSlotsResponse) _then;

/// Create a copy of ListTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? clinicId = freezed,Object? slotType = freezed,Object? date = freezed,Object? slots = null,Object? total = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorTimeSlotResponse>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListTimeSlotsResponse].
extension ListTimeSlotsResponsePatterns on ListTimeSlotsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListTimeSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListTimeSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListTimeSlotsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListTimeSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListTimeSlotsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date,  List<DoctorTimeSlotResponse> slots,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListTimeSlotsResponse() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.slots,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date,  List<DoctorTimeSlotResponse> slots,  int total)  $default,) {final _that = this;
switch (_that) {
case _ListTimeSlotsResponse():
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.slots,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date,  List<DoctorTimeSlotResponse> slots,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ListTimeSlotsResponse() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.slots,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListTimeSlotsResponse implements ListTimeSlotsResponse {
  const _ListTimeSlotsResponse({@JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'slot_type') this.slotType, this.date, final  List<DoctorTimeSlotResponse> slots = const [], this.total = 0}): _slots = slots;
  factory _ListTimeSlotsResponse.fromJson(Map<String, dynamic> json) => _$ListTimeSlotsResponseFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'slot_type') final  String? slotType;
@override final  String? date;
 final  List<DoctorTimeSlotResponse> _slots;
@override@JsonKey() List<DoctorTimeSlotResponse> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override@JsonKey() final  int total;

/// Create a copy of ListTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListTimeSlotsResponseCopyWith<_ListTimeSlotsResponse> get copyWith => __$ListTimeSlotsResponseCopyWithImpl<_ListTimeSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListTimeSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListTimeSlotsResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,const DeepCollectionEquality().hash(_slots),total);

@override
String toString() {
  return 'ListTimeSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, slots: $slots, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ListTimeSlotsResponseCopyWith<$Res> implements $ListTimeSlotsResponseCopyWith<$Res> {
  factory _$ListTimeSlotsResponseCopyWith(_ListTimeSlotsResponse value, $Res Function(_ListTimeSlotsResponse) _then) = __$ListTimeSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_type') String? slotType, String? date, List<DoctorTimeSlotResponse> slots, int total
});




}
/// @nodoc
class __$ListTimeSlotsResponseCopyWithImpl<$Res>
    implements _$ListTimeSlotsResponseCopyWith<$Res> {
  __$ListTimeSlotsResponseCopyWithImpl(this._self, this._then);

  final _ListTimeSlotsResponse _self;
  final $Res Function(_ListTimeSlotsResponse) _then;

/// Create a copy of ListTimeSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? clinicId = freezed,Object? slotType = freezed,Object? date = freezed,Object? slots = null,Object? total = null,}) {
  return _then(_ListTimeSlotsResponse(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorTimeSlotResponse>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateDateSpecificSlotsInput {

@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'slot_type') String get slotType; String? get date;// Optional: for specific date slots (YYYY-MM-DD)
@JsonKey(name: 'day_of_week') int? get dayOfWeek;// Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
 List<SimpleTimeSlot> get slots;
/// Create a copy of CreateDateSpecificSlotsInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDateSpecificSlotsInputCopyWith<CreateDateSpecificSlotsInput> get copyWith => _$CreateDateSpecificSlotsInputCopyWithImpl<CreateDateSpecificSlotsInput>(this as CreateDateSpecificSlotsInput, _$identity);

  /// Serializes this CreateDateSpecificSlotsInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDateSpecificSlotsInput&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,dayOfWeek,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'CreateDateSpecificSlotsInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, dayOfWeek: $dayOfWeek, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $CreateDateSpecificSlotsInputCopyWith<$Res>  {
  factory $CreateDateSpecificSlotsInputCopyWith(CreateDateSpecificSlotsInput value, $Res Function(CreateDateSpecificSlotsInput) _then) = _$CreateDateSpecificSlotsInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'slot_type') String slotType, String? date,@JsonKey(name: 'day_of_week') int? dayOfWeek, List<SimpleTimeSlot> slots
});




}
/// @nodoc
class _$CreateDateSpecificSlotsInputCopyWithImpl<$Res>
    implements $CreateDateSpecificSlotsInputCopyWith<$Res> {
  _$CreateDateSpecificSlotsInputCopyWithImpl(this._self, this._then);

  final CreateDateSpecificSlotsInput _self;
  final $Res Function(CreateDateSpecificSlotsInput) _then;

/// Create a copy of CreateDateSpecificSlotsInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? clinicId = null,Object? slotType = null,Object? date = freezed,Object? dayOfWeek = freezed,Object? slots = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<SimpleTimeSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDateSpecificSlotsInput].
extension CreateDateSpecificSlotsInputPatterns on CreateDateSpecificSlotsInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDateSpecificSlotsInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDateSpecificSlotsInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDateSpecificSlotsInput value)  $default,){
final _that = this;
switch (_that) {
case _CreateDateSpecificSlotsInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDateSpecificSlotsInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDateSpecificSlotsInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType,  String? date, @JsonKey(name: 'day_of_week')  int? dayOfWeek,  List<SimpleTimeSlot> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDateSpecificSlotsInput() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.dayOfWeek,_that.slots);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType,  String? date, @JsonKey(name: 'day_of_week')  int? dayOfWeek,  List<SimpleTimeSlot> slots)  $default,) {final _that = this;
switch (_that) {
case _CreateDateSpecificSlotsInput():
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.dayOfWeek,_that.slots);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType,  String? date, @JsonKey(name: 'day_of_week')  int? dayOfWeek,  List<SimpleTimeSlot> slots)?  $default,) {final _that = this;
switch (_that) {
case _CreateDateSpecificSlotsInput() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.dayOfWeek,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDateSpecificSlotsInput implements CreateDateSpecificSlotsInput {
  const _CreateDateSpecificSlotsInput({@JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'slot_type') required this.slotType, this.date, @JsonKey(name: 'day_of_week') this.dayOfWeek, required final  List<SimpleTimeSlot> slots}): _slots = slots;
  factory _CreateDateSpecificSlotsInput.fromJson(Map<String, dynamic> json) => _$CreateDateSpecificSlotsInputFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'slot_type') final  String slotType;
@override final  String? date;
// Optional: for specific date slots (YYYY-MM-DD)
@override@JsonKey(name: 'day_of_week') final  int? dayOfWeek;
// Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
 final  List<SimpleTimeSlot> _slots;
// Optional: for recurring weekly slots (0=Sunday to 6=Saturday)
@override List<SimpleTimeSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of CreateDateSpecificSlotsInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDateSpecificSlotsInputCopyWith<_CreateDateSpecificSlotsInput> get copyWith => __$CreateDateSpecificSlotsInputCopyWithImpl<_CreateDateSpecificSlotsInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDateSpecificSlotsInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDateSpecificSlotsInput&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,date,dayOfWeek,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'CreateDateSpecificSlotsInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, dayOfWeek: $dayOfWeek, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$CreateDateSpecificSlotsInputCopyWith<$Res> implements $CreateDateSpecificSlotsInputCopyWith<$Res> {
  factory _$CreateDateSpecificSlotsInputCopyWith(_CreateDateSpecificSlotsInput value, $Res Function(_CreateDateSpecificSlotsInput) _then) = __$CreateDateSpecificSlotsInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'slot_type') String slotType, String? date,@JsonKey(name: 'day_of_week') int? dayOfWeek, List<SimpleTimeSlot> slots
});




}
/// @nodoc
class __$CreateDateSpecificSlotsInputCopyWithImpl<$Res>
    implements _$CreateDateSpecificSlotsInputCopyWith<$Res> {
  __$CreateDateSpecificSlotsInputCopyWithImpl(this._self, this._then);

  final _CreateDateSpecificSlotsInput _self;
  final $Res Function(_CreateDateSpecificSlotsInput) _then;

/// Create a copy of CreateDateSpecificSlotsInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? clinicId = null,Object? slotType = null,Object? date = freezed,Object? dayOfWeek = freezed,Object? slots = null,}) {
  return _then(_CreateDateSpecificSlotsInput(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<SimpleTimeSlot>,
  ));
}


}


/// @nodoc
mixin _$SimpleTimeSlot {

@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'max_patients') int? get maxPatients;@JsonKey(name: 'day_of_week') int? get dayOfWeek; String? get notes;
/// Create a copy of SimpleTimeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleTimeSlotCopyWith<SimpleTimeSlot> get copyWith => _$SimpleTimeSlotCopyWithImpl<SimpleTimeSlot>(this as SimpleTimeSlot, _$identity);

  /// Serializes this SimpleTimeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleTimeSlot&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,maxPatients,dayOfWeek,notes);

@override
String toString() {
  return 'SimpleTimeSlot(startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, dayOfWeek: $dayOfWeek, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $SimpleTimeSlotCopyWith<$Res>  {
  factory $SimpleTimeSlotCopyWith(SimpleTimeSlot value, $Res Function(SimpleTimeSlot) _then) = _$SimpleTimeSlotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int? maxPatients,@JsonKey(name: 'day_of_week') int? dayOfWeek, String? notes
});




}
/// @nodoc
class _$SimpleTimeSlotCopyWithImpl<$Res>
    implements $SimpleTimeSlotCopyWith<$Res> {
  _$SimpleTimeSlotCopyWithImpl(this._self, this._then);

  final SimpleTimeSlot _self;
  final $Res Function(SimpleTimeSlot) _then;

/// Create a copy of SimpleTimeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? endTime = null,Object? maxPatients = freezed,Object? dayOfWeek = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: freezed == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int?,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SimpleTimeSlot].
extension SimpleTimeSlotPatterns on SimpleTimeSlot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimpleTimeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimpleTimeSlot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimpleTimeSlot value)  $default,){
final _that = this;
switch (_that) {
case _SimpleTimeSlot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimpleTimeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _SimpleTimeSlot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int? maxPatients, @JsonKey(name: 'day_of_week')  int? dayOfWeek,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimpleTimeSlot() when $default != null:
return $default(_that.startTime,_that.endTime,_that.maxPatients,_that.dayOfWeek,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int? maxPatients, @JsonKey(name: 'day_of_week')  int? dayOfWeek,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _SimpleTimeSlot():
return $default(_that.startTime,_that.endTime,_that.maxPatients,_that.dayOfWeek,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int? maxPatients, @JsonKey(name: 'day_of_week')  int? dayOfWeek,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _SimpleTimeSlot() when $default != null:
return $default(_that.startTime,_that.endTime,_that.maxPatients,_that.dayOfWeek,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimpleTimeSlot implements SimpleTimeSlot {
  const _SimpleTimeSlot({@JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'max_patients') this.maxPatients, @JsonKey(name: 'day_of_week') this.dayOfWeek, this.notes});
  factory _SimpleTimeSlot.fromJson(Map<String, dynamic> json) => _$SimpleTimeSlotFromJson(json);

@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'max_patients') final  int? maxPatients;
@override@JsonKey(name: 'day_of_week') final  int? dayOfWeek;
@override final  String? notes;

/// Create a copy of SimpleTimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimpleTimeSlotCopyWith<_SimpleTimeSlot> get copyWith => __$SimpleTimeSlotCopyWithImpl<_SimpleTimeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimpleTimeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimpleTimeSlot&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,maxPatients,dayOfWeek,notes);

@override
String toString() {
  return 'SimpleTimeSlot(startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, dayOfWeek: $dayOfWeek, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$SimpleTimeSlotCopyWith<$Res> implements $SimpleTimeSlotCopyWith<$Res> {
  factory _$SimpleTimeSlotCopyWith(_SimpleTimeSlot value, $Res Function(_SimpleTimeSlot) _then) = __$SimpleTimeSlotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int? maxPatients,@JsonKey(name: 'day_of_week') int? dayOfWeek, String? notes
});




}
/// @nodoc
class __$SimpleTimeSlotCopyWithImpl<$Res>
    implements _$SimpleTimeSlotCopyWith<$Res> {
  __$SimpleTimeSlotCopyWithImpl(this._self, this._then);

  final _SimpleTimeSlot _self;
  final $Res Function(_SimpleTimeSlot) _then;

/// Create a copy of SimpleTimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? endTime = null,Object? maxPatients = freezed,Object? dayOfWeek = freezed,Object? notes = freezed,}) {
  return _then(_SimpleTimeSlot(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: freezed == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int?,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DateSpecificSlotResponse {

 String get id;@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'clinic_id') String get clinicId; String get date;@JsonKey(name: 'slot_type') String get slotType;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'max_patients') int get maxPatients;@JsonKey(name: 'booked_patients') int? get bookedPatients;@JsonKey(name: 'available_spots') int? get availableSpots;@JsonKey(name: 'is_available') bool? get isAvailable; String? get status; String? get notes;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of DateSpecificSlotResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateSpecificSlotResponseCopyWith<DateSpecificSlotResponse> get copyWith => _$DateSpecificSlotResponseCopyWithImpl<DateSpecificSlotResponse>(this as DateSpecificSlotResponse, _$identity);

  /// Serializes this DateSpecificSlotResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateSpecificSlotResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.bookedPatients, bookedPatients) || other.bookedPatients == bookedPatients)&&(identical(other.availableSpots, availableSpots) || other.availableSpots == availableSpots)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,clinicId,date,slotType,startTime,endTime,maxPatients,bookedPatients,availableSpots,isAvailable,status,notes,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DateSpecificSlotResponse(id: $id, doctorId: $doctorId, clinicId: $clinicId, date: $date, slotType: $slotType, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, bookedPatients: $bookedPatients, availableSpots: $availableSpots, isAvailable: $isAvailable, status: $status, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DateSpecificSlotResponseCopyWith<$Res>  {
  factory $DateSpecificSlotResponseCopyWith(DateSpecificSlotResponse value, $Res Function(DateSpecificSlotResponse) _then) = _$DateSpecificSlotResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId, String date,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'booked_patients') int? bookedPatients,@JsonKey(name: 'available_spots') int? availableSpots,@JsonKey(name: 'is_available') bool? isAvailable, String? status, String? notes,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$DateSpecificSlotResponseCopyWithImpl<$Res>
    implements $DateSpecificSlotResponseCopyWith<$Res> {
  _$DateSpecificSlotResponseCopyWithImpl(this._self, this._then);

  final DateSpecificSlotResponse _self;
  final $Res Function(DateSpecificSlotResponse) _then;

/// Create a copy of DateSpecificSlotResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? clinicId = null,Object? date = null,Object? slotType = null,Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? bookedPatients = freezed,Object? availableSpots = freezed,Object? isAvailable = freezed,Object? status = freezed,Object? notes = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,bookedPatients: freezed == bookedPatients ? _self.bookedPatients : bookedPatients // ignore: cast_nullable_to_non_nullable
as int?,availableSpots: freezed == availableSpots ? _self.availableSpots : availableSpots // ignore: cast_nullable_to_non_nullable
as int?,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DateSpecificSlotResponse].
extension DateSpecificSlotResponsePatterns on DateSpecificSlotResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DateSpecificSlotResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DateSpecificSlotResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DateSpecificSlotResponse value)  $default,){
final _that = this;
switch (_that) {
case _DateSpecificSlotResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DateSpecificSlotResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DateSpecificSlotResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId,  String date, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'booked_patients')  int? bookedPatients, @JsonKey(name: 'available_spots')  int? availableSpots, @JsonKey(name: 'is_available')  bool? isAvailable,  String? status,  String? notes, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DateSpecificSlotResponse() when $default != null:
return $default(_that.id,_that.doctorId,_that.clinicId,_that.date,_that.slotType,_that.startTime,_that.endTime,_that.maxPatients,_that.bookedPatients,_that.availableSpots,_that.isAvailable,_that.status,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId,  String date, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'booked_patients')  int? bookedPatients, @JsonKey(name: 'available_spots')  int? availableSpots, @JsonKey(name: 'is_available')  bool? isAvailable,  String? status,  String? notes, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DateSpecificSlotResponse():
return $default(_that.id,_that.doctorId,_that.clinicId,_that.date,_that.slotType,_that.startTime,_that.endTime,_that.maxPatients,_that.bookedPatients,_that.availableSpots,_that.isAvailable,_that.status,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId,  String date, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'booked_patients')  int? bookedPatients, @JsonKey(name: 'available_spots')  int? availableSpots, @JsonKey(name: 'is_available')  bool? isAvailable,  String? status,  String? notes, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DateSpecificSlotResponse() when $default != null:
return $default(_that.id,_that.doctorId,_that.clinicId,_that.date,_that.slotType,_that.startTime,_that.endTime,_that.maxPatients,_that.bookedPatients,_that.availableSpots,_that.isAvailable,_that.status,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DateSpecificSlotResponse implements DateSpecificSlotResponse {
  const _DateSpecificSlotResponse({required this.id, @JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'clinic_id') required this.clinicId, required this.date, @JsonKey(name: 'slot_type') required this.slotType, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'max_patients') required this.maxPatients, @JsonKey(name: 'booked_patients') this.bookedPatients, @JsonKey(name: 'available_spots') this.availableSpots, @JsonKey(name: 'is_available') this.isAvailable, this.status, this.notes, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _DateSpecificSlotResponse.fromJson(Map<String, dynamic> json) => _$DateSpecificSlotResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override final  String date;
@override@JsonKey(name: 'slot_type') final  String slotType;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override@JsonKey(name: 'booked_patients') final  int? bookedPatients;
@override@JsonKey(name: 'available_spots') final  int? availableSpots;
@override@JsonKey(name: 'is_available') final  bool? isAvailable;
@override final  String? status;
@override final  String? notes;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of DateSpecificSlotResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateSpecificSlotResponseCopyWith<_DateSpecificSlotResponse> get copyWith => __$DateSpecificSlotResponseCopyWithImpl<_DateSpecificSlotResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DateSpecificSlotResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateSpecificSlotResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.bookedPatients, bookedPatients) || other.bookedPatients == bookedPatients)&&(identical(other.availableSpots, availableSpots) || other.availableSpots == availableSpots)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,clinicId,date,slotType,startTime,endTime,maxPatients,bookedPatients,availableSpots,isAvailable,status,notes,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DateSpecificSlotResponse(id: $id, doctorId: $doctorId, clinicId: $clinicId, date: $date, slotType: $slotType, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, bookedPatients: $bookedPatients, availableSpots: $availableSpots, isAvailable: $isAvailable, status: $status, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DateSpecificSlotResponseCopyWith<$Res> implements $DateSpecificSlotResponseCopyWith<$Res> {
  factory _$DateSpecificSlotResponseCopyWith(_DateSpecificSlotResponse value, $Res Function(_DateSpecificSlotResponse) _then) = __$DateSpecificSlotResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId, String date,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'booked_patients') int? bookedPatients,@JsonKey(name: 'available_spots') int? availableSpots,@JsonKey(name: 'is_available') bool? isAvailable, String? status, String? notes,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$DateSpecificSlotResponseCopyWithImpl<$Res>
    implements _$DateSpecificSlotResponseCopyWith<$Res> {
  __$DateSpecificSlotResponseCopyWithImpl(this._self, this._then);

  final _DateSpecificSlotResponse _self;
  final $Res Function(_DateSpecificSlotResponse) _then;

/// Create a copy of DateSpecificSlotResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? clinicId = null,Object? date = null,Object? slotType = null,Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? bookedPatients = freezed,Object? availableSpots = freezed,Object? isAvailable = freezed,Object? status = freezed,Object? notes = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DateSpecificSlotResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,bookedPatients: freezed == bookedPatients ? _self.bookedPatients : bookedPatients // ignore: cast_nullable_to_non_nullable
as int?,availableSpots: freezed == availableSpots ? _self.availableSpots : availableSpots // ignore: cast_nullable_to_non_nullable
as int?,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateSlotsResponse {

 String get message;@JsonKey(name: 'created_slots') List<DateSpecificSlotResponse> get createdSlots;@JsonKey(name: 'failed_slots') List<Map<String, dynamic>> get failedSlots;@JsonKey(name: 'total_created') int get totalCreated;@JsonKey(name: 'total_failed') int get totalFailed;
/// Create a copy of CreateSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSlotsResponseCopyWith<CreateSlotsResponse> get copyWith => _$CreateSlotsResponseCopyWithImpl<CreateSlotsResponse>(this as CreateSlotsResponse, _$identity);

  /// Serializes this CreateSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSlotsResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.createdSlots, createdSlots)&&const DeepCollectionEquality().equals(other.failedSlots, failedSlots)&&(identical(other.totalCreated, totalCreated) || other.totalCreated == totalCreated)&&(identical(other.totalFailed, totalFailed) || other.totalFailed == totalFailed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(createdSlots),const DeepCollectionEquality().hash(failedSlots),totalCreated,totalFailed);

@override
String toString() {
  return 'CreateSlotsResponse(message: $message, createdSlots: $createdSlots, failedSlots: $failedSlots, totalCreated: $totalCreated, totalFailed: $totalFailed)';
}


}

/// @nodoc
abstract mixin class $CreateSlotsResponseCopyWith<$Res>  {
  factory $CreateSlotsResponseCopyWith(CreateSlotsResponse value, $Res Function(CreateSlotsResponse) _then) = _$CreateSlotsResponseCopyWithImpl;
@useResult
$Res call({
 String message,@JsonKey(name: 'created_slots') List<DateSpecificSlotResponse> createdSlots,@JsonKey(name: 'failed_slots') List<Map<String, dynamic>> failedSlots,@JsonKey(name: 'total_created') int totalCreated,@JsonKey(name: 'total_failed') int totalFailed
});




}
/// @nodoc
class _$CreateSlotsResponseCopyWithImpl<$Res>
    implements $CreateSlotsResponseCopyWith<$Res> {
  _$CreateSlotsResponseCopyWithImpl(this._self, this._then);

  final CreateSlotsResponse _self;
  final $Res Function(CreateSlotsResponse) _then;

/// Create a copy of CreateSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? createdSlots = null,Object? failedSlots = null,Object? totalCreated = null,Object? totalFailed = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdSlots: null == createdSlots ? _self.createdSlots : createdSlots // ignore: cast_nullable_to_non_nullable
as List<DateSpecificSlotResponse>,failedSlots: null == failedSlots ? _self.failedSlots : failedSlots // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,totalCreated: null == totalCreated ? _self.totalCreated : totalCreated // ignore: cast_nullable_to_non_nullable
as int,totalFailed: null == totalFailed ? _self.totalFailed : totalFailed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSlotsResponse].
extension CreateSlotsResponsePatterns on CreateSlotsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSlotsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateSlotsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSlotsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'created_slots')  List<DateSpecificSlotResponse> createdSlots, @JsonKey(name: 'failed_slots')  List<Map<String, dynamic>> failedSlots, @JsonKey(name: 'total_created')  int totalCreated, @JsonKey(name: 'total_failed')  int totalFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSlotsResponse() when $default != null:
return $default(_that.message,_that.createdSlots,_that.failedSlots,_that.totalCreated,_that.totalFailed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message, @JsonKey(name: 'created_slots')  List<DateSpecificSlotResponse> createdSlots, @JsonKey(name: 'failed_slots')  List<Map<String, dynamic>> failedSlots, @JsonKey(name: 'total_created')  int totalCreated, @JsonKey(name: 'total_failed')  int totalFailed)  $default,) {final _that = this;
switch (_that) {
case _CreateSlotsResponse():
return $default(_that.message,_that.createdSlots,_that.failedSlots,_that.totalCreated,_that.totalFailed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message, @JsonKey(name: 'created_slots')  List<DateSpecificSlotResponse> createdSlots, @JsonKey(name: 'failed_slots')  List<Map<String, dynamic>> failedSlots, @JsonKey(name: 'total_created')  int totalCreated, @JsonKey(name: 'total_failed')  int totalFailed)?  $default,) {final _that = this;
switch (_that) {
case _CreateSlotsResponse() when $default != null:
return $default(_that.message,_that.createdSlots,_that.failedSlots,_that.totalCreated,_that.totalFailed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSlotsResponse implements CreateSlotsResponse {
  const _CreateSlotsResponse({required this.message, @JsonKey(name: 'created_slots') final  List<DateSpecificSlotResponse> createdSlots = const [], @JsonKey(name: 'failed_slots') final  List<Map<String, dynamic>> failedSlots = const [], @JsonKey(name: 'total_created') required this.totalCreated, @JsonKey(name: 'total_failed') required this.totalFailed}): _createdSlots = createdSlots,_failedSlots = failedSlots;
  factory _CreateSlotsResponse.fromJson(Map<String, dynamic> json) => _$CreateSlotsResponseFromJson(json);

@override final  String message;
 final  List<DateSpecificSlotResponse> _createdSlots;
@override@JsonKey(name: 'created_slots') List<DateSpecificSlotResponse> get createdSlots {
  if (_createdSlots is EqualUnmodifiableListView) return _createdSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_createdSlots);
}

 final  List<Map<String, dynamic>> _failedSlots;
@override@JsonKey(name: 'failed_slots') List<Map<String, dynamic>> get failedSlots {
  if (_failedSlots is EqualUnmodifiableListView) return _failedSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failedSlots);
}

@override@JsonKey(name: 'total_created') final  int totalCreated;
@override@JsonKey(name: 'total_failed') final  int totalFailed;

/// Create a copy of CreateSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSlotsResponseCopyWith<_CreateSlotsResponse> get copyWith => __$CreateSlotsResponseCopyWithImpl<_CreateSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSlotsResponse&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._createdSlots, _createdSlots)&&const DeepCollectionEquality().equals(other._failedSlots, _failedSlots)&&(identical(other.totalCreated, totalCreated) || other.totalCreated == totalCreated)&&(identical(other.totalFailed, totalFailed) || other.totalFailed == totalFailed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_createdSlots),const DeepCollectionEquality().hash(_failedSlots),totalCreated,totalFailed);

@override
String toString() {
  return 'CreateSlotsResponse(message: $message, createdSlots: $createdSlots, failedSlots: $failedSlots, totalCreated: $totalCreated, totalFailed: $totalFailed)';
}


}

/// @nodoc
abstract mixin class _$CreateSlotsResponseCopyWith<$Res> implements $CreateSlotsResponseCopyWith<$Res> {
  factory _$CreateSlotsResponseCopyWith(_CreateSlotsResponse value, $Res Function(_CreateSlotsResponse) _then) = __$CreateSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
 String message,@JsonKey(name: 'created_slots') List<DateSpecificSlotResponse> createdSlots,@JsonKey(name: 'failed_slots') List<Map<String, dynamic>> failedSlots,@JsonKey(name: 'total_created') int totalCreated,@JsonKey(name: 'total_failed') int totalFailed
});




}
/// @nodoc
class __$CreateSlotsResponseCopyWithImpl<$Res>
    implements _$CreateSlotsResponseCopyWith<$Res> {
  __$CreateSlotsResponseCopyWithImpl(this._self, this._then);

  final _CreateSlotsResponse _self;
  final $Res Function(_CreateSlotsResponse) _then;

/// Create a copy of CreateSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? createdSlots = null,Object? failedSlots = null,Object? totalCreated = null,Object? totalFailed = null,}) {
  return _then(_CreateSlotsResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdSlots: null == createdSlots ? _self._createdSlots : createdSlots // ignore: cast_nullable_to_non_nullable
as List<DateSpecificSlotResponse>,failedSlots: null == failedSlots ? _self._failedSlots : failedSlots // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,totalCreated: null == totalCreated ? _self.totalCreated : totalCreated // ignore: cast_nullable_to_non_nullable
as int,totalFailed: null == totalFailed ? _self.totalFailed : totalFailed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ListSlotsResponse {

 List<DateSpecificSlotResponse> get slots; int get total;@JsonKey(name: 'doctor_id') String? get doctorId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'slot_type') String? get slotType; String? get date;@JsonKey(name: 'walkin_available') bool get walkinAvailable;@JsonKey(name: 'walkin_reason') String? get walkinReason;
/// Create a copy of ListSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListSlotsResponseCopyWith<ListSlotsResponse> get copyWith => _$ListSlotsResponseCopyWithImpl<ListSlotsResponse>(this as ListSlotsResponse, _$identity);

  /// Serializes this ListSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListSlotsResponse&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.total, total) || other.total == total)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&(identical(other.walkinAvailable, walkinAvailable) || other.walkinAvailable == walkinAvailable)&&(identical(other.walkinReason, walkinReason) || other.walkinReason == walkinReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(slots),total,doctorId,clinicId,slotType,date,walkinAvailable,walkinReason);

@override
String toString() {
  return 'ListSlotsResponse(slots: $slots, total: $total, doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, walkinAvailable: $walkinAvailable, walkinReason: $walkinReason)';
}


}

/// @nodoc
abstract mixin class $ListSlotsResponseCopyWith<$Res>  {
  factory $ListSlotsResponseCopyWith(ListSlotsResponse value, $Res Function(ListSlotsResponse) _then) = _$ListSlotsResponseCopyWithImpl;
@useResult
$Res call({
 List<DateSpecificSlotResponse> slots, int total,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_type') String? slotType, String? date,@JsonKey(name: 'walkin_available') bool walkinAvailable,@JsonKey(name: 'walkin_reason') String? walkinReason
});




}
/// @nodoc
class _$ListSlotsResponseCopyWithImpl<$Res>
    implements $ListSlotsResponseCopyWith<$Res> {
  _$ListSlotsResponseCopyWithImpl(this._self, this._then);

  final ListSlotsResponse _self;
  final $Res Function(ListSlotsResponse) _then;

/// Create a copy of ListSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slots = null,Object? total = null,Object? doctorId = freezed,Object? clinicId = freezed,Object? slotType = freezed,Object? date = freezed,Object? walkinAvailable = null,Object? walkinReason = freezed,}) {
  return _then(_self.copyWith(
slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<DateSpecificSlotResponse>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,walkinAvailable: null == walkinAvailable ? _self.walkinAvailable : walkinAvailable // ignore: cast_nullable_to_non_nullable
as bool,walkinReason: freezed == walkinReason ? _self.walkinReason : walkinReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListSlotsResponse].
extension ListSlotsResponsePatterns on ListSlotsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListSlotsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListSlotsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListSlotsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DateSpecificSlotResponse> slots,  int total, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date, @JsonKey(name: 'walkin_available')  bool walkinAvailable, @JsonKey(name: 'walkin_reason')  String? walkinReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListSlotsResponse() when $default != null:
return $default(_that.slots,_that.total,_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.walkinAvailable,_that.walkinReason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DateSpecificSlotResponse> slots,  int total, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date, @JsonKey(name: 'walkin_available')  bool walkinAvailable, @JsonKey(name: 'walkin_reason')  String? walkinReason)  $default,) {final _that = this;
switch (_that) {
case _ListSlotsResponse():
return $default(_that.slots,_that.total,_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.walkinAvailable,_that.walkinReason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DateSpecificSlotResponse> slots,  int total, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_type')  String? slotType,  String? date, @JsonKey(name: 'walkin_available')  bool walkinAvailable, @JsonKey(name: 'walkin_reason')  String? walkinReason)?  $default,) {final _that = this;
switch (_that) {
case _ListSlotsResponse() when $default != null:
return $default(_that.slots,_that.total,_that.doctorId,_that.clinicId,_that.slotType,_that.date,_that.walkinAvailable,_that.walkinReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListSlotsResponse implements ListSlotsResponse {
  const _ListSlotsResponse({final  List<DateSpecificSlotResponse> slots = const [], this.total = 0, @JsonKey(name: 'doctor_id') this.doctorId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'slot_type') this.slotType, this.date, @JsonKey(name: 'walkin_available') this.walkinAvailable = false, @JsonKey(name: 'walkin_reason') this.walkinReason}): _slots = slots;
  factory _ListSlotsResponse.fromJson(Map<String, dynamic> json) => _$ListSlotsResponseFromJson(json);

 final  List<DateSpecificSlotResponse> _slots;
@override@JsonKey() List<DateSpecificSlotResponse> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override@JsonKey() final  int total;
@override@JsonKey(name: 'doctor_id') final  String? doctorId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'slot_type') final  String? slotType;
@override final  String? date;
@override@JsonKey(name: 'walkin_available') final  bool walkinAvailable;
@override@JsonKey(name: 'walkin_reason') final  String? walkinReason;

/// Create a copy of ListSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListSlotsResponseCopyWith<_ListSlotsResponse> get copyWith => __$ListSlotsResponseCopyWithImpl<_ListSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListSlotsResponse&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.total, total) || other.total == total)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.date, date) || other.date == date)&&(identical(other.walkinAvailable, walkinAvailable) || other.walkinAvailable == walkinAvailable)&&(identical(other.walkinReason, walkinReason) || other.walkinReason == walkinReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_slots),total,doctorId,clinicId,slotType,date,walkinAvailable,walkinReason);

@override
String toString() {
  return 'ListSlotsResponse(slots: $slots, total: $total, doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, date: $date, walkinAvailable: $walkinAvailable, walkinReason: $walkinReason)';
}


}

/// @nodoc
abstract mixin class _$ListSlotsResponseCopyWith<$Res> implements $ListSlotsResponseCopyWith<$Res> {
  factory _$ListSlotsResponseCopyWith(_ListSlotsResponse value, $Res Function(_ListSlotsResponse) _then) = __$ListSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<DateSpecificSlotResponse> slots, int total,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_type') String? slotType, String? date,@JsonKey(name: 'walkin_available') bool walkinAvailable,@JsonKey(name: 'walkin_reason') String? walkinReason
});




}
/// @nodoc
class __$ListSlotsResponseCopyWithImpl<$Res>
    implements _$ListSlotsResponseCopyWith<$Res> {
  __$ListSlotsResponseCopyWithImpl(this._self, this._then);

  final _ListSlotsResponse _self;
  final $Res Function(_ListSlotsResponse) _then;

/// Create a copy of ListSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slots = null,Object? total = null,Object? doctorId = freezed,Object? clinicId = freezed,Object? slotType = freezed,Object? date = freezed,Object? walkinAvailable = null,Object? walkinReason = freezed,}) {
  return _then(_ListSlotsResponse(
slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<DateSpecificSlotResponse>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,walkinAvailable: null == walkinAvailable ? _self.walkinAvailable : walkinAvailable // ignore: cast_nullable_to_non_nullable
as bool,walkinReason: freezed == walkinReason ? _self.walkinReason : walkinReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
