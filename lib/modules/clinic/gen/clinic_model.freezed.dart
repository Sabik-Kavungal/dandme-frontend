// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/clinic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClinicModel {

 String? get id;@JsonKey(name: 'organization_id') String get organizationId;@JsonKey(name: 'clinic_code') String? get clinicCode; String get name;@JsonKey(name: 'clinic_type') String? get clinicType; String? get email; String? get phone; String? get address;@JsonKey(name: 'license_number') String? get licenseNumber;@JsonKey(name: 'is_active') bool? get isActive;@JsonKey(name: 'created_at') String? get createdAt;// Admin details - these are optional for display, required for creation
@JsonKey(name: 'admin_first_name') String? get adminFirstName;@JsonKey(name: 'admin_last_name') String? get adminLastName;@JsonKey(name: 'admin_email') String? get adminEmail;@JsonKey(name: 'admin_username') String? get adminUsername;@JsonKey(name: 'admin_phone') String? get adminPhone;@JsonKey(name: 'admin_password') String? get adminPassword; String? get logo;
/// Create a copy of ClinicModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicModelCopyWith<ClinicModel> get copyWith => _$ClinicModelCopyWithImpl<ClinicModel>(this as ClinicModel, _$identity);

  /// Serializes this ClinicModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicType, clinicType) || other.clinicType == clinicType)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.adminFirstName, adminFirstName) || other.adminFirstName == adminFirstName)&&(identical(other.adminLastName, adminLastName) || other.adminLastName == adminLastName)&&(identical(other.adminEmail, adminEmail) || other.adminEmail == adminEmail)&&(identical(other.adminUsername, adminUsername) || other.adminUsername == adminUsername)&&(identical(other.adminPhone, adminPhone) || other.adminPhone == adminPhone)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organizationId,clinicCode,name,clinicType,email,phone,address,licenseNumber,isActive,createdAt,adminFirstName,adminLastName,adminEmail,adminUsername,adminPhone,adminPassword,logo);

@override
String toString() {
  return 'ClinicModel(id: $id, organizationId: $organizationId, clinicCode: $clinicCode, name: $name, clinicType: $clinicType, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, isActive: $isActive, createdAt: $createdAt, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword, logo: $logo)';
}


}

/// @nodoc
abstract mixin class $ClinicModelCopyWith<$Res>  {
  factory $ClinicModelCopyWith(ClinicModel value, $Res Function(ClinicModel) _then) = _$ClinicModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'organization_id') String organizationId,@JsonKey(name: 'clinic_code') String? clinicCode, String name,@JsonKey(name: 'clinic_type') String? clinicType, String? email, String? phone, String? address,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'admin_first_name') String? adminFirstName,@JsonKey(name: 'admin_last_name') String? adminLastName,@JsonKey(name: 'admin_email') String? adminEmail,@JsonKey(name: 'admin_username') String? adminUsername,@JsonKey(name: 'admin_phone') String? adminPhone,@JsonKey(name: 'admin_password') String? adminPassword, String? logo
});




}
/// @nodoc
class _$ClinicModelCopyWithImpl<$Res>
    implements $ClinicModelCopyWith<$Res> {
  _$ClinicModelCopyWithImpl(this._self, this._then);

  final ClinicModel _self;
  final $Res Function(ClinicModel) _then;

/// Create a copy of ClinicModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? organizationId = null,Object? clinicCode = freezed,Object? name = null,Object? clinicType = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? licenseNumber = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? adminFirstName = freezed,Object? adminLastName = freezed,Object? adminEmail = freezed,Object? adminUsername = freezed,Object? adminPhone = freezed,Object? adminPassword = freezed,Object? logo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,clinicCode: freezed == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicType: freezed == clinicType ? _self.clinicType : clinicType // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,adminFirstName: freezed == adminFirstName ? _self.adminFirstName : adminFirstName // ignore: cast_nullable_to_non_nullable
as String?,adminLastName: freezed == adminLastName ? _self.adminLastName : adminLastName // ignore: cast_nullable_to_non_nullable
as String?,adminEmail: freezed == adminEmail ? _self.adminEmail : adminEmail // ignore: cast_nullable_to_non_nullable
as String?,adminUsername: freezed == adminUsername ? _self.adminUsername : adminUsername // ignore: cast_nullable_to_non_nullable
as String?,adminPhone: freezed == adminPhone ? _self.adminPhone : adminPhone // ignore: cast_nullable_to_non_nullable
as String?,adminPassword: freezed == adminPassword ? _self.adminPassword : adminPassword // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicModel].
extension ClinicModelPatterns on ClinicModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicModel value)  $default,){
final _that = this;
switch (_that) {
case _ClinicModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'organization_id')  String organizationId, @JsonKey(name: 'clinic_code')  String? clinicCode,  String name, @JsonKey(name: 'clinic_type')  String? clinicType,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'admin_first_name')  String? adminFirstName, @JsonKey(name: 'admin_last_name')  String? adminLastName, @JsonKey(name: 'admin_email')  String? adminEmail, @JsonKey(name: 'admin_username')  String? adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String? adminPassword,  String? logo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicModel() when $default != null:
return $default(_that.id,_that.organizationId,_that.clinicCode,_that.name,_that.clinicType,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.isActive,_that.createdAt,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword,_that.logo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'organization_id')  String organizationId, @JsonKey(name: 'clinic_code')  String? clinicCode,  String name, @JsonKey(name: 'clinic_type')  String? clinicType,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'admin_first_name')  String? adminFirstName, @JsonKey(name: 'admin_last_name')  String? adminLastName, @JsonKey(name: 'admin_email')  String? adminEmail, @JsonKey(name: 'admin_username')  String? adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String? adminPassword,  String? logo)  $default,) {final _that = this;
switch (_that) {
case _ClinicModel():
return $default(_that.id,_that.organizationId,_that.clinicCode,_that.name,_that.clinicType,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.isActive,_that.createdAt,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword,_that.logo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'organization_id')  String organizationId, @JsonKey(name: 'clinic_code')  String? clinicCode,  String name, @JsonKey(name: 'clinic_type')  String? clinicType,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'admin_first_name')  String? adminFirstName, @JsonKey(name: 'admin_last_name')  String? adminLastName, @JsonKey(name: 'admin_email')  String? adminEmail, @JsonKey(name: 'admin_username')  String? adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String? adminPassword,  String? logo)?  $default,) {final _that = this;
switch (_that) {
case _ClinicModel() when $default != null:
return $default(_that.id,_that.organizationId,_that.clinicCode,_that.name,_that.clinicType,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.isActive,_that.createdAt,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword,_that.logo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClinicModel implements ClinicModel {
  const _ClinicModel({this.id, @JsonKey(name: 'organization_id') required this.organizationId, @JsonKey(name: 'clinic_code') this.clinicCode, required this.name, @JsonKey(name: 'clinic_type') this.clinicType, this.email, this.phone, this.address, @JsonKey(name: 'license_number') this.licenseNumber, @JsonKey(name: 'is_active') this.isActive, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'admin_first_name') this.adminFirstName, @JsonKey(name: 'admin_last_name') this.adminLastName, @JsonKey(name: 'admin_email') this.adminEmail, @JsonKey(name: 'admin_username') this.adminUsername, @JsonKey(name: 'admin_phone') this.adminPhone, @JsonKey(name: 'admin_password') this.adminPassword, this.logo});
  factory _ClinicModel.fromJson(Map<String, dynamic> json) => _$ClinicModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'organization_id') final  String organizationId;
@override@JsonKey(name: 'clinic_code') final  String? clinicCode;
@override final  String name;
@override@JsonKey(name: 'clinic_type') final  String? clinicType;
@override final  String? email;
@override final  String? phone;
@override final  String? address;
@override@JsonKey(name: 'license_number') final  String? licenseNumber;
@override@JsonKey(name: 'is_active') final  bool? isActive;
@override@JsonKey(name: 'created_at') final  String? createdAt;
// Admin details - these are optional for display, required for creation
@override@JsonKey(name: 'admin_first_name') final  String? adminFirstName;
@override@JsonKey(name: 'admin_last_name') final  String? adminLastName;
@override@JsonKey(name: 'admin_email') final  String? adminEmail;
@override@JsonKey(name: 'admin_username') final  String? adminUsername;
@override@JsonKey(name: 'admin_phone') final  String? adminPhone;
@override@JsonKey(name: 'admin_password') final  String? adminPassword;
@override final  String? logo;

/// Create a copy of ClinicModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicModelCopyWith<_ClinicModel> get copyWith => __$ClinicModelCopyWithImpl<_ClinicModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClinicModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicType, clinicType) || other.clinicType == clinicType)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.adminFirstName, adminFirstName) || other.adminFirstName == adminFirstName)&&(identical(other.adminLastName, adminLastName) || other.adminLastName == adminLastName)&&(identical(other.adminEmail, adminEmail) || other.adminEmail == adminEmail)&&(identical(other.adminUsername, adminUsername) || other.adminUsername == adminUsername)&&(identical(other.adminPhone, adminPhone) || other.adminPhone == adminPhone)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword)&&(identical(other.logo, logo) || other.logo == logo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organizationId,clinicCode,name,clinicType,email,phone,address,licenseNumber,isActive,createdAt,adminFirstName,adminLastName,adminEmail,adminUsername,adminPhone,adminPassword,logo);

@override
String toString() {
  return 'ClinicModel(id: $id, organizationId: $organizationId, clinicCode: $clinicCode, name: $name, clinicType: $clinicType, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, isActive: $isActive, createdAt: $createdAt, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword, logo: $logo)';
}


}

/// @nodoc
abstract mixin class _$ClinicModelCopyWith<$Res> implements $ClinicModelCopyWith<$Res> {
  factory _$ClinicModelCopyWith(_ClinicModel value, $Res Function(_ClinicModel) _then) = __$ClinicModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'organization_id') String organizationId,@JsonKey(name: 'clinic_code') String? clinicCode, String name,@JsonKey(name: 'clinic_type') String? clinicType, String? email, String? phone, String? address,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'admin_first_name') String? adminFirstName,@JsonKey(name: 'admin_last_name') String? adminLastName,@JsonKey(name: 'admin_email') String? adminEmail,@JsonKey(name: 'admin_username') String? adminUsername,@JsonKey(name: 'admin_phone') String? adminPhone,@JsonKey(name: 'admin_password') String? adminPassword, String? logo
});




}
/// @nodoc
class __$ClinicModelCopyWithImpl<$Res>
    implements _$ClinicModelCopyWith<$Res> {
  __$ClinicModelCopyWithImpl(this._self, this._then);

  final _ClinicModel _self;
  final $Res Function(_ClinicModel) _then;

/// Create a copy of ClinicModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? organizationId = null,Object? clinicCode = freezed,Object? name = null,Object? clinicType = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? licenseNumber = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? adminFirstName = freezed,Object? adminLastName = freezed,Object? adminEmail = freezed,Object? adminUsername = freezed,Object? adminPhone = freezed,Object? adminPassword = freezed,Object? logo = freezed,}) {
  return _then(_ClinicModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,clinicCode: freezed == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicType: freezed == clinicType ? _self.clinicType : clinicType // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,adminFirstName: freezed == adminFirstName ? _self.adminFirstName : adminFirstName // ignore: cast_nullable_to_non_nullable
as String?,adminLastName: freezed == adminLastName ? _self.adminLastName : adminLastName // ignore: cast_nullable_to_non_nullable
as String?,adminEmail: freezed == adminEmail ? _self.adminEmail : adminEmail // ignore: cast_nullable_to_non_nullable
as String?,adminUsername: freezed == adminUsername ? _self.adminUsername : adminUsername // ignore: cast_nullable_to_non_nullable
as String?,adminPhone: freezed == adminPhone ? _self.adminPhone : adminPhone // ignore: cast_nullable_to_non_nullable
as String?,adminPassword: freezed == adminPassword ? _self.adminPassword : adminPassword // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateClinicModel {

@JsonKey(name: 'organization_id') String get organizationId;@JsonKey(name: 'clinic_code') String? get clinicCode; String get name;@JsonKey(name: 'clinic_type') String? get clinicType; String? get email; String? get phone; String? get address;@JsonKey(name: 'license_number') String? get licenseNumber;// Admin details - required for creation
@JsonKey(name: 'admin_first_name') String get adminFirstName;@JsonKey(name: 'admin_last_name') String get adminLastName;@JsonKey(name: 'admin_email') String get adminEmail;@JsonKey(name: 'admin_username') String get adminUsername;@JsonKey(name: 'admin_phone') String? get adminPhone;@JsonKey(name: 'admin_password') String get adminPassword;
/// Create a copy of CreateClinicModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClinicModelCopyWith<CreateClinicModel> get copyWith => _$CreateClinicModelCopyWithImpl<CreateClinicModel>(this as CreateClinicModel, _$identity);

  /// Serializes this CreateClinicModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClinicModel&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicType, clinicType) || other.clinicType == clinicType)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.adminFirstName, adminFirstName) || other.adminFirstName == adminFirstName)&&(identical(other.adminLastName, adminLastName) || other.adminLastName == adminLastName)&&(identical(other.adminEmail, adminEmail) || other.adminEmail == adminEmail)&&(identical(other.adminUsername, adminUsername) || other.adminUsername == adminUsername)&&(identical(other.adminPhone, adminPhone) || other.adminPhone == adminPhone)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,organizationId,clinicCode,name,clinicType,email,phone,address,licenseNumber,adminFirstName,adminLastName,adminEmail,adminUsername,adminPhone,adminPassword);

@override
String toString() {
  return 'CreateClinicModel(organizationId: $organizationId, clinicCode: $clinicCode, name: $name, clinicType: $clinicType, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
}


}

/// @nodoc
abstract mixin class $CreateClinicModelCopyWith<$Res>  {
  factory $CreateClinicModelCopyWith(CreateClinicModel value, $Res Function(CreateClinicModel) _then) = _$CreateClinicModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'organization_id') String organizationId,@JsonKey(name: 'clinic_code') String? clinicCode, String name,@JsonKey(name: 'clinic_type') String? clinicType, String? email, String? phone, String? address,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'admin_first_name') String adminFirstName,@JsonKey(name: 'admin_last_name') String adminLastName,@JsonKey(name: 'admin_email') String adminEmail,@JsonKey(name: 'admin_username') String adminUsername,@JsonKey(name: 'admin_phone') String? adminPhone,@JsonKey(name: 'admin_password') String adminPassword
});




}
/// @nodoc
class _$CreateClinicModelCopyWithImpl<$Res>
    implements $CreateClinicModelCopyWith<$Res> {
  _$CreateClinicModelCopyWithImpl(this._self, this._then);

  final CreateClinicModel _self;
  final $Res Function(CreateClinicModel) _then;

/// Create a copy of CreateClinicModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? organizationId = null,Object? clinicCode = freezed,Object? name = null,Object? clinicType = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? licenseNumber = freezed,Object? adminFirstName = null,Object? adminLastName = null,Object? adminEmail = null,Object? adminUsername = null,Object? adminPhone = freezed,Object? adminPassword = null,}) {
  return _then(_self.copyWith(
organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,clinicCode: freezed == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicType: freezed == clinicType ? _self.clinicType : clinicType // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,adminFirstName: null == adminFirstName ? _self.adminFirstName : adminFirstName // ignore: cast_nullable_to_non_nullable
as String,adminLastName: null == adminLastName ? _self.adminLastName : adminLastName // ignore: cast_nullable_to_non_nullable
as String,adminEmail: null == adminEmail ? _self.adminEmail : adminEmail // ignore: cast_nullable_to_non_nullable
as String,adminUsername: null == adminUsername ? _self.adminUsername : adminUsername // ignore: cast_nullable_to_non_nullable
as String,adminPhone: freezed == adminPhone ? _self.adminPhone : adminPhone // ignore: cast_nullable_to_non_nullable
as String?,adminPassword: null == adminPassword ? _self.adminPassword : adminPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClinicModel].
extension CreateClinicModelPatterns on CreateClinicModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClinicModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClinicModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClinicModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateClinicModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClinicModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClinicModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'organization_id')  String organizationId, @JsonKey(name: 'clinic_code')  String? clinicCode,  String name, @JsonKey(name: 'clinic_type')  String? clinicType,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'admin_first_name')  String adminFirstName, @JsonKey(name: 'admin_last_name')  String adminLastName, @JsonKey(name: 'admin_email')  String adminEmail, @JsonKey(name: 'admin_username')  String adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String adminPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClinicModel() when $default != null:
return $default(_that.organizationId,_that.clinicCode,_that.name,_that.clinicType,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'organization_id')  String organizationId, @JsonKey(name: 'clinic_code')  String? clinicCode,  String name, @JsonKey(name: 'clinic_type')  String? clinicType,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'admin_first_name')  String adminFirstName, @JsonKey(name: 'admin_last_name')  String adminLastName, @JsonKey(name: 'admin_email')  String adminEmail, @JsonKey(name: 'admin_username')  String adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String adminPassword)  $default,) {final _that = this;
switch (_that) {
case _CreateClinicModel():
return $default(_that.organizationId,_that.clinicCode,_that.name,_that.clinicType,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'organization_id')  String organizationId, @JsonKey(name: 'clinic_code')  String? clinicCode,  String name, @JsonKey(name: 'clinic_type')  String? clinicType,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'admin_first_name')  String adminFirstName, @JsonKey(name: 'admin_last_name')  String adminLastName, @JsonKey(name: 'admin_email')  String adminEmail, @JsonKey(name: 'admin_username')  String adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String adminPassword)?  $default,) {final _that = this;
switch (_that) {
case _CreateClinicModel() when $default != null:
return $default(_that.organizationId,_that.clinicCode,_that.name,_that.clinicType,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateClinicModel implements CreateClinicModel {
  const _CreateClinicModel({@JsonKey(name: 'organization_id') required this.organizationId, @JsonKey(name: 'clinic_code') this.clinicCode, required this.name, @JsonKey(name: 'clinic_type') this.clinicType, this.email, this.phone, this.address, @JsonKey(name: 'license_number') this.licenseNumber, @JsonKey(name: 'admin_first_name') required this.adminFirstName, @JsonKey(name: 'admin_last_name') required this.adminLastName, @JsonKey(name: 'admin_email') required this.adminEmail, @JsonKey(name: 'admin_username') required this.adminUsername, @JsonKey(name: 'admin_phone') this.adminPhone, @JsonKey(name: 'admin_password') required this.adminPassword});
  factory _CreateClinicModel.fromJson(Map<String, dynamic> json) => _$CreateClinicModelFromJson(json);

@override@JsonKey(name: 'organization_id') final  String organizationId;
@override@JsonKey(name: 'clinic_code') final  String? clinicCode;
@override final  String name;
@override@JsonKey(name: 'clinic_type') final  String? clinicType;
@override final  String? email;
@override final  String? phone;
@override final  String? address;
@override@JsonKey(name: 'license_number') final  String? licenseNumber;
// Admin details - required for creation
@override@JsonKey(name: 'admin_first_name') final  String adminFirstName;
@override@JsonKey(name: 'admin_last_name') final  String adminLastName;
@override@JsonKey(name: 'admin_email') final  String adminEmail;
@override@JsonKey(name: 'admin_username') final  String adminUsername;
@override@JsonKey(name: 'admin_phone') final  String? adminPhone;
@override@JsonKey(name: 'admin_password') final  String adminPassword;

/// Create a copy of CreateClinicModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClinicModelCopyWith<_CreateClinicModel> get copyWith => __$CreateClinicModelCopyWithImpl<_CreateClinicModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClinicModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClinicModel&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.clinicCode, clinicCode) || other.clinicCode == clinicCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicType, clinicType) || other.clinicType == clinicType)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.adminFirstName, adminFirstName) || other.adminFirstName == adminFirstName)&&(identical(other.adminLastName, adminLastName) || other.adminLastName == adminLastName)&&(identical(other.adminEmail, adminEmail) || other.adminEmail == adminEmail)&&(identical(other.adminUsername, adminUsername) || other.adminUsername == adminUsername)&&(identical(other.adminPhone, adminPhone) || other.adminPhone == adminPhone)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,organizationId,clinicCode,name,clinicType,email,phone,address,licenseNumber,adminFirstName,adminLastName,adminEmail,adminUsername,adminPhone,adminPassword);

@override
String toString() {
  return 'CreateClinicModel(organizationId: $organizationId, clinicCode: $clinicCode, name: $name, clinicType: $clinicType, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
}


}

/// @nodoc
abstract mixin class _$CreateClinicModelCopyWith<$Res> implements $CreateClinicModelCopyWith<$Res> {
  factory _$CreateClinicModelCopyWith(_CreateClinicModel value, $Res Function(_CreateClinicModel) _then) = __$CreateClinicModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'organization_id') String organizationId,@JsonKey(name: 'clinic_code') String? clinicCode, String name,@JsonKey(name: 'clinic_type') String? clinicType, String? email, String? phone, String? address,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'admin_first_name') String adminFirstName,@JsonKey(name: 'admin_last_name') String adminLastName,@JsonKey(name: 'admin_email') String adminEmail,@JsonKey(name: 'admin_username') String adminUsername,@JsonKey(name: 'admin_phone') String? adminPhone,@JsonKey(name: 'admin_password') String adminPassword
});




}
/// @nodoc
class __$CreateClinicModelCopyWithImpl<$Res>
    implements _$CreateClinicModelCopyWith<$Res> {
  __$CreateClinicModelCopyWithImpl(this._self, this._then);

  final _CreateClinicModel _self;
  final $Res Function(_CreateClinicModel) _then;

/// Create a copy of CreateClinicModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? organizationId = null,Object? clinicCode = freezed,Object? name = null,Object? clinicType = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? licenseNumber = freezed,Object? adminFirstName = null,Object? adminLastName = null,Object? adminEmail = null,Object? adminUsername = null,Object? adminPhone = freezed,Object? adminPassword = null,}) {
  return _then(_CreateClinicModel(
organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,clinicCode: freezed == clinicCode ? _self.clinicCode : clinicCode // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicType: freezed == clinicType ? _self.clinicType : clinicType // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,adminFirstName: null == adminFirstName ? _self.adminFirstName : adminFirstName // ignore: cast_nullable_to_non_nullable
as String,adminLastName: null == adminLastName ? _self.adminLastName : adminLastName // ignore: cast_nullable_to_non_nullable
as String,adminEmail: null == adminEmail ? _self.adminEmail : adminEmail // ignore: cast_nullable_to_non_nullable
as String,adminUsername: null == adminUsername ? _self.adminUsername : adminUsername // ignore: cast_nullable_to_non_nullable
as String,adminPhone: freezed == adminPhone ? _self.adminPhone : adminPhone // ignore: cast_nullable_to_non_nullable
as String?,adminPassword: null == adminPassword ? _self.adminPassword : adminPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
