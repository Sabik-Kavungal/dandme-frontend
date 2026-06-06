// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationModel {

 String? get id; String get name; String? get email; String? get phone; String? get address;@JsonKey(name: 'license_number') String? get licenseNumber; bool? get isActive; String? get createdAt;// Admin details (for creating new organizations)
@JsonKey(name: 'admin_first_name') String? get adminFirstName;@JsonKey(name: 'admin_last_name') String? get adminLastName;@JsonKey(name: 'admin_email') String? get adminEmail;@JsonKey(name: 'admin_username') String? get adminUsername;@JsonKey(name: 'admin_phone') String? get adminPhone;@JsonKey(name: 'admin_password') String? get adminPassword;
/// Create a copy of OrganizationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationModelCopyWith<OrganizationModel> get copyWith => _$OrganizationModelCopyWithImpl<OrganizationModel>(this as OrganizationModel, _$identity);

  /// Serializes this OrganizationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.adminFirstName, adminFirstName) || other.adminFirstName == adminFirstName)&&(identical(other.adminLastName, adminLastName) || other.adminLastName == adminLastName)&&(identical(other.adminEmail, adminEmail) || other.adminEmail == adminEmail)&&(identical(other.adminUsername, adminUsername) || other.adminUsername == adminUsername)&&(identical(other.adminPhone, adminPhone) || other.adminPhone == adminPhone)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,address,licenseNumber,isActive,createdAt,adminFirstName,adminLastName,adminEmail,adminUsername,adminPhone,adminPassword);

@override
String toString() {
  return 'OrganizationModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, isActive: $isActive, createdAt: $createdAt, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
}


}

/// @nodoc
abstract mixin class $OrganizationModelCopyWith<$Res>  {
  factory $OrganizationModelCopyWith(OrganizationModel value, $Res Function(OrganizationModel) _then) = _$OrganizationModelCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String? email, String? phone, String? address,@JsonKey(name: 'license_number') String? licenseNumber, bool? isActive, String? createdAt,@JsonKey(name: 'admin_first_name') String? adminFirstName,@JsonKey(name: 'admin_last_name') String? adminLastName,@JsonKey(name: 'admin_email') String? adminEmail,@JsonKey(name: 'admin_username') String? adminUsername,@JsonKey(name: 'admin_phone') String? adminPhone,@JsonKey(name: 'admin_password') String? adminPassword
});




}
/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._self, this._then);

  final OrganizationModel _self;
  final $Res Function(OrganizationModel) _then;

/// Create a copy of OrganizationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? licenseNumber = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? adminFirstName = freezed,Object? adminLastName = freezed,Object? adminEmail = freezed,Object? adminUsername = freezed,Object? adminPhone = freezed,Object? adminPassword = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
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
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationModel].
extension OrganizationModelPatterns on OrganizationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationModel value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber,  bool? isActive,  String? createdAt, @JsonKey(name: 'admin_first_name')  String? adminFirstName, @JsonKey(name: 'admin_last_name')  String? adminLastName, @JsonKey(name: 'admin_email')  String? adminEmail, @JsonKey(name: 'admin_username')  String? adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String? adminPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.isActive,_that.createdAt,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber,  bool? isActive,  String? createdAt, @JsonKey(name: 'admin_first_name')  String? adminFirstName, @JsonKey(name: 'admin_last_name')  String? adminLastName, @JsonKey(name: 'admin_email')  String? adminEmail, @JsonKey(name: 'admin_username')  String? adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String? adminPassword)  $default,) {final _that = this;
switch (_that) {
case _OrganizationModel():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.isActive,_that.createdAt,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String? email,  String? phone,  String? address, @JsonKey(name: 'license_number')  String? licenseNumber,  bool? isActive,  String? createdAt, @JsonKey(name: 'admin_first_name')  String? adminFirstName, @JsonKey(name: 'admin_last_name')  String? adminLastName, @JsonKey(name: 'admin_email')  String? adminEmail, @JsonKey(name: 'admin_username')  String? adminUsername, @JsonKey(name: 'admin_phone')  String? adminPhone, @JsonKey(name: 'admin_password')  String? adminPassword)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.licenseNumber,_that.isActive,_that.createdAt,_that.adminFirstName,_that.adminLastName,_that.adminEmail,_that.adminUsername,_that.adminPhone,_that.adminPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrganizationModel implements OrganizationModel {
  const _OrganizationModel({this.id, required this.name, this.email, this.phone, this.address, @JsonKey(name: 'license_number') this.licenseNumber, this.isActive, this.createdAt, @JsonKey(name: 'admin_first_name') this.adminFirstName, @JsonKey(name: 'admin_last_name') this.adminLastName, @JsonKey(name: 'admin_email') this.adminEmail, @JsonKey(name: 'admin_username') this.adminUsername, @JsonKey(name: 'admin_phone') this.adminPhone, @JsonKey(name: 'admin_password') this.adminPassword});
  factory _OrganizationModel.fromJson(Map<String, dynamic> json) => _$OrganizationModelFromJson(json);

@override final  String? id;
@override final  String name;
@override final  String? email;
@override final  String? phone;
@override final  String? address;
@override@JsonKey(name: 'license_number') final  String? licenseNumber;
@override final  bool? isActive;
@override final  String? createdAt;
// Admin details (for creating new organizations)
@override@JsonKey(name: 'admin_first_name') final  String? adminFirstName;
@override@JsonKey(name: 'admin_last_name') final  String? adminLastName;
@override@JsonKey(name: 'admin_email') final  String? adminEmail;
@override@JsonKey(name: 'admin_username') final  String? adminUsername;
@override@JsonKey(name: 'admin_phone') final  String? adminPhone;
@override@JsonKey(name: 'admin_password') final  String? adminPassword;

/// Create a copy of OrganizationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationModelCopyWith<_OrganizationModel> get copyWith => __$OrganizationModelCopyWithImpl<_OrganizationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.adminFirstName, adminFirstName) || other.adminFirstName == adminFirstName)&&(identical(other.adminLastName, adminLastName) || other.adminLastName == adminLastName)&&(identical(other.adminEmail, adminEmail) || other.adminEmail == adminEmail)&&(identical(other.adminUsername, adminUsername) || other.adminUsername == adminUsername)&&(identical(other.adminPhone, adminPhone) || other.adminPhone == adminPhone)&&(identical(other.adminPassword, adminPassword) || other.adminPassword == adminPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,address,licenseNumber,isActive,createdAt,adminFirstName,adminLastName,adminEmail,adminUsername,adminPhone,adminPassword);

@override
String toString() {
  return 'OrganizationModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, licenseNumber: $licenseNumber, isActive: $isActive, createdAt: $createdAt, adminFirstName: $adminFirstName, adminLastName: $adminLastName, adminEmail: $adminEmail, adminUsername: $adminUsername, adminPhone: $adminPhone, adminPassword: $adminPassword)';
}


}

/// @nodoc
abstract mixin class _$OrganizationModelCopyWith<$Res> implements $OrganizationModelCopyWith<$Res> {
  factory _$OrganizationModelCopyWith(_OrganizationModel value, $Res Function(_OrganizationModel) _then) = __$OrganizationModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String? email, String? phone, String? address,@JsonKey(name: 'license_number') String? licenseNumber, bool? isActive, String? createdAt,@JsonKey(name: 'admin_first_name') String? adminFirstName,@JsonKey(name: 'admin_last_name') String? adminLastName,@JsonKey(name: 'admin_email') String? adminEmail,@JsonKey(name: 'admin_username') String? adminUsername,@JsonKey(name: 'admin_phone') String? adminPhone,@JsonKey(name: 'admin_password') String? adminPassword
});




}
/// @nodoc
class __$OrganizationModelCopyWithImpl<$Res>
    implements _$OrganizationModelCopyWith<$Res> {
  __$OrganizationModelCopyWithImpl(this._self, this._then);

  final _OrganizationModel _self;
  final $Res Function(_OrganizationModel) _then;

/// Create a copy of OrganizationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? licenseNumber = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? adminFirstName = freezed,Object? adminLastName = freezed,Object? adminEmail = freezed,Object? adminUsername = freezed,Object? adminPhone = freezed,Object? adminPassword = freezed,}) {
  return _then(_OrganizationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
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
as String?,
  ));
}


}

// dart format on
