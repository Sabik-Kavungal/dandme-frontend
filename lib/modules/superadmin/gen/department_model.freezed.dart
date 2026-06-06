// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/department_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentModel {

 String get id;@JsonKey(name: "clinic_id") String get clinicId;@JsonKey(name: "clinic_name") String? get clinicName; String get name; String? get description;@JsonKey(name: "is_active") bool get isActive;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;
/// Create a copy of DepartmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentModelCopyWith<DepartmentModel> get copyWith => _$DepartmentModelCopyWithImpl<DepartmentModel>(this as DepartmentModel, _$identity);

  /// Serializes this DepartmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicId,clinicName,name,description,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DepartmentModel(id: $id, clinicId: $clinicId, clinicName: $clinicName, name: $name, description: $description, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DepartmentModelCopyWith<$Res>  {
  factory $DepartmentModelCopyWith(DepartmentModel value, $Res Function(DepartmentModel) _then) = _$DepartmentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "clinic_id") String clinicId,@JsonKey(name: "clinic_name") String? clinicName, String name, String? description,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class _$DepartmentModelCopyWithImpl<$Res>
    implements $DepartmentModelCopyWith<$Res> {
  _$DepartmentModelCopyWithImpl(this._self, this._then);

  final DepartmentModel _self;
  final $Res Function(DepartmentModel) _then;

/// Create a copy of DepartmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clinicId = null,Object? clinicName = freezed,Object? name = null,Object? description = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentModel].
extension DepartmentModelPatterns on DepartmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentModel value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "clinic_id")  String clinicId, @JsonKey(name: "clinic_name")  String? clinicName,  String name,  String? description, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentModel() when $default != null:
return $default(_that.id,_that.clinicId,_that.clinicName,_that.name,_that.description,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "clinic_id")  String clinicId, @JsonKey(name: "clinic_name")  String? clinicName,  String name,  String? description, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DepartmentModel():
return $default(_that.id,_that.clinicId,_that.clinicName,_that.name,_that.description,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "clinic_id")  String clinicId, @JsonKey(name: "clinic_name")  String? clinicName,  String name,  String? description, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentModel() when $default != null:
return $default(_that.id,_that.clinicId,_that.clinicName,_that.name,_that.description,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentModel implements DepartmentModel {
  const _DepartmentModel({required this.id, @JsonKey(name: "clinic_id") required this.clinicId, @JsonKey(name: "clinic_name") this.clinicName, required this.name, this.description, @JsonKey(name: "is_active") this.isActive = true, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _DepartmentModel.fromJson(Map<String, dynamic> json) => _$DepartmentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: "clinic_id") final  String clinicId;
@override@JsonKey(name: "clinic_name") final  String? clinicName;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: "is_active") final  bool isActive;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;

/// Create a copy of DepartmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentModelCopyWith<_DepartmentModel> get copyWith => __$DepartmentModelCopyWithImpl<_DepartmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clinicId,clinicName,name,description,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DepartmentModel(id: $id, clinicId: $clinicId, clinicName: $clinicName, name: $name, description: $description, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DepartmentModelCopyWith<$Res> implements $DepartmentModelCopyWith<$Res> {
  factory _$DepartmentModelCopyWith(_DepartmentModel value, $Res Function(_DepartmentModel) _then) = __$DepartmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "clinic_id") String clinicId,@JsonKey(name: "clinic_name") String? clinicName, String name, String? description,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class __$DepartmentModelCopyWithImpl<$Res>
    implements _$DepartmentModelCopyWith<$Res> {
  __$DepartmentModelCopyWithImpl(this._self, this._then);

  final _DepartmentModel _self;
  final $Res Function(_DepartmentModel) _then;

/// Create a copy of DepartmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clinicId = null,Object? clinicName = freezed,Object? name = null,Object? description = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DepartmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateDepartmentInput {

@JsonKey(name: "clinic_id") String get clinicId; String get name; String? get description;
/// Create a copy of CreateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDepartmentInputCopyWith<CreateDepartmentInput> get copyWith => _$CreateDepartmentInputCopyWithImpl<CreateDepartmentInput>(this as CreateDepartmentInput, _$identity);

  /// Serializes this CreateDepartmentInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDepartmentInput&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,name,description);

@override
String toString() {
  return 'CreateDepartmentInput(clinicId: $clinicId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateDepartmentInputCopyWith<$Res>  {
  factory $CreateDepartmentInputCopyWith(CreateDepartmentInput value, $Res Function(CreateDepartmentInput) _then) = _$CreateDepartmentInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "clinic_id") String clinicId, String name, String? description
});




}
/// @nodoc
class _$CreateDepartmentInputCopyWithImpl<$Res>
    implements $CreateDepartmentInputCopyWith<$Res> {
  _$CreateDepartmentInputCopyWithImpl(this._self, this._then);

  final CreateDepartmentInput _self;
  final $Res Function(CreateDepartmentInput) _then;

/// Create a copy of CreateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clinicId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDepartmentInput].
extension CreateDepartmentInputPatterns on CreateDepartmentInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDepartmentInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDepartmentInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDepartmentInput value)  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDepartmentInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_id")  String clinicId,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDepartmentInput() when $default != null:
return $default(_that.clinicId,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "clinic_id")  String clinicId,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentInput():
return $default(_that.clinicId,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "clinic_id")  String clinicId,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentInput() when $default != null:
return $default(_that.clinicId,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDepartmentInput implements CreateDepartmentInput {
  const _CreateDepartmentInput({@JsonKey(name: "clinic_id") required this.clinicId, required this.name, this.description});
  factory _CreateDepartmentInput.fromJson(Map<String, dynamic> json) => _$CreateDepartmentInputFromJson(json);

@override@JsonKey(name: "clinic_id") final  String clinicId;
@override final  String name;
@override final  String? description;

/// Create a copy of CreateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDepartmentInputCopyWith<_CreateDepartmentInput> get copyWith => __$CreateDepartmentInputCopyWithImpl<_CreateDepartmentInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDepartmentInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDepartmentInput&&(identical(other.clinicId, clinicId) || other.clinicId == clinicId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clinicId,name,description);

@override
String toString() {
  return 'CreateDepartmentInput(clinicId: $clinicId, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateDepartmentInputCopyWith<$Res> implements $CreateDepartmentInputCopyWith<$Res> {
  factory _$CreateDepartmentInputCopyWith(_CreateDepartmentInput value, $Res Function(_CreateDepartmentInput) _then) = __$CreateDepartmentInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "clinic_id") String clinicId, String name, String? description
});




}
/// @nodoc
class __$CreateDepartmentInputCopyWithImpl<$Res>
    implements _$CreateDepartmentInputCopyWith<$Res> {
  __$CreateDepartmentInputCopyWithImpl(this._self, this._then);

  final _CreateDepartmentInput _self;
  final $Res Function(_CreateDepartmentInput) _then;

/// Create a copy of CreateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clinicId = null,Object? name = null,Object? description = freezed,}) {
  return _then(_CreateDepartmentInput(
clinicId: null == clinicId ? _self.clinicId : clinicId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateDepartmentInput {

 String? get name; String? get description;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of UpdateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDepartmentInputCopyWith<UpdateDepartmentInput> get copyWith => _$UpdateDepartmentInputCopyWithImpl<UpdateDepartmentInput>(this as UpdateDepartmentInput, _$identity);

  /// Serializes this UpdateDepartmentInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDepartmentInput&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,isActive);

@override
String toString() {
  return 'UpdateDepartmentInput(name: $name, description: $description, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $UpdateDepartmentInputCopyWith<$Res>  {
  factory $UpdateDepartmentInputCopyWith(UpdateDepartmentInput value, $Res Function(UpdateDepartmentInput) _then) = _$UpdateDepartmentInputCopyWithImpl;
@useResult
$Res call({
 String? name, String? description,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$UpdateDepartmentInputCopyWithImpl<$Res>
    implements $UpdateDepartmentInputCopyWith<$Res> {
  _$UpdateDepartmentInputCopyWithImpl(this._self, this._then);

  final UpdateDepartmentInput _self;
  final $Res Function(UpdateDepartmentInput) _then;

/// Create a copy of UpdateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? description = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateDepartmentInput].
extension UpdateDepartmentInputPatterns on UpdateDepartmentInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateDepartmentInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateDepartmentInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateDepartmentInput value)  $default,){
final _that = this;
switch (_that) {
case _UpdateDepartmentInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateDepartmentInput value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateDepartmentInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? description, @JsonKey(name: "is_active")  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateDepartmentInput() when $default != null:
return $default(_that.name,_that.description,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? description, @JsonKey(name: "is_active")  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _UpdateDepartmentInput():
return $default(_that.name,_that.description,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? description, @JsonKey(name: "is_active")  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _UpdateDepartmentInput() when $default != null:
return $default(_that.name,_that.description,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateDepartmentInput implements UpdateDepartmentInput {
  const _UpdateDepartmentInput({this.name, this.description, @JsonKey(name: "is_active") this.isActive});
  factory _UpdateDepartmentInput.fromJson(Map<String, dynamic> json) => _$UpdateDepartmentInputFromJson(json);

@override final  String? name;
@override final  String? description;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of UpdateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDepartmentInputCopyWith<_UpdateDepartmentInput> get copyWith => __$UpdateDepartmentInputCopyWithImpl<_UpdateDepartmentInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateDepartmentInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDepartmentInput&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,isActive);

@override
String toString() {
  return 'UpdateDepartmentInput(name: $name, description: $description, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UpdateDepartmentInputCopyWith<$Res> implements $UpdateDepartmentInputCopyWith<$Res> {
  factory _$UpdateDepartmentInputCopyWith(_UpdateDepartmentInput value, $Res Function(_UpdateDepartmentInput) _then) = __$UpdateDepartmentInputCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? description,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$UpdateDepartmentInputCopyWithImpl<$Res>
    implements _$UpdateDepartmentInputCopyWith<$Res> {
  __$UpdateDepartmentInputCopyWithImpl(this._self, this._then);

  final _UpdateDepartmentInput _self;
  final $Res Function(_UpdateDepartmentInput) _then;

/// Create a copy of UpdateDepartmentInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? description = freezed,Object? isActive = freezed,}) {
  return _then(_UpdateDepartmentInput(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$DoctorInDepartment {

 String get id;@JsonKey(name: "user_id") String get userId;@JsonKey(name: "doctor_code") String get doctorCode; String get specialization;@JsonKey(name: "license_number") String get licenseNumber;@JsonKey(name: "is_main_doctor") bool get isMainDoctor;@JsonKey(name: "is_active") bool get isActive;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName; String get email; String? get phone;@JsonKey(name: "department_name") String? get departmentName;@JsonKey(name: "clinic_name") String? get clinicName;
/// Create a copy of DoctorInDepartment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorInDepartmentCopyWith<DoctorInDepartment> get copyWith => _$DoctorInDepartmentCopyWithImpl<DoctorInDepartment>(this as DoctorInDepartment, _$identity);

  /// Serializes this DoctorInDepartment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorInDepartment&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isMainDoctor, isMainDoctor) || other.isMainDoctor == isMainDoctor)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,doctorCode,specialization,licenseNumber,isMainDoctor,isActive,createdAt,firstName,lastName,email,phone,departmentName,clinicName);

@override
String toString() {
  return 'DoctorInDepartment(id: $id, userId: $userId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, isMainDoctor: $isMainDoctor, isActive: $isActive, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, departmentName: $departmentName, clinicName: $clinicName)';
}


}

/// @nodoc
abstract mixin class $DoctorInDepartmentCopyWith<$Res>  {
  factory $DoctorInDepartmentCopyWith(DoctorInDepartment value, $Res Function(DoctorInDepartment) _then) = _$DoctorInDepartmentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "doctor_code") String doctorCode, String specialization,@JsonKey(name: "license_number") String licenseNumber,@JsonKey(name: "is_main_doctor") bool isMainDoctor,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String email, String? phone,@JsonKey(name: "department_name") String? departmentName,@JsonKey(name: "clinic_name") String? clinicName
});




}
/// @nodoc
class _$DoctorInDepartmentCopyWithImpl<$Res>
    implements $DoctorInDepartmentCopyWith<$Res> {
  _$DoctorInDepartmentCopyWithImpl(this._self, this._then);

  final DoctorInDepartment _self;
  final $Res Function(DoctorInDepartment) _then;

/// Create a copy of DoctorInDepartment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? doctorCode = null,Object? specialization = null,Object? licenseNumber = null,Object? isMainDoctor = null,Object? isActive = null,Object? createdAt = freezed,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = freezed,Object? departmentName = freezed,Object? clinicName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,isMainDoctor: null == isMainDoctor ? _self.isMainDoctor : isMainDoctor // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorInDepartment].
extension DoctorInDepartmentPatterns on DoctorInDepartment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorInDepartment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorInDepartment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorInDepartment value)  $default,){
final _that = this;
switch (_that) {
case _DoctorInDepartment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorInDepartment value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorInDepartment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "doctor_code")  String doctorCode,  String specialization, @JsonKey(name: "license_number")  String licenseNumber, @JsonKey(name: "is_main_doctor")  bool isMainDoctor, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String email,  String? phone, @JsonKey(name: "department_name")  String? departmentName, @JsonKey(name: "clinic_name")  String? clinicName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorInDepartment() when $default != null:
return $default(_that.id,_that.userId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.isMainDoctor,_that.isActive,_that.createdAt,_that.firstName,_that.lastName,_that.email,_that.phone,_that.departmentName,_that.clinicName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "doctor_code")  String doctorCode,  String specialization, @JsonKey(name: "license_number")  String licenseNumber, @JsonKey(name: "is_main_doctor")  bool isMainDoctor, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String email,  String? phone, @JsonKey(name: "department_name")  String? departmentName, @JsonKey(name: "clinic_name")  String? clinicName)  $default,) {final _that = this;
switch (_that) {
case _DoctorInDepartment():
return $default(_that.id,_that.userId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.isMainDoctor,_that.isActive,_that.createdAt,_that.firstName,_that.lastName,_that.email,_that.phone,_that.departmentName,_that.clinicName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "user_id")  String userId, @JsonKey(name: "doctor_code")  String doctorCode,  String specialization, @JsonKey(name: "license_number")  String licenseNumber, @JsonKey(name: "is_main_doctor")  bool isMainDoctor, @JsonKey(name: "is_active")  bool isActive, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName,  String email,  String? phone, @JsonKey(name: "department_name")  String? departmentName, @JsonKey(name: "clinic_name")  String? clinicName)?  $default,) {final _that = this;
switch (_that) {
case _DoctorInDepartment() when $default != null:
return $default(_that.id,_that.userId,_that.doctorCode,_that.specialization,_that.licenseNumber,_that.isMainDoctor,_that.isActive,_that.createdAt,_that.firstName,_that.lastName,_that.email,_that.phone,_that.departmentName,_that.clinicName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorInDepartment implements DoctorInDepartment {
  const _DoctorInDepartment({required this.id, @JsonKey(name: "user_id") required this.userId, @JsonKey(name: "doctor_code") required this.doctorCode, required this.specialization, @JsonKey(name: "license_number") required this.licenseNumber, @JsonKey(name: "is_main_doctor") this.isMainDoctor = false, @JsonKey(name: "is_active") this.isActive = true, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, required this.email, this.phone, @JsonKey(name: "department_name") this.departmentName, @JsonKey(name: "clinic_name") this.clinicName});
  factory _DoctorInDepartment.fromJson(Map<String, dynamic> json) => _$DoctorInDepartmentFromJson(json);

@override final  String id;
@override@JsonKey(name: "user_id") final  String userId;
@override@JsonKey(name: "doctor_code") final  String doctorCode;
@override final  String specialization;
@override@JsonKey(name: "license_number") final  String licenseNumber;
@override@JsonKey(name: "is_main_doctor") final  bool isMainDoctor;
@override@JsonKey(name: "is_active") final  bool isActive;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override final  String email;
@override final  String? phone;
@override@JsonKey(name: "department_name") final  String? departmentName;
@override@JsonKey(name: "clinic_name") final  String? clinicName;

/// Create a copy of DoctorInDepartment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorInDepartmentCopyWith<_DoctorInDepartment> get copyWith => __$DoctorInDepartmentCopyWithImpl<_DoctorInDepartment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorInDepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorInDepartment&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.doctorCode, doctorCode) || other.doctorCode == doctorCode)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isMainDoctor, isMainDoctor) || other.isMainDoctor == isMainDoctor)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.departmentName, departmentName) || other.departmentName == departmentName)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,doctorCode,specialization,licenseNumber,isMainDoctor,isActive,createdAt,firstName,lastName,email,phone,departmentName,clinicName);

@override
String toString() {
  return 'DoctorInDepartment(id: $id, userId: $userId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, isMainDoctor: $isMainDoctor, isActive: $isActive, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, departmentName: $departmentName, clinicName: $clinicName)';
}


}

/// @nodoc
abstract mixin class _$DoctorInDepartmentCopyWith<$Res> implements $DoctorInDepartmentCopyWith<$Res> {
  factory _$DoctorInDepartmentCopyWith(_DoctorInDepartment value, $Res Function(_DoctorInDepartment) _then) = __$DoctorInDepartmentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "user_id") String userId,@JsonKey(name: "doctor_code") String doctorCode, String specialization,@JsonKey(name: "license_number") String licenseNumber,@JsonKey(name: "is_main_doctor") bool isMainDoctor,@JsonKey(name: "is_active") bool isActive,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName, String email, String? phone,@JsonKey(name: "department_name") String? departmentName,@JsonKey(name: "clinic_name") String? clinicName
});




}
/// @nodoc
class __$DoctorInDepartmentCopyWithImpl<$Res>
    implements _$DoctorInDepartmentCopyWith<$Res> {
  __$DoctorInDepartmentCopyWithImpl(this._self, this._then);

  final _DoctorInDepartment _self;
  final $Res Function(_DoctorInDepartment) _then;

/// Create a copy of DoctorInDepartment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? doctorCode = null,Object? specialization = null,Object? licenseNumber = null,Object? isMainDoctor = null,Object? isActive = null,Object? createdAt = freezed,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = freezed,Object? departmentName = freezed,Object? clinicName = freezed,}) {
  return _then(_DoctorInDepartment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,doctorCode: null == doctorCode ? _self.doctorCode : doctorCode // ignore: cast_nullable_to_non_nullable
as String,specialization: null == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,isMainDoctor: null == isMainDoctor ? _self.isMainDoctor : isMainDoctor // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,departmentName: freezed == departmentName ? _self.departmentName : departmentName // ignore: cast_nullable_to_non_nullable
as String?,clinicName: freezed == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DepartmentListResponse {

 List<DepartmentModel> get departments;@JsonKey(name: "total_count") int get totalCount;
/// Create a copy of DepartmentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentListResponseCopyWith<DepartmentListResponse> get copyWith => _$DepartmentListResponseCopyWithImpl<DepartmentListResponse>(this as DepartmentListResponse, _$identity);

  /// Serializes this DepartmentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentListResponse&&const DeepCollectionEquality().equals(other.departments, departments)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(departments),totalCount);

@override
String toString() {
  return 'DepartmentListResponse(departments: $departments, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $DepartmentListResponseCopyWith<$Res>  {
  factory $DepartmentListResponseCopyWith(DepartmentListResponse value, $Res Function(DepartmentListResponse) _then) = _$DepartmentListResponseCopyWithImpl;
@useResult
$Res call({
 List<DepartmentModel> departments,@JsonKey(name: "total_count") int totalCount
});




}
/// @nodoc
class _$DepartmentListResponseCopyWithImpl<$Res>
    implements $DepartmentListResponseCopyWith<$Res> {
  _$DepartmentListResponseCopyWithImpl(this._self, this._then);

  final DepartmentListResponse _self;
  final $Res Function(DepartmentListResponse) _then;

/// Create a copy of DepartmentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departments = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<DepartmentModel>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentListResponse].
extension DepartmentListResponsePatterns on DepartmentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DepartmentModel> departments, @JsonKey(name: "total_count")  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentListResponse() when $default != null:
return $default(_that.departments,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DepartmentModel> departments, @JsonKey(name: "total_count")  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _DepartmentListResponse():
return $default(_that.departments,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DepartmentModel> departments, @JsonKey(name: "total_count")  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentListResponse() when $default != null:
return $default(_that.departments,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentListResponse implements DepartmentListResponse {
  const _DepartmentListResponse({required final  List<DepartmentModel> departments, @JsonKey(name: "total_count") required this.totalCount}): _departments = departments;
  factory _DepartmentListResponse.fromJson(Map<String, dynamic> json) => _$DepartmentListResponseFromJson(json);

 final  List<DepartmentModel> _departments;
@override List<DepartmentModel> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}

@override@JsonKey(name: "total_count") final  int totalCount;

/// Create a copy of DepartmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentListResponseCopyWith<_DepartmentListResponse> get copyWith => __$DepartmentListResponseCopyWithImpl<_DepartmentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentListResponse&&const DeepCollectionEquality().equals(other._departments, _departments)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_departments),totalCount);

@override
String toString() {
  return 'DepartmentListResponse(departments: $departments, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$DepartmentListResponseCopyWith<$Res> implements $DepartmentListResponseCopyWith<$Res> {
  factory _$DepartmentListResponseCopyWith(_DepartmentListResponse value, $Res Function(_DepartmentListResponse) _then) = __$DepartmentListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<DepartmentModel> departments,@JsonKey(name: "total_count") int totalCount
});




}
/// @nodoc
class __$DepartmentListResponseCopyWithImpl<$Res>
    implements _$DepartmentListResponseCopyWith<$Res> {
  __$DepartmentListResponseCopyWithImpl(this._self, this._then);

  final _DepartmentListResponse _self;
  final $Res Function(_DepartmentListResponse) _then;

/// Create a copy of DepartmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departments = null,Object? totalCount = null,}) {
  return _then(_DepartmentListResponse(
departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<DepartmentModel>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DoctorsByDepartmentResponse {

@JsonKey(name: "department_id") String get departmentId; List<DoctorInDepartment> get doctors;@JsonKey(name: "total_count") int get totalCount;
/// Create a copy of DoctorsByDepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorsByDepartmentResponseCopyWith<DoctorsByDepartmentResponse> get copyWith => _$DoctorsByDepartmentResponseCopyWithImpl<DoctorsByDepartmentResponse>(this as DoctorsByDepartmentResponse, _$identity);

  /// Serializes this DoctorsByDepartmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsByDepartmentResponse&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&const DeepCollectionEquality().equals(other.doctors, doctors)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departmentId,const DeepCollectionEquality().hash(doctors),totalCount);

@override
String toString() {
  return 'DoctorsByDepartmentResponse(departmentId: $departmentId, doctors: $doctors, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $DoctorsByDepartmentResponseCopyWith<$Res>  {
  factory $DoctorsByDepartmentResponseCopyWith(DoctorsByDepartmentResponse value, $Res Function(DoctorsByDepartmentResponse) _then) = _$DoctorsByDepartmentResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "department_id") String departmentId, List<DoctorInDepartment> doctors,@JsonKey(name: "total_count") int totalCount
});




}
/// @nodoc
class _$DoctorsByDepartmentResponseCopyWithImpl<$Res>
    implements $DoctorsByDepartmentResponseCopyWith<$Res> {
  _$DoctorsByDepartmentResponseCopyWithImpl(this._self, this._then);

  final DoctorsByDepartmentResponse _self;
  final $Res Function(DoctorsByDepartmentResponse) _then;

/// Create a copy of DoctorsByDepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departmentId = null,Object? doctors = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<DoctorInDepartment>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorsByDepartmentResponse].
extension DoctorsByDepartmentResponsePatterns on DoctorsByDepartmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorsByDepartmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorsByDepartmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorsByDepartmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _DoctorsByDepartmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorsByDepartmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorsByDepartmentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "department_id")  String departmentId,  List<DoctorInDepartment> doctors, @JsonKey(name: "total_count")  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorsByDepartmentResponse() when $default != null:
return $default(_that.departmentId,_that.doctors,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "department_id")  String departmentId,  List<DoctorInDepartment> doctors, @JsonKey(name: "total_count")  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _DoctorsByDepartmentResponse():
return $default(_that.departmentId,_that.doctors,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "department_id")  String departmentId,  List<DoctorInDepartment> doctors, @JsonKey(name: "total_count")  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _DoctorsByDepartmentResponse() when $default != null:
return $default(_that.departmentId,_that.doctors,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorsByDepartmentResponse implements DoctorsByDepartmentResponse {
  const _DoctorsByDepartmentResponse({@JsonKey(name: "department_id") required this.departmentId, required final  List<DoctorInDepartment> doctors, @JsonKey(name: "total_count") required this.totalCount}): _doctors = doctors;
  factory _DoctorsByDepartmentResponse.fromJson(Map<String, dynamic> json) => _$DoctorsByDepartmentResponseFromJson(json);

@override@JsonKey(name: "department_id") final  String departmentId;
 final  List<DoctorInDepartment> _doctors;
@override List<DoctorInDepartment> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}

@override@JsonKey(name: "total_count") final  int totalCount;

/// Create a copy of DoctorsByDepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorsByDepartmentResponseCopyWith<_DoctorsByDepartmentResponse> get copyWith => __$DoctorsByDepartmentResponseCopyWithImpl<_DoctorsByDepartmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorsByDepartmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorsByDepartmentResponse&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&const DeepCollectionEquality().equals(other._doctors, _doctors)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departmentId,const DeepCollectionEquality().hash(_doctors),totalCount);

@override
String toString() {
  return 'DoctorsByDepartmentResponse(departmentId: $departmentId, doctors: $doctors, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$DoctorsByDepartmentResponseCopyWith<$Res> implements $DoctorsByDepartmentResponseCopyWith<$Res> {
  factory _$DoctorsByDepartmentResponseCopyWith(_DoctorsByDepartmentResponse value, $Res Function(_DoctorsByDepartmentResponse) _then) = __$DoctorsByDepartmentResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "department_id") String departmentId, List<DoctorInDepartment> doctors,@JsonKey(name: "total_count") int totalCount
});




}
/// @nodoc
class __$DoctorsByDepartmentResponseCopyWithImpl<$Res>
    implements _$DoctorsByDepartmentResponseCopyWith<$Res> {
  __$DoctorsByDepartmentResponseCopyWithImpl(this._self, this._then);

  final _DoctorsByDepartmentResponse _self;
  final $Res Function(_DoctorsByDepartmentResponse) _then;

/// Create a copy of DoctorsByDepartmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departmentId = null,Object? doctors = null,Object? totalCount = null,}) {
  return _then(_DoctorsByDepartmentResponse(
departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<DoctorInDepartment>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
