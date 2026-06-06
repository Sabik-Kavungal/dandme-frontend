// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/doctor_session_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IndividualSlot {

 String get id;@JsonKey(name: 'session_id') String? get sessionId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'slot_start') String? get slotStart;@JsonKey(name: 'slot_end') String? get slotEnd;@JsonKey(name: 'start_datetime') String? get startDatetime;@JsonKey(name: 'end_datetime') String? get endDatetime;@JsonKey(name: 'max_patients') int get maxPatients;@JsonKey(name: 'available_count') int get availableCount;@JsonKey(name: 'booked_count') int get bookedCount;@JsonKey(name: 'is_booked') bool get isBooked;@JsonKey(name: 'is_bookable') bool get isBookable;@JsonKey(name: 'booked_patient_id') String? get bookedPatientId;@JsonKey(name: 'booked_appointment_id') String? get bookedAppointmentId; String get status;@JsonKey(name: 'display_message') String get displayMessage; String? get notes;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of IndividualSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndividualSlotCopyWith<IndividualSlot> get copyWith => _$IndividualSlotCopyWithImpl<IndividualSlot>(this as IndividualSlot, _$identity);

  /// Serializes this IndividualSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndividualSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotStart, slotStart) || other.slotStart == slotStart)&&(identical(other.slotEnd, slotEnd) || other.slotEnd == slotEnd)&&(identical(other.startDatetime, startDatetime) || other.startDatetime == startDatetime)&&(identical(other.endDatetime, endDatetime) || other.endDatetime == endDatetime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.availableCount, availableCount) || other.availableCount == availableCount)&&(identical(other.bookedCount, bookedCount) || other.bookedCount == bookedCount)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.isBookable, isBookable) || other.isBookable == isBookable)&&(identical(other.bookedPatientId, bookedPatientId) || other.bookedPatientId == bookedPatientId)&&(identical(other.bookedAppointmentId, bookedAppointmentId) || other.bookedAppointmentId == bookedAppointmentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayMessage, displayMessage) || other.displayMessage == displayMessage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sessionId,clinicId,slotStart,slotEnd,startDatetime,endDatetime,maxPatients,availableCount,bookedCount,isBooked,isBookable,bookedPatientId,bookedAppointmentId,status,displayMessage,notes,createdAt,updatedAt]);

@override
String toString() {
  return 'IndividualSlot(id: $id, sessionId: $sessionId, clinicId: $clinicId, slotStart: $slotStart, slotEnd: $slotEnd, startDatetime: $startDatetime, endDatetime: $endDatetime, maxPatients: $maxPatients, availableCount: $availableCount, bookedCount: $bookedCount, isBooked: $isBooked, isBookable: $isBookable, bookedPatientId: $bookedPatientId, bookedAppointmentId: $bookedAppointmentId, status: $status, displayMessage: $displayMessage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IndividualSlotCopyWith<$Res>  {
  factory $IndividualSlotCopyWith(IndividualSlot value, $Res Function(IndividualSlot) _then) = _$IndividualSlotCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_start') String? slotStart,@JsonKey(name: 'slot_end') String? slotEnd,@JsonKey(name: 'start_datetime') String? startDatetime,@JsonKey(name: 'end_datetime') String? endDatetime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'available_count') int availableCount,@JsonKey(name: 'booked_count') int bookedCount,@JsonKey(name: 'is_booked') bool isBooked,@JsonKey(name: 'is_bookable') bool isBookable,@JsonKey(name: 'booked_patient_id') String? bookedPatientId,@JsonKey(name: 'booked_appointment_id') String? bookedAppointmentId, String status,@JsonKey(name: 'display_message') String displayMessage, String? notes,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$IndividualSlotCopyWithImpl<$Res>
    implements $IndividualSlotCopyWith<$Res> {
  _$IndividualSlotCopyWithImpl(this._self, this._then);

  final IndividualSlot _self;
  final $Res Function(IndividualSlot) _then;

/// Create a copy of IndividualSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = freezed,Object? clinicId = freezed,Object? slotStart = freezed,Object? slotEnd = freezed,Object? startDatetime = freezed,Object? endDatetime = freezed,Object? maxPatients = null,Object? availableCount = null,Object? bookedCount = null,Object? isBooked = null,Object? isBookable = null,Object? bookedPatientId = freezed,Object? bookedAppointmentId = freezed,Object? status = null,Object? displayMessage = null,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotStart: freezed == slotStart ? _self.slotStart : slotStart // ignore: cast_nullable_to_non_nullable
as String?,slotEnd: freezed == slotEnd ? _self.slotEnd : slotEnd // ignore: cast_nullable_to_non_nullable
as String?,startDatetime: freezed == startDatetime ? _self.startDatetime : startDatetime // ignore: cast_nullable_to_non_nullable
as String?,endDatetime: freezed == endDatetime ? _self.endDatetime : endDatetime // ignore: cast_nullable_to_non_nullable
as String?,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,availableCount: null == availableCount ? _self.availableCount : availableCount // ignore: cast_nullable_to_non_nullable
as int,bookedCount: null == bookedCount ? _self.bookedCount : bookedCount // ignore: cast_nullable_to_non_nullable
as int,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,isBookable: null == isBookable ? _self.isBookable : isBookable // ignore: cast_nullable_to_non_nullable
as bool,bookedPatientId: freezed == bookedPatientId ? _self.bookedPatientId : bookedPatientId // ignore: cast_nullable_to_non_nullable
as String?,bookedAppointmentId: freezed == bookedAppointmentId ? _self.bookedAppointmentId : bookedAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayMessage: null == displayMessage ? _self.displayMessage : displayMessage // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IndividualSlot].
extension IndividualSlotPatterns on IndividualSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndividualSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndividualSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndividualSlot value)  $default,){
final _that = this;
switch (_that) {
case _IndividualSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndividualSlot value)?  $default,){
final _that = this;
switch (_that) {
case _IndividualSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_start')  String? slotStart, @JsonKey(name: 'slot_end')  String? slotEnd, @JsonKey(name: 'start_datetime')  String? startDatetime, @JsonKey(name: 'end_datetime')  String? endDatetime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'available_count')  int availableCount, @JsonKey(name: 'booked_count')  int bookedCount, @JsonKey(name: 'is_booked')  bool isBooked, @JsonKey(name: 'is_bookable')  bool isBookable, @JsonKey(name: 'booked_patient_id')  String? bookedPatientId, @JsonKey(name: 'booked_appointment_id')  String? bookedAppointmentId,  String status, @JsonKey(name: 'display_message')  String displayMessage,  String? notes, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndividualSlot() when $default != null:
return $default(_that.id,_that.sessionId,_that.clinicId,_that.slotStart,_that.slotEnd,_that.startDatetime,_that.endDatetime,_that.maxPatients,_that.availableCount,_that.bookedCount,_that.isBooked,_that.isBookable,_that.bookedPatientId,_that.bookedAppointmentId,_that.status,_that.displayMessage,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_start')  String? slotStart, @JsonKey(name: 'slot_end')  String? slotEnd, @JsonKey(name: 'start_datetime')  String? startDatetime, @JsonKey(name: 'end_datetime')  String? endDatetime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'available_count')  int availableCount, @JsonKey(name: 'booked_count')  int bookedCount, @JsonKey(name: 'is_booked')  bool isBooked, @JsonKey(name: 'is_bookable')  bool isBookable, @JsonKey(name: 'booked_patient_id')  String? bookedPatientId, @JsonKey(name: 'booked_appointment_id')  String? bookedAppointmentId,  String status, @JsonKey(name: 'display_message')  String displayMessage,  String? notes, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _IndividualSlot():
return $default(_that.id,_that.sessionId,_that.clinicId,_that.slotStart,_that.slotEnd,_that.startDatetime,_that.endDatetime,_that.maxPatients,_that.availableCount,_that.bookedCount,_that.isBooked,_that.isBookable,_that.bookedPatientId,_that.bookedAppointmentId,_that.status,_that.displayMessage,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'slot_start')  String? slotStart, @JsonKey(name: 'slot_end')  String? slotEnd, @JsonKey(name: 'start_datetime')  String? startDatetime, @JsonKey(name: 'end_datetime')  String? endDatetime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'available_count')  int availableCount, @JsonKey(name: 'booked_count')  int bookedCount, @JsonKey(name: 'is_booked')  bool isBooked, @JsonKey(name: 'is_bookable')  bool isBookable, @JsonKey(name: 'booked_patient_id')  String? bookedPatientId, @JsonKey(name: 'booked_appointment_id')  String? bookedAppointmentId,  String status, @JsonKey(name: 'display_message')  String displayMessage,  String? notes, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _IndividualSlot() when $default != null:
return $default(_that.id,_that.sessionId,_that.clinicId,_that.slotStart,_that.slotEnd,_that.startDatetime,_that.endDatetime,_that.maxPatients,_that.availableCount,_that.bookedCount,_that.isBooked,_that.isBookable,_that.bookedPatientId,_that.bookedAppointmentId,_that.status,_that.displayMessage,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndividualSlot implements IndividualSlot {
  const _IndividualSlot({required this.id, @JsonKey(name: 'session_id') this.sessionId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'slot_start') this.slotStart, @JsonKey(name: 'slot_end') this.slotEnd, @JsonKey(name: 'start_datetime') this.startDatetime, @JsonKey(name: 'end_datetime') this.endDatetime, @JsonKey(name: 'max_patients') this.maxPatients = 1, @JsonKey(name: 'available_count') this.availableCount = 1, @JsonKey(name: 'booked_count') this.bookedCount = 0, @JsonKey(name: 'is_booked') this.isBooked = false, @JsonKey(name: 'is_bookable') this.isBookable = true, @JsonKey(name: 'booked_patient_id') this.bookedPatientId, @JsonKey(name: 'booked_appointment_id') this.bookedAppointmentId, this.status = 'available', @JsonKey(name: 'display_message') this.displayMessage = 'Available', this.notes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _IndividualSlot.fromJson(Map<String, dynamic> json) => _$IndividualSlotFromJson(json);

@override final  String id;
@override@JsonKey(name: 'session_id') final  String? sessionId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'slot_start') final  String? slotStart;
@override@JsonKey(name: 'slot_end') final  String? slotEnd;
@override@JsonKey(name: 'start_datetime') final  String? startDatetime;
@override@JsonKey(name: 'end_datetime') final  String? endDatetime;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override@JsonKey(name: 'available_count') final  int availableCount;
@override@JsonKey(name: 'booked_count') final  int bookedCount;
@override@JsonKey(name: 'is_booked') final  bool isBooked;
@override@JsonKey(name: 'is_bookable') final  bool isBookable;
@override@JsonKey(name: 'booked_patient_id') final  String? bookedPatientId;
@override@JsonKey(name: 'booked_appointment_id') final  String? bookedAppointmentId;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'display_message') final  String displayMessage;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of IndividualSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndividualSlotCopyWith<_IndividualSlot> get copyWith => __$IndividualSlotCopyWithImpl<_IndividualSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndividualSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndividualSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotStart, slotStart) || other.slotStart == slotStart)&&(identical(other.slotEnd, slotEnd) || other.slotEnd == slotEnd)&&(identical(other.startDatetime, startDatetime) || other.startDatetime == startDatetime)&&(identical(other.endDatetime, endDatetime) || other.endDatetime == endDatetime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.availableCount, availableCount) || other.availableCount == availableCount)&&(identical(other.bookedCount, bookedCount) || other.bookedCount == bookedCount)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.isBookable, isBookable) || other.isBookable == isBookable)&&(identical(other.bookedPatientId, bookedPatientId) || other.bookedPatientId == bookedPatientId)&&(identical(other.bookedAppointmentId, bookedAppointmentId) || other.bookedAppointmentId == bookedAppointmentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayMessage, displayMessage) || other.displayMessage == displayMessage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sessionId,clinicId,slotStart,slotEnd,startDatetime,endDatetime,maxPatients,availableCount,bookedCount,isBooked,isBookable,bookedPatientId,bookedAppointmentId,status,displayMessage,notes,createdAt,updatedAt]);

@override
String toString() {
  return 'IndividualSlot(id: $id, sessionId: $sessionId, clinicId: $clinicId, slotStart: $slotStart, slotEnd: $slotEnd, startDatetime: $startDatetime, endDatetime: $endDatetime, maxPatients: $maxPatients, availableCount: $availableCount, bookedCount: $bookedCount, isBooked: $isBooked, isBookable: $isBookable, bookedPatientId: $bookedPatientId, bookedAppointmentId: $bookedAppointmentId, status: $status, displayMessage: $displayMessage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IndividualSlotCopyWith<$Res> implements $IndividualSlotCopyWith<$Res> {
  factory _$IndividualSlotCopyWith(_IndividualSlot value, $Res Function(_IndividualSlot) _then) = __$IndividualSlotCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'slot_start') String? slotStart,@JsonKey(name: 'slot_end') String? slotEnd,@JsonKey(name: 'start_datetime') String? startDatetime,@JsonKey(name: 'end_datetime') String? endDatetime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'available_count') int availableCount,@JsonKey(name: 'booked_count') int bookedCount,@JsonKey(name: 'is_booked') bool isBooked,@JsonKey(name: 'is_bookable') bool isBookable,@JsonKey(name: 'booked_patient_id') String? bookedPatientId,@JsonKey(name: 'booked_appointment_id') String? bookedAppointmentId, String status,@JsonKey(name: 'display_message') String displayMessage, String? notes,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$IndividualSlotCopyWithImpl<$Res>
    implements _$IndividualSlotCopyWith<$Res> {
  __$IndividualSlotCopyWithImpl(this._self, this._then);

  final _IndividualSlot _self;
  final $Res Function(_IndividualSlot) _then;

/// Create a copy of IndividualSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = freezed,Object? clinicId = freezed,Object? slotStart = freezed,Object? slotEnd = freezed,Object? startDatetime = freezed,Object? endDatetime = freezed,Object? maxPatients = null,Object? availableCount = null,Object? bookedCount = null,Object? isBooked = null,Object? isBookable = null,Object? bookedPatientId = freezed,Object? bookedAppointmentId = freezed,Object? status = null,Object? displayMessage = null,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_IndividualSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,slotStart: freezed == slotStart ? _self.slotStart : slotStart // ignore: cast_nullable_to_non_nullable
as String?,slotEnd: freezed == slotEnd ? _self.slotEnd : slotEnd // ignore: cast_nullable_to_non_nullable
as String?,startDatetime: freezed == startDatetime ? _self.startDatetime : startDatetime // ignore: cast_nullable_to_non_nullable
as String?,endDatetime: freezed == endDatetime ? _self.endDatetime : endDatetime // ignore: cast_nullable_to_non_nullable
as String?,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,availableCount: null == availableCount ? _self.availableCount : availableCount // ignore: cast_nullable_to_non_nullable
as int,bookedCount: null == bookedCount ? _self.bookedCount : bookedCount // ignore: cast_nullable_to_non_nullable
as int,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,isBookable: null == isBookable ? _self.isBookable : isBookable // ignore: cast_nullable_to_non_nullable
as bool,bookedPatientId: freezed == bookedPatientId ? _self.bookedPatientId : bookedPatientId // ignore: cast_nullable_to_non_nullable
as String?,bookedAppointmentId: freezed == bookedAppointmentId ? _self.bookedAppointmentId : bookedAppointmentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayMessage: null == displayMessage ? _self.displayMessage : displayMessage // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SessionDefinition {

@JsonKey(name: 'session_name') String get sessionName;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'max_patients') int get maxPatients;@JsonKey(name: 'slot_interval_minutes') int get slotIntervalMinutes; String? get notes;
/// Create a copy of SessionDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDefinitionCopyWith<SessionDefinition> get copyWith => _$SessionDefinitionCopyWithImpl<SessionDefinition>(this as SessionDefinition, _$identity);

  /// Serializes this SessionDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDefinition&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.slotIntervalMinutes, slotIntervalMinutes) || other.slotIntervalMinutes == slotIntervalMinutes)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionName,startTime,endTime,maxPatients,slotIntervalMinutes,notes);

@override
String toString() {
  return 'SessionDefinition(sessionName: $sessionName, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, slotIntervalMinutes: $slotIntervalMinutes, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $SessionDefinitionCopyWith<$Res>  {
  factory $SessionDefinitionCopyWith(SessionDefinition value, $Res Function(SessionDefinition) _then) = _$SessionDefinitionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_name') String sessionName,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes, String? notes
});




}
/// @nodoc
class _$SessionDefinitionCopyWithImpl<$Res>
    implements $SessionDefinitionCopyWith<$Res> {
  _$SessionDefinitionCopyWithImpl(this._self, this._then);

  final SessionDefinition _self;
  final $Res Function(SessionDefinition) _then;

/// Create a copy of SessionDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionName = null,Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? slotIntervalMinutes = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
sessionName: null == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,slotIntervalMinutes: null == slotIntervalMinutes ? _self.slotIntervalMinutes : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionDefinition].
extension SessionDefinitionPatterns on SessionDefinition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDefinition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDefinition value)  $default,){
final _that = this;
switch (_that) {
case _SessionDefinition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDefinition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_name')  String sessionName, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'slot_interval_minutes')  int slotIntervalMinutes,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDefinition() when $default != null:
return $default(_that.sessionName,_that.startTime,_that.endTime,_that.maxPatients,_that.slotIntervalMinutes,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_name')  String sessionName, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'slot_interval_minutes')  int slotIntervalMinutes,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _SessionDefinition():
return $default(_that.sessionName,_that.startTime,_that.endTime,_that.maxPatients,_that.slotIntervalMinutes,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_name')  String sessionName, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'slot_interval_minutes')  int slotIntervalMinutes,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _SessionDefinition() when $default != null:
return $default(_that.sessionName,_that.startTime,_that.endTime,_that.maxPatients,_that.slotIntervalMinutes,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionDefinition implements SessionDefinition {
  const _SessionDefinition({@JsonKey(name: 'session_name') required this.sessionName, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'max_patients') required this.maxPatients, @JsonKey(name: 'slot_interval_minutes') this.slotIntervalMinutes = 5, this.notes});
  factory _SessionDefinition.fromJson(Map<String, dynamic> json) => _$SessionDefinitionFromJson(json);

@override@JsonKey(name: 'session_name') final  String sessionName;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override@JsonKey(name: 'slot_interval_minutes') final  int slotIntervalMinutes;
@override final  String? notes;

/// Create a copy of SessionDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDefinitionCopyWith<_SessionDefinition> get copyWith => __$SessionDefinitionCopyWithImpl<_SessionDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDefinition&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.slotIntervalMinutes, slotIntervalMinutes) || other.slotIntervalMinutes == slotIntervalMinutes)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionName,startTime,endTime,maxPatients,slotIntervalMinutes,notes);

@override
String toString() {
  return 'SessionDefinition(sessionName: $sessionName, startTime: $startTime, endTime: $endTime, maxPatients: $maxPatients, slotIntervalMinutes: $slotIntervalMinutes, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$SessionDefinitionCopyWith<$Res> implements $SessionDefinitionCopyWith<$Res> {
  factory _$SessionDefinitionCopyWith(_SessionDefinition value, $Res Function(_SessionDefinition) _then) = __$SessionDefinitionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_name') String sessionName,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes, String? notes
});




}
/// @nodoc
class __$SessionDefinitionCopyWithImpl<$Res>
    implements _$SessionDefinitionCopyWith<$Res> {
  __$SessionDefinitionCopyWithImpl(this._self, this._then);

  final _SessionDefinition _self;
  final $Res Function(_SessionDefinition) _then;

/// Create a copy of SessionDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionName = null,Object? startTime = null,Object? endTime = null,Object? maxPatients = null,Object? slotIntervalMinutes = null,Object? notes = freezed,}) {
  return _then(_SessionDefinition(
sessionName: null == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,slotIntervalMinutes: null == slotIntervalMinutes ? _self.slotIntervalMinutes : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DoctorSlotSession {

 String get id;@JsonKey(name: 'time_slot_id') String? get timeSlotId;@JsonKey(name: 'clinic_id') String? get clinicId;@JsonKey(name: 'session_name') String? get sessionName;@JsonKey(name: 'start_time') String? get startTime;@JsonKey(name: 'end_time') String? get endTime;@JsonKey(name: 'start_datetime') String? get startDatetime;@JsonKey(name: 'end_datetime') String? get endDatetime;@JsonKey(name: 'max_patients') int get maxPatients;@JsonKey(name: 'slot_interval_minutes') int get slotIntervalMinutes;@JsonKey(name: 'generated_slots') int get generatedSlots;@JsonKey(name: 'available_slots') int get availableSlots;@JsonKey(name: 'booked_slots') int get bookedSlots; String? get notes; List<IndividualSlot> get slots;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of DoctorSlotSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorSlotSessionCopyWith<DoctorSlotSession> get copyWith => _$DoctorSlotSessionCopyWithImpl<DoctorSlotSession>(this as DoctorSlotSession, _$identity);

  /// Serializes this DoctorSlotSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorSlotSession&&(identical(other.id, id) || other.id == id)&&(identical(other.timeSlotId, timeSlotId) || other.timeSlotId == timeSlotId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startDatetime, startDatetime) || other.startDatetime == startDatetime)&&(identical(other.endDatetime, endDatetime) || other.endDatetime == endDatetime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.slotIntervalMinutes, slotIntervalMinutes) || other.slotIntervalMinutes == slotIntervalMinutes)&&(identical(other.generatedSlots, generatedSlots) || other.generatedSlots == generatedSlots)&&(identical(other.availableSlots, availableSlots) || other.availableSlots == availableSlots)&&(identical(other.bookedSlots, bookedSlots) || other.bookedSlots == bookedSlots)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeSlotId,clinicId,sessionName,startTime,endTime,startDatetime,endDatetime,maxPatients,slotIntervalMinutes,generatedSlots,availableSlots,bookedSlots,notes,const DeepCollectionEquality().hash(slots),createdAt,updatedAt);

@override
String toString() {
  return 'DoctorSlotSession(id: $id, timeSlotId: $timeSlotId, clinicId: $clinicId, sessionName: $sessionName, startTime: $startTime, endTime: $endTime, startDatetime: $startDatetime, endDatetime: $endDatetime, maxPatients: $maxPatients, slotIntervalMinutes: $slotIntervalMinutes, generatedSlots: $generatedSlots, availableSlots: $availableSlots, bookedSlots: $bookedSlots, notes: $notes, slots: $slots, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DoctorSlotSessionCopyWith<$Res>  {
  factory $DoctorSlotSessionCopyWith(DoctorSlotSession value, $Res Function(DoctorSlotSession) _then) = _$DoctorSlotSessionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'time_slot_id') String? timeSlotId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'session_name') String? sessionName,@JsonKey(name: 'start_time') String? startTime,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'start_datetime') String? startDatetime,@JsonKey(name: 'end_datetime') String? endDatetime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes,@JsonKey(name: 'generated_slots') int generatedSlots,@JsonKey(name: 'available_slots') int availableSlots,@JsonKey(name: 'booked_slots') int bookedSlots, String? notes, List<IndividualSlot> slots,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$DoctorSlotSessionCopyWithImpl<$Res>
    implements $DoctorSlotSessionCopyWith<$Res> {
  _$DoctorSlotSessionCopyWithImpl(this._self, this._then);

  final DoctorSlotSession _self;
  final $Res Function(DoctorSlotSession) _then;

/// Create a copy of DoctorSlotSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timeSlotId = freezed,Object? clinicId = freezed,Object? sessionName = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? startDatetime = freezed,Object? endDatetime = freezed,Object? maxPatients = null,Object? slotIntervalMinutes = null,Object? generatedSlots = null,Object? availableSlots = null,Object? bookedSlots = null,Object? notes = freezed,Object? slots = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeSlotId: freezed == timeSlotId ? _self.timeSlotId : timeSlotId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,sessionName: freezed == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,startDatetime: freezed == startDatetime ? _self.startDatetime : startDatetime // ignore: cast_nullable_to_non_nullable
as String?,endDatetime: freezed == endDatetime ? _self.endDatetime : endDatetime // ignore: cast_nullable_to_non_nullable
as String?,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,slotIntervalMinutes: null == slotIntervalMinutes ? _self.slotIntervalMinutes : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,generatedSlots: null == generatedSlots ? _self.generatedSlots : generatedSlots // ignore: cast_nullable_to_non_nullable
as int,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as int,bookedSlots: null == bookedSlots ? _self.bookedSlots : bookedSlots // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<IndividualSlot>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorSlotSession].
extension DoctorSlotSessionPatterns on DoctorSlotSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorSlotSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorSlotSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorSlotSession value)  $default,){
final _that = this;
switch (_that) {
case _DoctorSlotSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorSlotSession value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorSlotSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'time_slot_id')  String? timeSlotId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'session_name')  String? sessionName, @JsonKey(name: 'start_time')  String? startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'start_datetime')  String? startDatetime, @JsonKey(name: 'end_datetime')  String? endDatetime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'slot_interval_minutes')  int slotIntervalMinutes, @JsonKey(name: 'generated_slots')  int generatedSlots, @JsonKey(name: 'available_slots')  int availableSlots, @JsonKey(name: 'booked_slots')  int bookedSlots,  String? notes,  List<IndividualSlot> slots, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorSlotSession() when $default != null:
return $default(_that.id,_that.timeSlotId,_that.clinicId,_that.sessionName,_that.startTime,_that.endTime,_that.startDatetime,_that.endDatetime,_that.maxPatients,_that.slotIntervalMinutes,_that.generatedSlots,_that.availableSlots,_that.bookedSlots,_that.notes,_that.slots,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'time_slot_id')  String? timeSlotId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'session_name')  String? sessionName, @JsonKey(name: 'start_time')  String? startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'start_datetime')  String? startDatetime, @JsonKey(name: 'end_datetime')  String? endDatetime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'slot_interval_minutes')  int slotIntervalMinutes, @JsonKey(name: 'generated_slots')  int generatedSlots, @JsonKey(name: 'available_slots')  int availableSlots, @JsonKey(name: 'booked_slots')  int bookedSlots,  String? notes,  List<IndividualSlot> slots, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DoctorSlotSession():
return $default(_that.id,_that.timeSlotId,_that.clinicId,_that.sessionName,_that.startTime,_that.endTime,_that.startDatetime,_that.endDatetime,_that.maxPatients,_that.slotIntervalMinutes,_that.generatedSlots,_that.availableSlots,_that.bookedSlots,_that.notes,_that.slots,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'time_slot_id')  String? timeSlotId, @JsonKey(name: 'clinic_id')  String? clinicId, @JsonKey(name: 'session_name')  String? sessionName, @JsonKey(name: 'start_time')  String? startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'start_datetime')  String? startDatetime, @JsonKey(name: 'end_datetime')  String? endDatetime, @JsonKey(name: 'max_patients')  int maxPatients, @JsonKey(name: 'slot_interval_minutes')  int slotIntervalMinutes, @JsonKey(name: 'generated_slots')  int generatedSlots, @JsonKey(name: 'available_slots')  int availableSlots, @JsonKey(name: 'booked_slots')  int bookedSlots,  String? notes,  List<IndividualSlot> slots, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DoctorSlotSession() when $default != null:
return $default(_that.id,_that.timeSlotId,_that.clinicId,_that.sessionName,_that.startTime,_that.endTime,_that.startDatetime,_that.endDatetime,_that.maxPatients,_that.slotIntervalMinutes,_that.generatedSlots,_that.availableSlots,_that.bookedSlots,_that.notes,_that.slots,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorSlotSession implements DoctorSlotSession {
  const _DoctorSlotSession({required this.id, @JsonKey(name: 'time_slot_id') this.timeSlotId, @JsonKey(name: 'clinic_id') this.clinicId, @JsonKey(name: 'session_name') this.sessionName, @JsonKey(name: 'start_time') this.startTime, @JsonKey(name: 'end_time') this.endTime, @JsonKey(name: 'start_datetime') this.startDatetime, @JsonKey(name: 'end_datetime') this.endDatetime, @JsonKey(name: 'max_patients') this.maxPatients = 0, @JsonKey(name: 'slot_interval_minutes') this.slotIntervalMinutes = 5, @JsonKey(name: 'generated_slots') this.generatedSlots = 0, @JsonKey(name: 'available_slots') this.availableSlots = 0, @JsonKey(name: 'booked_slots') this.bookedSlots = 0, this.notes, final  List<IndividualSlot> slots = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _slots = slots;
  factory _DoctorSlotSession.fromJson(Map<String, dynamic> json) => _$DoctorSlotSessionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'time_slot_id') final  String? timeSlotId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override@JsonKey(name: 'session_name') final  String? sessionName;
@override@JsonKey(name: 'start_time') final  String? startTime;
@override@JsonKey(name: 'end_time') final  String? endTime;
@override@JsonKey(name: 'start_datetime') final  String? startDatetime;
@override@JsonKey(name: 'end_datetime') final  String? endDatetime;
@override@JsonKey(name: 'max_patients') final  int maxPatients;
@override@JsonKey(name: 'slot_interval_minutes') final  int slotIntervalMinutes;
@override@JsonKey(name: 'generated_slots') final  int generatedSlots;
@override@JsonKey(name: 'available_slots') final  int availableSlots;
@override@JsonKey(name: 'booked_slots') final  int bookedSlots;
@override final  String? notes;
 final  List<IndividualSlot> _slots;
@override@JsonKey() List<IndividualSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of DoctorSlotSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorSlotSessionCopyWith<_DoctorSlotSession> get copyWith => __$DoctorSlotSessionCopyWithImpl<_DoctorSlotSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorSlotSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorSlotSession&&(identical(other.id, id) || other.id == id)&&(identical(other.timeSlotId, timeSlotId) || other.timeSlotId == timeSlotId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startDatetime, startDatetime) || other.startDatetime == startDatetime)&&(identical(other.endDatetime, endDatetime) || other.endDatetime == endDatetime)&&(identical(other.maxPatients, maxPatients) || other.maxPatients == maxPatients)&&(identical(other.slotIntervalMinutes, slotIntervalMinutes) || other.slotIntervalMinutes == slotIntervalMinutes)&&(identical(other.generatedSlots, generatedSlots) || other.generatedSlots == generatedSlots)&&(identical(other.availableSlots, availableSlots) || other.availableSlots == availableSlots)&&(identical(other.bookedSlots, bookedSlots) || other.bookedSlots == bookedSlots)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeSlotId,clinicId,sessionName,startTime,endTime,startDatetime,endDatetime,maxPatients,slotIntervalMinutes,generatedSlots,availableSlots,bookedSlots,notes,const DeepCollectionEquality().hash(_slots),createdAt,updatedAt);

@override
String toString() {
  return 'DoctorSlotSession(id: $id, timeSlotId: $timeSlotId, clinicId: $clinicId, sessionName: $sessionName, startTime: $startTime, endTime: $endTime, startDatetime: $startDatetime, endDatetime: $endDatetime, maxPatients: $maxPatients, slotIntervalMinutes: $slotIntervalMinutes, generatedSlots: $generatedSlots, availableSlots: $availableSlots, bookedSlots: $bookedSlots, notes: $notes, slots: $slots, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorSlotSessionCopyWith<$Res> implements $DoctorSlotSessionCopyWith<$Res> {
  factory _$DoctorSlotSessionCopyWith(_DoctorSlotSession value, $Res Function(_DoctorSlotSession) _then) = __$DoctorSlotSessionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'time_slot_id') String? timeSlotId,@JsonKey(name: 'clinic_id') String? clinicId,@JsonKey(name: 'session_name') String? sessionName,@JsonKey(name: 'start_time') String? startTime,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'start_datetime') String? startDatetime,@JsonKey(name: 'end_datetime') String? endDatetime,@JsonKey(name: 'max_patients') int maxPatients,@JsonKey(name: 'slot_interval_minutes') int slotIntervalMinutes,@JsonKey(name: 'generated_slots') int generatedSlots,@JsonKey(name: 'available_slots') int availableSlots,@JsonKey(name: 'booked_slots') int bookedSlots, String? notes, List<IndividualSlot> slots,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$DoctorSlotSessionCopyWithImpl<$Res>
    implements _$DoctorSlotSessionCopyWith<$Res> {
  __$DoctorSlotSessionCopyWithImpl(this._self, this._then);

  final _DoctorSlotSession _self;
  final $Res Function(_DoctorSlotSession) _then;

/// Create a copy of DoctorSlotSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timeSlotId = freezed,Object? clinicId = freezed,Object? sessionName = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? startDatetime = freezed,Object? endDatetime = freezed,Object? maxPatients = null,Object? slotIntervalMinutes = null,Object? generatedSlots = null,Object? availableSlots = null,Object? bookedSlots = null,Object? notes = freezed,Object? slots = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DoctorSlotSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeSlotId: freezed == timeSlotId ? _self.timeSlotId : timeSlotId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,sessionName: freezed == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,startDatetime: freezed == startDatetime ? _self.startDatetime : startDatetime // ignore: cast_nullable_to_non_nullable
as String?,endDatetime: freezed == endDatetime ? _self.endDatetime : endDatetime // ignore: cast_nullable_to_non_nullable
as String?,maxPatients: null == maxPatients ? _self.maxPatients : maxPatients // ignore: cast_nullable_to_non_nullable
as int,slotIntervalMinutes: null == slotIntervalMinutes ? _self.slotIntervalMinutes : slotIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,generatedSlots: null == generatedSlots ? _self.generatedSlots : generatedSlots // ignore: cast_nullable_to_non_nullable
as int,availableSlots: null == availableSlots ? _self.availableSlots : availableSlots // ignore: cast_nullable_to_non_nullable
as int,bookedSlots: null == bookedSlots ? _self.bookedSlots : bookedSlots // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<IndividualSlot>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DoctorSessionSlot {

 String get id;@JsonKey(name: 'doctor_id') String? get doctorId;@JsonKey(name: 'clinic_id') String? get clinicId; String? get date;@JsonKey(name: 'day_of_week') int? get dayOfWeek;@JsonKey(name: 'slot_type') String? get slotType;@JsonKey(name: 'slot_duration') int get slotDuration;@JsonKey(name: 'is_available') bool get isAvailable; String? get notes; List<DoctorSlotSession> get sessions;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of DoctorSessionSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorSessionSlotCopyWith<DoctorSessionSlot> get copyWith => _$DoctorSessionSlotCopyWithImpl<DoctorSessionSlot>(this as DoctorSessionSlot, _$identity);

  /// Serializes this DoctorSessionSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorSessionSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.slotDuration, slotDuration) || other.slotDuration == slotDuration)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,clinicId,date,dayOfWeek,slotType,slotDuration,isAvailable,notes,const DeepCollectionEquality().hash(sessions),createdAt,updatedAt);

@override
String toString() {
  return 'DoctorSessionSlot(id: $id, doctorId: $doctorId, clinicId: $clinicId, date: $date, dayOfWeek: $dayOfWeek, slotType: $slotType, slotDuration: $slotDuration, isAvailable: $isAvailable, notes: $notes, sessions: $sessions, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DoctorSessionSlotCopyWith<$Res>  {
  factory $DoctorSessionSlotCopyWith(DoctorSessionSlot value, $Res Function(DoctorSessionSlot) _then) = _$DoctorSessionSlotCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'clinic_id') String? clinicId, String? date,@JsonKey(name: 'day_of_week') int? dayOfWeek,@JsonKey(name: 'slot_type') String? slotType,@JsonKey(name: 'slot_duration') int slotDuration,@JsonKey(name: 'is_available') bool isAvailable, String? notes, List<DoctorSlotSession> sessions,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$DoctorSessionSlotCopyWithImpl<$Res>
    implements $DoctorSessionSlotCopyWith<$Res> {
  _$DoctorSessionSlotCopyWithImpl(this._self, this._then);

  final DoctorSessionSlot _self;
  final $Res Function(DoctorSessionSlot) _then;

/// Create a copy of DoctorSessionSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = freezed,Object? clinicId = freezed,Object? date = freezed,Object? dayOfWeek = freezed,Object? slotType = freezed,Object? slotDuration = null,Object? isAvailable = null,Object? notes = freezed,Object? sessions = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,slotDuration: null == slotDuration ? _self.slotDuration : slotDuration // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<DoctorSlotSession>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorSessionSlot].
extension DoctorSessionSlotPatterns on DoctorSessionSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorSessionSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorSessionSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorSessionSlot value)  $default,){
final _that = this;
switch (_that) {
case _DoctorSessionSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorSessionSlot value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorSessionSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'day_of_week')  int? dayOfWeek, @JsonKey(name: 'slot_type')  String? slotType, @JsonKey(name: 'slot_duration')  int slotDuration, @JsonKey(name: 'is_available')  bool isAvailable,  String? notes,  List<DoctorSlotSession> sessions, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorSessionSlot() when $default != null:
return $default(_that.id,_that.doctorId,_that.clinicId,_that.date,_that.dayOfWeek,_that.slotType,_that.slotDuration,_that.isAvailable,_that.notes,_that.sessions,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'day_of_week')  int? dayOfWeek, @JsonKey(name: 'slot_type')  String? slotType, @JsonKey(name: 'slot_duration')  int slotDuration, @JsonKey(name: 'is_available')  bool isAvailable,  String? notes,  List<DoctorSlotSession> sessions, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DoctorSessionSlot():
return $default(_that.id,_that.doctorId,_that.clinicId,_that.date,_that.dayOfWeek,_that.slotType,_that.slotDuration,_that.isAvailable,_that.notes,_that.sessions,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'day_of_week')  int? dayOfWeek, @JsonKey(name: 'slot_type')  String? slotType, @JsonKey(name: 'slot_duration')  int slotDuration, @JsonKey(name: 'is_available')  bool isAvailable,  String? notes,  List<DoctorSlotSession> sessions, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DoctorSessionSlot() when $default != null:
return $default(_that.id,_that.doctorId,_that.clinicId,_that.date,_that.dayOfWeek,_that.slotType,_that.slotDuration,_that.isAvailable,_that.notes,_that.sessions,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorSessionSlot implements DoctorSessionSlot {
  const _DoctorSessionSlot({required this.id, @JsonKey(name: 'doctor_id') this.doctorId, @JsonKey(name: 'clinic_id') this.clinicId, this.date, @JsonKey(name: 'day_of_week') this.dayOfWeek, @JsonKey(name: 'slot_type') this.slotType, @JsonKey(name: 'slot_duration') this.slotDuration = 5, @JsonKey(name: 'is_available') this.isAvailable = true, this.notes, final  List<DoctorSlotSession> sessions = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _sessions = sessions;
  factory _DoctorSessionSlot.fromJson(Map<String, dynamic> json) => _$DoctorSessionSlotFromJson(json);

@override final  String id;
@override@JsonKey(name: 'doctor_id') final  String? doctorId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override final  String? date;
@override@JsonKey(name: 'day_of_week') final  int? dayOfWeek;
@override@JsonKey(name: 'slot_type') final  String? slotType;
@override@JsonKey(name: 'slot_duration') final  int slotDuration;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override final  String? notes;
 final  List<DoctorSlotSession> _sessions;
@override@JsonKey() List<DoctorSlotSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of DoctorSessionSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorSessionSlotCopyWith<_DoctorSessionSlot> get copyWith => __$DoctorSessionSlotCopyWithImpl<_DoctorSessionSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorSessionSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorSessionSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.slotDuration, slotDuration) || other.slotDuration == slotDuration)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,doctorId,clinicId,date,dayOfWeek,slotType,slotDuration,isAvailable,notes,const DeepCollectionEquality().hash(_sessions),createdAt,updatedAt);

@override
String toString() {
  return 'DoctorSessionSlot(id: $id, doctorId: $doctorId, clinicId: $clinicId, date: $date, dayOfWeek: $dayOfWeek, slotType: $slotType, slotDuration: $slotDuration, isAvailable: $isAvailable, notes: $notes, sessions: $sessions, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorSessionSlotCopyWith<$Res> implements $DoctorSessionSlotCopyWith<$Res> {
  factory _$DoctorSessionSlotCopyWith(_DoctorSessionSlot value, $Res Function(_DoctorSessionSlot) _then) = __$DoctorSessionSlotCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'clinic_id') String? clinicId, String? date,@JsonKey(name: 'day_of_week') int? dayOfWeek,@JsonKey(name: 'slot_type') String? slotType,@JsonKey(name: 'slot_duration') int slotDuration,@JsonKey(name: 'is_available') bool isAvailable, String? notes, List<DoctorSlotSession> sessions,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$DoctorSessionSlotCopyWithImpl<$Res>
    implements _$DoctorSessionSlotCopyWith<$Res> {
  __$DoctorSessionSlotCopyWithImpl(this._self, this._then);

  final _DoctorSessionSlot _self;
  final $Res Function(_DoctorSessionSlot) _then;

/// Create a copy of DoctorSessionSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = freezed,Object? clinicId = freezed,Object? date = freezed,Object? dayOfWeek = freezed,Object? slotType = freezed,Object? slotDuration = null,Object? isAvailable = null,Object? notes = freezed,Object? sessions = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DoctorSessionSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: freezed == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,slotDuration: null == slotDuration ? _self.slotDuration : slotDuration // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<DoctorSlotSession>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateSessionSlotsInput {

@JsonKey(name: 'doctor_id') String get doctorId;@JsonKey(name: 'clinic_id') String get clinicId;@JsonKey(name: 'slot_type') String get slotType;@JsonKey(name: 'slot_duration') int get slotDuration; String? get date;// For single date slots
 List<int> get weekdays;// For recurring slots: [0-6] where 0=Sunday, 1=Monday, ..., 6=Saturday
@JsonKey(name: 'is_available') bool get isAvailable; String? get notes; List<SessionDefinition> get sessions;
/// Create a copy of CreateSessionSlotsInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSessionSlotsInputCopyWith<CreateSessionSlotsInput> get copyWith => _$CreateSessionSlotsInputCopyWithImpl<CreateSessionSlotsInput>(this as CreateSessionSlotsInput, _$identity);

  /// Serializes this CreateSessionSlotsInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSessionSlotsInput&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.slotDuration, slotDuration) || other.slotDuration == slotDuration)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.weekdays, weekdays)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,slotDuration,date,const DeepCollectionEquality().hash(weekdays),isAvailable,notes,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'CreateSessionSlotsInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, slotDuration: $slotDuration, date: $date, weekdays: $weekdays, isAvailable: $isAvailable, notes: $notes, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $CreateSessionSlotsInputCopyWith<$Res>  {
  factory $CreateSessionSlotsInputCopyWith(CreateSessionSlotsInput value, $Res Function(CreateSessionSlotsInput) _then) = _$CreateSessionSlotsInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'slot_duration') int slotDuration, String? date, List<int> weekdays,@JsonKey(name: 'is_available') bool isAvailable, String? notes, List<SessionDefinition> sessions
});




}
/// @nodoc
class _$CreateSessionSlotsInputCopyWithImpl<$Res>
    implements $CreateSessionSlotsInputCopyWith<$Res> {
  _$CreateSessionSlotsInputCopyWithImpl(this._self, this._then);

  final CreateSessionSlotsInput _self;
  final $Res Function(CreateSessionSlotsInput) _then;

/// Create a copy of CreateSessionSlotsInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = null,Object? clinicId = null,Object? slotType = null,Object? slotDuration = null,Object? date = freezed,Object? weekdays = null,Object? isAvailable = null,Object? notes = freezed,Object? sessions = null,}) {
  return _then(_self.copyWith(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,slotDuration: null == slotDuration ? _self.slotDuration : slotDuration // ignore: cast_nullable_to_non_nullable
as int,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,weekdays: null == weekdays ? _self.weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as List<int>,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionDefinition>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSessionSlotsInput].
extension CreateSessionSlotsInputPatterns on CreateSessionSlotsInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSessionSlotsInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSessionSlotsInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSessionSlotsInput value)  $default,){
final _that = this;
switch (_that) {
case _CreateSessionSlotsInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSessionSlotsInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSessionSlotsInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'slot_duration')  int slotDuration,  String? date,  List<int> weekdays, @JsonKey(name: 'is_available')  bool isAvailable,  String? notes,  List<SessionDefinition> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSessionSlotsInput() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.slotDuration,_that.date,_that.weekdays,_that.isAvailable,_that.notes,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'slot_duration')  int slotDuration,  String? date,  List<int> weekdays, @JsonKey(name: 'is_available')  bool isAvailable,  String? notes,  List<SessionDefinition> sessions)  $default,) {final _that = this;
switch (_that) {
case _CreateSessionSlotsInput():
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.slotDuration,_that.date,_that.weekdays,_that.isAvailable,_that.notes,_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String doctorId, @JsonKey(name: 'clinic_id')  String clinicId, @JsonKey(name: 'slot_type')  String slotType, @JsonKey(name: 'slot_duration')  int slotDuration,  String? date,  List<int> weekdays, @JsonKey(name: 'is_available')  bool isAvailable,  String? notes,  List<SessionDefinition> sessions)?  $default,) {final _that = this;
switch (_that) {
case _CreateSessionSlotsInput() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.slotType,_that.slotDuration,_that.date,_that.weekdays,_that.isAvailable,_that.notes,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSessionSlotsInput implements CreateSessionSlotsInput {
  const _CreateSessionSlotsInput({@JsonKey(name: 'doctor_id') required this.doctorId, @JsonKey(name: 'clinic_id') required this.clinicId, @JsonKey(name: 'slot_type') required this.slotType, @JsonKey(name: 'slot_duration') this.slotDuration = 5, this.date, final  List<int> weekdays = const [], @JsonKey(name: 'is_available') this.isAvailable = true, this.notes, required final  List<SessionDefinition> sessions}): _weekdays = weekdays,_sessions = sessions;
  factory _CreateSessionSlotsInput.fromJson(Map<String, dynamic> json) => _$CreateSessionSlotsInputFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String doctorId;
@override@JsonKey(name: 'clinic_id') final  String clinicId;
@override@JsonKey(name: 'slot_type') final  String slotType;
@override@JsonKey(name: 'slot_duration') final  int slotDuration;
@override final  String? date;
// For single date slots
 final  List<int> _weekdays;
// For single date slots
@override@JsonKey() List<int> get weekdays {
  if (_weekdays is EqualUnmodifiableListView) return _weekdays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekdays);
}

// For recurring slots: [0-6] where 0=Sunday, 1=Monday, ..., 6=Saturday
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override final  String? notes;
 final  List<SessionDefinition> _sessions;
@override List<SessionDefinition> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of CreateSessionSlotsInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionSlotsInputCopyWith<_CreateSessionSlotsInput> get copyWith => __$CreateSessionSlotsInputCopyWithImpl<_CreateSessionSlotsInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSessionSlotsInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSessionSlotsInput&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.slotDuration, slotDuration) || other.slotDuration == slotDuration)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._weekdays, _weekdays)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,slotType,slotDuration,date,const DeepCollectionEquality().hash(_weekdays),isAvailable,notes,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'CreateSessionSlotsInput(doctorId: $doctorId, clinicId: $clinicId, slotType: $slotType, slotDuration: $slotDuration, date: $date, weekdays: $weekdays, isAvailable: $isAvailable, notes: $notes, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionSlotsInputCopyWith<$Res> implements $CreateSessionSlotsInputCopyWith<$Res> {
  factory _$CreateSessionSlotsInputCopyWith(_CreateSessionSlotsInput value, $Res Function(_CreateSessionSlotsInput) _then) = __$CreateSessionSlotsInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String doctorId,@JsonKey(name: 'clinic_id') String clinicId,@JsonKey(name: 'slot_type') String slotType,@JsonKey(name: 'slot_duration') int slotDuration, String? date, List<int> weekdays,@JsonKey(name: 'is_available') bool isAvailable, String? notes, List<SessionDefinition> sessions
});




}
/// @nodoc
class __$CreateSessionSlotsInputCopyWithImpl<$Res>
    implements _$CreateSessionSlotsInputCopyWith<$Res> {
  __$CreateSessionSlotsInputCopyWithImpl(this._self, this._then);

  final _CreateSessionSlotsInput _self;
  final $Res Function(_CreateSessionSlotsInput) _then;

/// Create a copy of CreateSessionSlotsInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = null,Object? clinicId = null,Object? slotType = null,Object? slotDuration = null,Object? date = freezed,Object? weekdays = null,Object? isAvailable = null,Object? notes = freezed,Object? sessions = null,}) {
  return _then(_CreateSessionSlotsInput(
doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,slotType: null == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String,slotDuration: null == slotDuration ? _self.slotDuration : slotDuration // ignore: cast_nullable_to_non_nullable
as int,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,weekdays: null == weekdays ? _self._weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as List<int>,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<SessionDefinition>,
  ));
}


}

/// @nodoc
mixin _$CreateSessionSlotsResponse {

 bool get success; String get message; DoctorSessionSlot? get data;// Single slot (for single date mode)
 List<DoctorSessionSlot> get dataList;// Multiple slots (for recurring mode)
@JsonKey(name: 'total_created') int get totalCreated;
/// Create a copy of CreateSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSessionSlotsResponseCopyWith<CreateSessionSlotsResponse> get copyWith => _$CreateSessionSlotsResponseCopyWithImpl<CreateSessionSlotsResponse>(this as CreateSessionSlotsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSessionSlotsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.dataList, dataList)&&(identical(other.totalCreated, totalCreated) || other.totalCreated == totalCreated));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data,const DeepCollectionEquality().hash(dataList),totalCreated);

@override
String toString() {
  return 'CreateSessionSlotsResponse(success: $success, message: $message, data: $data, dataList: $dataList, totalCreated: $totalCreated)';
}


}

/// @nodoc
abstract mixin class $CreateSessionSlotsResponseCopyWith<$Res>  {
  factory $CreateSessionSlotsResponseCopyWith(CreateSessionSlotsResponse value, $Res Function(CreateSessionSlotsResponse) _then) = _$CreateSessionSlotsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, DoctorSessionSlot? data, List<DoctorSessionSlot> dataList,@JsonKey(name: 'total_created') int totalCreated
});


$DoctorSessionSlotCopyWith<$Res>? get data;

}
/// @nodoc
class _$CreateSessionSlotsResponseCopyWithImpl<$Res>
    implements $CreateSessionSlotsResponseCopyWith<$Res> {
  _$CreateSessionSlotsResponseCopyWithImpl(this._self, this._then);

  final CreateSessionSlotsResponse _self;
  final $Res Function(CreateSessionSlotsResponse) _then;

/// Create a copy of CreateSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,Object? dataList = null,Object? totalCreated = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DoctorSessionSlot?,dataList: null == dataList ? _self.dataList : dataList // ignore: cast_nullable_to_non_nullable
as List<DoctorSessionSlot>,totalCreated: null == totalCreated ? _self.totalCreated : totalCreated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CreateSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorSessionSlotCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DoctorSessionSlotCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateSessionSlotsResponse].
extension CreateSessionSlotsResponsePatterns on CreateSessionSlotsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSessionSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSessionSlotsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSessionSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateSessionSlotsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSessionSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSessionSlotsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  DoctorSessionSlot? data,  List<DoctorSessionSlot> dataList, @JsonKey(name: 'total_created')  int totalCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSessionSlotsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.dataList,_that.totalCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  DoctorSessionSlot? data,  List<DoctorSessionSlot> dataList, @JsonKey(name: 'total_created')  int totalCreated)  $default,) {final _that = this;
switch (_that) {
case _CreateSessionSlotsResponse():
return $default(_that.success,_that.message,_that.data,_that.dataList,_that.totalCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  DoctorSessionSlot? data,  List<DoctorSessionSlot> dataList, @JsonKey(name: 'total_created')  int totalCreated)?  $default,) {final _that = this;
switch (_that) {
case _CreateSessionSlotsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.dataList,_that.totalCreated);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSessionSlotsResponse implements CreateSessionSlotsResponse {
  const _CreateSessionSlotsResponse({required this.success, required this.message, this.data, final  List<DoctorSessionSlot> dataList = const [], @JsonKey(name: 'total_created') this.totalCreated = 0}): _dataList = dataList;
  

@override final  bool success;
@override final  String message;
@override final  DoctorSessionSlot? data;
// Single slot (for single date mode)
 final  List<DoctorSessionSlot> _dataList;
// Single slot (for single date mode)
@override@JsonKey() List<DoctorSessionSlot> get dataList {
  if (_dataList is EqualUnmodifiableListView) return _dataList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataList);
}

// Multiple slots (for recurring mode)
@override@JsonKey(name: 'total_created') final  int totalCreated;

/// Create a copy of CreateSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionSlotsResponseCopyWith<_CreateSessionSlotsResponse> get copyWith => __$CreateSessionSlotsResponseCopyWithImpl<_CreateSessionSlotsResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSessionSlotsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._dataList, _dataList)&&(identical(other.totalCreated, totalCreated) || other.totalCreated == totalCreated));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data,const DeepCollectionEquality().hash(_dataList),totalCreated);

@override
String toString() {
  return 'CreateSessionSlotsResponse(success: $success, message: $message, data: $data, dataList: $dataList, totalCreated: $totalCreated)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionSlotsResponseCopyWith<$Res> implements $CreateSessionSlotsResponseCopyWith<$Res> {
  factory _$CreateSessionSlotsResponseCopyWith(_CreateSessionSlotsResponse value, $Res Function(_CreateSessionSlotsResponse) _then) = __$CreateSessionSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, DoctorSessionSlot? data, List<DoctorSessionSlot> dataList,@JsonKey(name: 'total_created') int totalCreated
});


@override $DoctorSessionSlotCopyWith<$Res>? get data;

}
/// @nodoc
class __$CreateSessionSlotsResponseCopyWithImpl<$Res>
    implements _$CreateSessionSlotsResponseCopyWith<$Res> {
  __$CreateSessionSlotsResponseCopyWithImpl(this._self, this._then);

  final _CreateSessionSlotsResponse _self;
  final $Res Function(_CreateSessionSlotsResponse) _then;

/// Create a copy of CreateSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,Object? dataList = null,Object? totalCreated = null,}) {
  return _then(_CreateSessionSlotsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DoctorSessionSlot?,dataList: null == dataList ? _self._dataList : dataList // ignore: cast_nullable_to_non_nullable
as List<DoctorSessionSlot>,totalCreated: null == totalCreated ? _self.totalCreated : totalCreated // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CreateSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorSessionSlotCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DoctorSessionSlotCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ListSessionSlotsResponse {

@JsonKey(name: 'doctor_id') String? get doctorId;@JsonKey(name: 'clinic_id') String? get clinicId; String? get date;@JsonKey(name: 'slot_type') String? get slotType; int get total; List<DoctorSessionSlot> get slots;@JsonKey(name: 'walkin_available') bool get walkinAvailable;@JsonKey(name: 'walkin_reason') String? get walkinReason;
/// Create a copy of ListSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListSessionSlotsResponseCopyWith<ListSessionSlotsResponse> get copyWith => _$ListSessionSlotsResponseCopyWithImpl<ListSessionSlotsResponse>(this as ListSessionSlotsResponse, _$identity);

  /// Serializes this ListSessionSlotsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListSessionSlotsResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.walkinAvailable, walkinAvailable) || other.walkinAvailable == walkinAvailable)&&(identical(other.walkinReason, walkinReason) || other.walkinReason == walkinReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,date,slotType,total,const DeepCollectionEquality().hash(slots),walkinAvailable,walkinReason);

@override
String toString() {
  return 'ListSessionSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, date: $date, slotType: $slotType, total: $total, slots: $slots, walkinAvailable: $walkinAvailable, walkinReason: $walkinReason)';
}


}

/// @nodoc
abstract mixin class $ListSessionSlotsResponseCopyWith<$Res>  {
  factory $ListSessionSlotsResponseCopyWith(ListSessionSlotsResponse value, $Res Function(ListSessionSlotsResponse) _then) = _$ListSessionSlotsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'clinic_id') String? clinicId, String? date,@JsonKey(name: 'slot_type') String? slotType, int total, List<DoctorSessionSlot> slots,@JsonKey(name: 'walkin_available') bool walkinAvailable,@JsonKey(name: 'walkin_reason') String? walkinReason
});




}
/// @nodoc
class _$ListSessionSlotsResponseCopyWithImpl<$Res>
    implements $ListSessionSlotsResponseCopyWith<$Res> {
  _$ListSessionSlotsResponseCopyWithImpl(this._self, this._then);

  final ListSessionSlotsResponse _self;
  final $Res Function(ListSessionSlotsResponse) _then;

/// Create a copy of ListSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doctorId = freezed,Object? clinicId = freezed,Object? date = freezed,Object? slotType = freezed,Object? total = null,Object? slots = null,Object? walkinAvailable = null,Object? walkinReason = freezed,}) {
  return _then(_self.copyWith(
doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorSessionSlot>,walkinAvailable: null == walkinAvailable ? _self.walkinAvailable : walkinAvailable // ignore: cast_nullable_to_non_nullable
as bool,walkinReason: freezed == walkinReason ? _self.walkinReason : walkinReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListSessionSlotsResponse].
extension ListSessionSlotsResponsePatterns on ListSessionSlotsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListSessionSlotsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListSessionSlotsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListSessionSlotsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListSessionSlotsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListSessionSlotsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListSessionSlotsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'slot_type')  String? slotType,  int total,  List<DoctorSessionSlot> slots, @JsonKey(name: 'walkin_available')  bool walkinAvailable, @JsonKey(name: 'walkin_reason')  String? walkinReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListSessionSlotsResponse() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.date,_that.slotType,_that.total,_that.slots,_that.walkinAvailable,_that.walkinReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'slot_type')  String? slotType,  int total,  List<DoctorSessionSlot> slots, @JsonKey(name: 'walkin_available')  bool walkinAvailable, @JsonKey(name: 'walkin_reason')  String? walkinReason)  $default,) {final _that = this;
switch (_that) {
case _ListSessionSlotsResponse():
return $default(_that.doctorId,_that.clinicId,_that.date,_that.slotType,_that.total,_that.slots,_that.walkinAvailable,_that.walkinReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doctor_id')  String? doctorId, @JsonKey(name: 'clinic_id')  String? clinicId,  String? date, @JsonKey(name: 'slot_type')  String? slotType,  int total,  List<DoctorSessionSlot> slots, @JsonKey(name: 'walkin_available')  bool walkinAvailable, @JsonKey(name: 'walkin_reason')  String? walkinReason)?  $default,) {final _that = this;
switch (_that) {
case _ListSessionSlotsResponse() when $default != null:
return $default(_that.doctorId,_that.clinicId,_that.date,_that.slotType,_that.total,_that.slots,_that.walkinAvailable,_that.walkinReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListSessionSlotsResponse implements ListSessionSlotsResponse {
  const _ListSessionSlotsResponse({@JsonKey(name: 'doctor_id') this.doctorId, @JsonKey(name: 'clinic_id') this.clinicId, this.date, @JsonKey(name: 'slot_type') this.slotType, this.total = 0, final  List<DoctorSessionSlot> slots = const [], @JsonKey(name: 'walkin_available') this.walkinAvailable = false, @JsonKey(name: 'walkin_reason') this.walkinReason}): _slots = slots;
  factory _ListSessionSlotsResponse.fromJson(Map<String, dynamic> json) => _$ListSessionSlotsResponseFromJson(json);

@override@JsonKey(name: 'doctor_id') final  String? doctorId;
@override@JsonKey(name: 'clinic_id') final  String? clinicId;
@override final  String? date;
@override@JsonKey(name: 'slot_type') final  String? slotType;
@override@JsonKey() final  int total;
 final  List<DoctorSessionSlot> _slots;
@override@JsonKey() List<DoctorSessionSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override@JsonKey(name: 'walkin_available') final  bool walkinAvailable;
@override@JsonKey(name: 'walkin_reason') final  String? walkinReason;

/// Create a copy of ListSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListSessionSlotsResponseCopyWith<_ListSessionSlotsResponse> get copyWith => __$ListSessionSlotsResponseCopyWithImpl<_ListSessionSlotsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListSessionSlotsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListSessionSlotsResponse&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.date, date) || other.date == date)&&(identical(other.slotType, slotType) || other.slotType == slotType)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.walkinAvailable, walkinAvailable) || other.walkinAvailable == walkinAvailable)&&(identical(other.walkinReason, walkinReason) || other.walkinReason == walkinReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doctorId,clinicId,date,slotType,total,const DeepCollectionEquality().hash(_slots),walkinAvailable,walkinReason);

@override
String toString() {
  return 'ListSessionSlotsResponse(doctorId: $doctorId, clinicId: $clinicId, date: $date, slotType: $slotType, total: $total, slots: $slots, walkinAvailable: $walkinAvailable, walkinReason: $walkinReason)';
}


}

/// @nodoc
abstract mixin class _$ListSessionSlotsResponseCopyWith<$Res> implements $ListSessionSlotsResponseCopyWith<$Res> {
  factory _$ListSessionSlotsResponseCopyWith(_ListSessionSlotsResponse value, $Res Function(_ListSessionSlotsResponse) _then) = __$ListSessionSlotsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doctor_id') String? doctorId,@JsonKey(name: 'clinic_id') String? clinicId, String? date,@JsonKey(name: 'slot_type') String? slotType, int total, List<DoctorSessionSlot> slots,@JsonKey(name: 'walkin_available') bool walkinAvailable,@JsonKey(name: 'walkin_reason') String? walkinReason
});




}
/// @nodoc
class __$ListSessionSlotsResponseCopyWithImpl<$Res>
    implements _$ListSessionSlotsResponseCopyWith<$Res> {
  __$ListSessionSlotsResponseCopyWithImpl(this._self, this._then);

  final _ListSessionSlotsResponse _self;
  final $Res Function(_ListSessionSlotsResponse) _then;

/// Create a copy of ListSessionSlotsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doctorId = freezed,Object? clinicId = freezed,Object? date = freezed,Object? slotType = freezed,Object? total = null,Object? slots = null,Object? walkinAvailable = null,Object? walkinReason = freezed,}) {
  return _then(_ListSessionSlotsResponse(
doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,clinicId: freezed == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,slotType: freezed == slotType ? _self.slotType : slotType // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<DoctorSessionSlot>,walkinAvailable: null == walkinAvailable ? _self.walkinAvailable : walkinAvailable // ignore: cast_nullable_to_non_nullable
as bool,walkinReason: freezed == walkinReason ? _self.walkinReason : walkinReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
