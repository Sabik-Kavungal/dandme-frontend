// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/department_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) {
  return _DepartmentModel.fromJson(json);
}

/// @nodoc
mixin _$DepartmentModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "clinic_id")
  String get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: "clinic_name")
  String? get clinicName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DepartmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentModelCopyWith<DepartmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentModelCopyWith<$Res> {
  factory $DepartmentModelCopyWith(
    DepartmentModel value,
    $Res Function(DepartmentModel) then,
  ) = _$DepartmentModelCopyWithImpl<$Res, DepartmentModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "clinic_id") String clinicId,
    @JsonKey(name: "clinic_name") String? clinicName,
    String name,
    String? description,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  });
}

/// @nodoc
class _$DepartmentModelCopyWithImpl<$Res, $Val extends DepartmentModel>
    implements $DepartmentModelCopyWith<$Res> {
  _$DepartmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? clinicName = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            clinicName: freezed == clinicName
                ? _value.clinicName
                : clinicName // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$DepartmentModelImplCopyWith<$Res>
    implements $DepartmentModelCopyWith<$Res> {
  factory _$$DepartmentModelImplCopyWith(
    _$DepartmentModelImpl value,
    $Res Function(_$DepartmentModelImpl) then,
  ) = __$$DepartmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "clinic_id") String clinicId,
    @JsonKey(name: "clinic_name") String? clinicName,
    String name,
    String? description,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  });
}

/// @nodoc
class __$$DepartmentModelImplCopyWithImpl<$Res>
    extends _$DepartmentModelCopyWithImpl<$Res, _$DepartmentModelImpl>
    implements _$$DepartmentModelImplCopyWith<$Res> {
  __$$DepartmentModelImplCopyWithImpl(
    _$DepartmentModelImpl _value,
    $Res Function(_$DepartmentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DepartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clinicId = null,
    Object? clinicName = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DepartmentModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        clinicName: freezed == clinicName
            ? _value.clinicName
            : clinicName // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$DepartmentModelImpl implements _DepartmentModel {
  const _$DepartmentModelImpl({
    required this.id,
    @JsonKey(name: "clinic_id") required this.clinicId,
    @JsonKey(name: "clinic_name") this.clinicName,
    required this.name,
    this.description,
    @JsonKey(name: "is_active") this.isActive = true,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "updated_at") this.updatedAt,
  });

  factory _$DepartmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "clinic_id")
  final String clinicId;
  @override
  @JsonKey(name: "clinic_name")
  final String? clinicName;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'DepartmentModel(id: $id, clinicId: $clinicId, clinicName: $clinicName, name: $name, description: $description, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    clinicId,
    clinicName,
    name,
    description,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of DepartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentModelImplCopyWith<_$DepartmentModelImpl> get copyWith =>
      __$$DepartmentModelImplCopyWithImpl<_$DepartmentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentModelImplToJson(this);
  }
}

abstract class _DepartmentModel implements DepartmentModel {
  const factory _DepartmentModel({
    required final String id,
    @JsonKey(name: "clinic_id") required final String clinicId,
    @JsonKey(name: "clinic_name") final String? clinicName,
    required final String name,
    final String? description,
    @JsonKey(name: "is_active") final bool isActive,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "updated_at") final String? updatedAt,
  }) = _$DepartmentModelImpl;

  factory _DepartmentModel.fromJson(Map<String, dynamic> json) =
      _$DepartmentModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "clinic_id")
  String get clinicId;
  @override
  @JsonKey(name: "clinic_name")
  String? get clinicName;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: "is_active")
  bool get isActive;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;

  /// Create a copy of DepartmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentModelImplCopyWith<_$DepartmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateDepartmentInput _$CreateDepartmentInputFromJson(
  Map<String, dynamic> json,
) {
  return _CreateDepartmentInput.fromJson(json);
}

/// @nodoc
mixin _$CreateDepartmentInput {
  @JsonKey(name: "clinic_id")
  String get clinicId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CreateDepartmentInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDepartmentInputCopyWith<CreateDepartmentInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDepartmentInputCopyWith<$Res> {
  factory $CreateDepartmentInputCopyWith(
    CreateDepartmentInput value,
    $Res Function(CreateDepartmentInput) then,
  ) = _$CreateDepartmentInputCopyWithImpl<$Res, CreateDepartmentInput>;
  @useResult
  $Res call({
    @JsonKey(name: "clinic_id") String clinicId,
    String name,
    String? description,
  });
}

/// @nodoc
class _$CreateDepartmentInputCopyWithImpl<
  $Res,
  $Val extends CreateDepartmentInput
>
    implements $CreateDepartmentInputCopyWith<$Res> {
  _$CreateDepartmentInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            clinicId: null == clinicId
                ? _value.clinicId
                : clinicId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$CreateDepartmentInputImplCopyWith<$Res>
    implements $CreateDepartmentInputCopyWith<$Res> {
  factory _$$CreateDepartmentInputImplCopyWith(
    _$CreateDepartmentInputImpl value,
    $Res Function(_$CreateDepartmentInputImpl) then,
  ) = __$$CreateDepartmentInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "clinic_id") String clinicId,
    String name,
    String? description,
  });
}

/// @nodoc
class __$$CreateDepartmentInputImplCopyWithImpl<$Res>
    extends
        _$CreateDepartmentInputCopyWithImpl<$Res, _$CreateDepartmentInputImpl>
    implements _$$CreateDepartmentInputImplCopyWith<$Res> {
  __$$CreateDepartmentInputImplCopyWithImpl(
    _$CreateDepartmentInputImpl _value,
    $Res Function(_$CreateDepartmentInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(
      _$CreateDepartmentInputImpl(
        clinicId: null == clinicId
            ? _value.clinicId
            : clinicId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$CreateDepartmentInputImpl implements _CreateDepartmentInput {
  const _$CreateDepartmentInputImpl({
    @JsonKey(name: "clinic_id") required this.clinicId,
    required this.name,
    this.description,
  });

  factory _$CreateDepartmentInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDepartmentInputImplFromJson(json);

  @override
  @JsonKey(name: "clinic_id")
  final String clinicId;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'CreateDepartmentInput(clinicId: $clinicId, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDepartmentInputImpl &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clinicId, name, description);

  /// Create a copy of CreateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDepartmentInputImplCopyWith<_$CreateDepartmentInputImpl>
  get copyWith =>
      __$$CreateDepartmentInputImplCopyWithImpl<_$CreateDepartmentInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDepartmentInputImplToJson(this);
  }
}

abstract class _CreateDepartmentInput implements CreateDepartmentInput {
  const factory _CreateDepartmentInput({
    @JsonKey(name: "clinic_id") required final String clinicId,
    required final String name,
    final String? description,
  }) = _$CreateDepartmentInputImpl;

  factory _CreateDepartmentInput.fromJson(Map<String, dynamic> json) =
      _$CreateDepartmentInputImpl.fromJson;

  @override
  @JsonKey(name: "clinic_id")
  String get clinicId;
  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of CreateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDepartmentInputImplCopyWith<_$CreateDepartmentInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdateDepartmentInput _$UpdateDepartmentInputFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateDepartmentInput.fromJson(json);
}

/// @nodoc
mixin _$UpdateDepartmentInput {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this UpdateDepartmentInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateDepartmentInputCopyWith<UpdateDepartmentInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDepartmentInputCopyWith<$Res> {
  factory $UpdateDepartmentInputCopyWith(
    UpdateDepartmentInput value,
    $Res Function(UpdateDepartmentInput) then,
  ) = _$UpdateDepartmentInputCopyWithImpl<$Res, UpdateDepartmentInput>;
  @useResult
  $Res call({
    String? name,
    String? description,
    @JsonKey(name: "is_active") bool? isActive,
  });
}

/// @nodoc
class _$UpdateDepartmentInputCopyWithImpl<
  $Res,
  $Val extends UpdateDepartmentInput
>
    implements $UpdateDepartmentInputCopyWith<$Res> {
  _$UpdateDepartmentInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UpdateDepartmentInputImplCopyWith<$Res>
    implements $UpdateDepartmentInputCopyWith<$Res> {
  factory _$$UpdateDepartmentInputImplCopyWith(
    _$UpdateDepartmentInputImpl value,
    $Res Function(_$UpdateDepartmentInputImpl) then,
  ) = __$$UpdateDepartmentInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? name,
    String? description,
    @JsonKey(name: "is_active") bool? isActive,
  });
}

/// @nodoc
class __$$UpdateDepartmentInputImplCopyWithImpl<$Res>
    extends
        _$UpdateDepartmentInputCopyWithImpl<$Res, _$UpdateDepartmentInputImpl>
    implements _$$UpdateDepartmentInputImplCopyWith<$Res> {
  __$$UpdateDepartmentInputImplCopyWithImpl(
    _$UpdateDepartmentInputImpl _value,
    $Res Function(_$UpdateDepartmentInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
  }) {
    return _then(
      _$UpdateDepartmentInputImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
class _$UpdateDepartmentInputImpl implements _UpdateDepartmentInput {
  const _$UpdateDepartmentInputImpl({
    this.name,
    this.description,
    @JsonKey(name: "is_active") this.isActive,
  });

  factory _$UpdateDepartmentInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateDepartmentInputImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;

  @override
  String toString() {
    return 'UpdateDepartmentInput(name: $name, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDepartmentInputImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, isActive);

  /// Create a copy of UpdateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDepartmentInputImplCopyWith<_$UpdateDepartmentInputImpl>
  get copyWith =>
      __$$UpdateDepartmentInputImplCopyWithImpl<_$UpdateDepartmentInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDepartmentInputImplToJson(this);
  }
}

abstract class _UpdateDepartmentInput implements UpdateDepartmentInput {
  const factory _UpdateDepartmentInput({
    final String? name,
    final String? description,
    @JsonKey(name: "is_active") final bool? isActive,
  }) = _$UpdateDepartmentInputImpl;

  factory _UpdateDepartmentInput.fromJson(Map<String, dynamic> json) =
      _$UpdateDepartmentInputImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;

  /// Create a copy of UpdateDepartmentInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDepartmentInputImplCopyWith<_$UpdateDepartmentInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DoctorInDepartment _$DoctorInDepartmentFromJson(Map<String, dynamic> json) {
  return _DoctorInDepartment.fromJson(json);
}

/// @nodoc
mixin _$DoctorInDepartment {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "doctor_code")
  String get doctorCode => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "is_main_doctor")
  bool get isMainDoctor => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "department_name")
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: "clinic_name")
  String? get clinicName => throw _privateConstructorUsedError;

  /// Serializes this DoctorInDepartment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorInDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorInDepartmentCopyWith<DoctorInDepartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorInDepartmentCopyWith<$Res> {
  factory $DoctorInDepartmentCopyWith(
    DoctorInDepartment value,
    $Res Function(DoctorInDepartment) then,
  ) = _$DoctorInDepartmentCopyWithImpl<$Res, DoctorInDepartment>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "user_id") String userId,
    @JsonKey(name: "doctor_code") String doctorCode,
    String specialization,
    @JsonKey(name: "license_number") String licenseNumber,
    @JsonKey(name: "is_main_doctor") bool isMainDoctor,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String email,
    String? phone,
    @JsonKey(name: "department_name") String? departmentName,
    @JsonKey(name: "clinic_name") String? clinicName,
  });
}

/// @nodoc
class _$DoctorInDepartmentCopyWithImpl<$Res, $Val extends DoctorInDepartment>
    implements $DoctorInDepartmentCopyWith<$Res> {
  _$DoctorInDepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorInDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? doctorCode = null,
    Object? specialization = null,
    Object? licenseNumber = null,
    Object? isMainDoctor = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = freezed,
    Object? departmentName = freezed,
    Object? clinicName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorCode: null == doctorCode
                ? _value.doctorCode
                : doctorCode // ignore: cast_nullable_to_non_nullable
                      as String,
            specialization: null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String,
            licenseNumber: null == licenseNumber
                ? _value.licenseNumber
                : licenseNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            isMainDoctor: null == isMainDoctor
                ? _value.isMainDoctor
                : isMainDoctor // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentName: freezed == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String?,
            clinicName: freezed == clinicName
                ? _value.clinicName
                : clinicName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorInDepartmentImplCopyWith<$Res>
    implements $DoctorInDepartmentCopyWith<$Res> {
  factory _$$DoctorInDepartmentImplCopyWith(
    _$DoctorInDepartmentImpl value,
    $Res Function(_$DoctorInDepartmentImpl) then,
  ) = __$$DoctorInDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: "user_id") String userId,
    @JsonKey(name: "doctor_code") String doctorCode,
    String specialization,
    @JsonKey(name: "license_number") String licenseNumber,
    @JsonKey(name: "is_main_doctor") bool isMainDoctor,
    @JsonKey(name: "is_active") bool isActive,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "first_name") String firstName,
    @JsonKey(name: "last_name") String lastName,
    String email,
    String? phone,
    @JsonKey(name: "department_name") String? departmentName,
    @JsonKey(name: "clinic_name") String? clinicName,
  });
}

/// @nodoc
class __$$DoctorInDepartmentImplCopyWithImpl<$Res>
    extends _$DoctorInDepartmentCopyWithImpl<$Res, _$DoctorInDepartmentImpl>
    implements _$$DoctorInDepartmentImplCopyWith<$Res> {
  __$$DoctorInDepartmentImplCopyWithImpl(
    _$DoctorInDepartmentImpl _value,
    $Res Function(_$DoctorInDepartmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorInDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? doctorCode = null,
    Object? specialization = null,
    Object? licenseNumber = null,
    Object? isMainDoctor = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = freezed,
    Object? departmentName = freezed,
    Object? clinicName = freezed,
  }) {
    return _then(
      _$DoctorInDepartmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorCode: null == doctorCode
            ? _value.doctorCode
            : doctorCode // ignore: cast_nullable_to_non_nullable
                  as String,
        specialization: null == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String,
        licenseNumber: null == licenseNumber
            ? _value.licenseNumber
            : licenseNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        isMainDoctor: null == isMainDoctor
            ? _value.isMainDoctor
            : isMainDoctor // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentName: freezed == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String?,
        clinicName: freezed == clinicName
            ? _value.clinicName
            : clinicName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorInDepartmentImpl implements _DoctorInDepartment {
  const _$DoctorInDepartmentImpl({
    required this.id,
    @JsonKey(name: "user_id") required this.userId,
    @JsonKey(name: "doctor_code") required this.doctorCode,
    required this.specialization,
    @JsonKey(name: "license_number") required this.licenseNumber,
    @JsonKey(name: "is_main_doctor") this.isMainDoctor = false,
    @JsonKey(name: "is_active") this.isActive = true,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "first_name") required this.firstName,
    @JsonKey(name: "last_name") required this.lastName,
    required this.email,
    this.phone,
    @JsonKey(name: "department_name") this.departmentName,
    @JsonKey(name: "clinic_name") this.clinicName,
  });

  factory _$DoctorInDepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorInDepartmentImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "doctor_code")
  final String doctorCode;
  @override
  final String specialization;
  @override
  @JsonKey(name: "license_number")
  final String licenseNumber;
  @override
  @JsonKey(name: "is_main_doctor")
  final bool isMainDoctor;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  final String email;
  @override
  final String? phone;
  @override
  @JsonKey(name: "department_name")
  final String? departmentName;
  @override
  @JsonKey(name: "clinic_name")
  final String? clinicName;

  @override
  String toString() {
    return 'DoctorInDepartment(id: $id, userId: $userId, doctorCode: $doctorCode, specialization: $specialization, licenseNumber: $licenseNumber, isMainDoctor: $isMainDoctor, isActive: $isActive, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, departmentName: $departmentName, clinicName: $clinicName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorInDepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.doctorCode, doctorCode) ||
                other.doctorCode == doctorCode) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.isMainDoctor, isMainDoctor) ||
                other.isMainDoctor == isMainDoctor) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    doctorCode,
    specialization,
    licenseNumber,
    isMainDoctor,
    isActive,
    createdAt,
    firstName,
    lastName,
    email,
    phone,
    departmentName,
    clinicName,
  );

  /// Create a copy of DoctorInDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorInDepartmentImplCopyWith<_$DoctorInDepartmentImpl> get copyWith =>
      __$$DoctorInDepartmentImplCopyWithImpl<_$DoctorInDepartmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorInDepartmentImplToJson(this);
  }
}

abstract class _DoctorInDepartment implements DoctorInDepartment {
  const factory _DoctorInDepartment({
    required final String id,
    @JsonKey(name: "user_id") required final String userId,
    @JsonKey(name: "doctor_code") required final String doctorCode,
    required final String specialization,
    @JsonKey(name: "license_number") required final String licenseNumber,
    @JsonKey(name: "is_main_doctor") final bool isMainDoctor,
    @JsonKey(name: "is_active") final bool isActive,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "first_name") required final String firstName,
    @JsonKey(name: "last_name") required final String lastName,
    required final String email,
    final String? phone,
    @JsonKey(name: "department_name") final String? departmentName,
    @JsonKey(name: "clinic_name") final String? clinicName,
  }) = _$DoctorInDepartmentImpl;

  factory _DoctorInDepartment.fromJson(Map<String, dynamic> json) =
      _$DoctorInDepartmentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "doctor_code")
  String get doctorCode;
  @override
  String get specialization;
  @override
  @JsonKey(name: "license_number")
  String get licenseNumber;
  @override
  @JsonKey(name: "is_main_doctor")
  bool get isMainDoctor;
  @override
  @JsonKey(name: "is_active")
  bool get isActive;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  String get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: "department_name")
  String? get departmentName;
  @override
  @JsonKey(name: "clinic_name")
  String? get clinicName;

  /// Create a copy of DoctorInDepartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorInDepartmentImplCopyWith<_$DoctorInDepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DepartmentListResponse _$DepartmentListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DepartmentListResponse.fromJson(json);
}

/// @nodoc
mixin _$DepartmentListResponse {
  List<DepartmentModel> get departments => throw _privateConstructorUsedError;
  @JsonKey(name: "total_count")
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this DepartmentListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentListResponseCopyWith<DepartmentListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentListResponseCopyWith<$Res> {
  factory $DepartmentListResponseCopyWith(
    DepartmentListResponse value,
    $Res Function(DepartmentListResponse) then,
  ) = _$DepartmentListResponseCopyWithImpl<$Res, DepartmentListResponse>;
  @useResult
  $Res call({
    List<DepartmentModel> departments,
    @JsonKey(name: "total_count") int totalCount,
  });
}

/// @nodoc
class _$DepartmentListResponseCopyWithImpl<
  $Res,
  $Val extends DepartmentListResponse
>
    implements $DepartmentListResponseCopyWith<$Res> {
  _$DepartmentListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepartmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? departments = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            departments: null == departments
                ? _value.departments
                : departments // ignore: cast_nullable_to_non_nullable
                      as List<DepartmentModel>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DepartmentListResponseImplCopyWith<$Res>
    implements $DepartmentListResponseCopyWith<$Res> {
  factory _$$DepartmentListResponseImplCopyWith(
    _$DepartmentListResponseImpl value,
    $Res Function(_$DepartmentListResponseImpl) then,
  ) = __$$DepartmentListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DepartmentModel> departments,
    @JsonKey(name: "total_count") int totalCount,
  });
}

/// @nodoc
class __$$DepartmentListResponseImplCopyWithImpl<$Res>
    extends
        _$DepartmentListResponseCopyWithImpl<$Res, _$DepartmentListResponseImpl>
    implements _$$DepartmentListResponseImplCopyWith<$Res> {
  __$$DepartmentListResponseImplCopyWithImpl(
    _$DepartmentListResponseImpl _value,
    $Res Function(_$DepartmentListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DepartmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? departments = null, Object? totalCount = null}) {
    return _then(
      _$DepartmentListResponseImpl(
        departments: null == departments
            ? _value._departments
            : departments // ignore: cast_nullable_to_non_nullable
                  as List<DepartmentModel>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentListResponseImpl implements _DepartmentListResponse {
  const _$DepartmentListResponseImpl({
    required final List<DepartmentModel> departments,
    @JsonKey(name: "total_count") required this.totalCount,
  }) : _departments = departments;

  factory _$DepartmentListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentListResponseImplFromJson(json);

  final List<DepartmentModel> _departments;
  @override
  List<DepartmentModel> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  @override
  @JsonKey(name: "total_count")
  final int totalCount;

  @override
  String toString() {
    return 'DepartmentListResponse(departments: $departments, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentListResponseImpl &&
            const DeepCollectionEquality().equals(
              other._departments,
              _departments,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_departments),
    totalCount,
  );

  /// Create a copy of DepartmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentListResponseImplCopyWith<_$DepartmentListResponseImpl>
  get copyWith =>
      __$$DepartmentListResponseImplCopyWithImpl<_$DepartmentListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentListResponseImplToJson(this);
  }
}

abstract class _DepartmentListResponse implements DepartmentListResponse {
  const factory _DepartmentListResponse({
    required final List<DepartmentModel> departments,
    @JsonKey(name: "total_count") required final int totalCount,
  }) = _$DepartmentListResponseImpl;

  factory _DepartmentListResponse.fromJson(Map<String, dynamic> json) =
      _$DepartmentListResponseImpl.fromJson;

  @override
  List<DepartmentModel> get departments;
  @override
  @JsonKey(name: "total_count")
  int get totalCount;

  /// Create a copy of DepartmentListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentListResponseImplCopyWith<_$DepartmentListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DoctorsByDepartmentResponse _$DoctorsByDepartmentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DoctorsByDepartmentResponse.fromJson(json);
}

/// @nodoc
mixin _$DoctorsByDepartmentResponse {
  @JsonKey(name: "department_id")
  String get departmentId => throw _privateConstructorUsedError;
  List<DoctorInDepartment> get doctors => throw _privateConstructorUsedError;
  @JsonKey(name: "total_count")
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this DoctorsByDepartmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorsByDepartmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorsByDepartmentResponseCopyWith<DoctorsByDepartmentResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorsByDepartmentResponseCopyWith<$Res> {
  factory $DoctorsByDepartmentResponseCopyWith(
    DoctorsByDepartmentResponse value,
    $Res Function(DoctorsByDepartmentResponse) then,
  ) =
      _$DoctorsByDepartmentResponseCopyWithImpl<
        $Res,
        DoctorsByDepartmentResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: "department_id") String departmentId,
    List<DoctorInDepartment> doctors,
    @JsonKey(name: "total_count") int totalCount,
  });
}

/// @nodoc
class _$DoctorsByDepartmentResponseCopyWithImpl<
  $Res,
  $Val extends DoctorsByDepartmentResponse
>
    implements $DoctorsByDepartmentResponseCopyWith<$Res> {
  _$DoctorsByDepartmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorsByDepartmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentId = null,
    Object? doctors = null,
    Object? totalCount = null,
  }) {
    return _then(
      _value.copyWith(
            departmentId: null == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            doctors: null == doctors
                ? _value.doctors
                : doctors // ignore: cast_nullable_to_non_nullable
                      as List<DoctorInDepartment>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorsByDepartmentResponseImplCopyWith<$Res>
    implements $DoctorsByDepartmentResponseCopyWith<$Res> {
  factory _$$DoctorsByDepartmentResponseImplCopyWith(
    _$DoctorsByDepartmentResponseImpl value,
    $Res Function(_$DoctorsByDepartmentResponseImpl) then,
  ) = __$$DoctorsByDepartmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "department_id") String departmentId,
    List<DoctorInDepartment> doctors,
    @JsonKey(name: "total_count") int totalCount,
  });
}

/// @nodoc
class __$$DoctorsByDepartmentResponseImplCopyWithImpl<$Res>
    extends
        _$DoctorsByDepartmentResponseCopyWithImpl<
          $Res,
          _$DoctorsByDepartmentResponseImpl
        >
    implements _$$DoctorsByDepartmentResponseImplCopyWith<$Res> {
  __$$DoctorsByDepartmentResponseImplCopyWithImpl(
    _$DoctorsByDepartmentResponseImpl _value,
    $Res Function(_$DoctorsByDepartmentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorsByDepartmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departmentId = null,
    Object? doctors = null,
    Object? totalCount = null,
  }) {
    return _then(
      _$DoctorsByDepartmentResponseImpl(
        departmentId: null == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        doctors: null == doctors
            ? _value._doctors
            : doctors // ignore: cast_nullable_to_non_nullable
                  as List<DoctorInDepartment>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorsByDepartmentResponseImpl
    implements _DoctorsByDepartmentResponse {
  const _$DoctorsByDepartmentResponseImpl({
    @JsonKey(name: "department_id") required this.departmentId,
    required final List<DoctorInDepartment> doctors,
    @JsonKey(name: "total_count") required this.totalCount,
  }) : _doctors = doctors;

  factory _$DoctorsByDepartmentResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$DoctorsByDepartmentResponseImplFromJson(json);

  @override
  @JsonKey(name: "department_id")
  final String departmentId;
  final List<DoctorInDepartment> _doctors;
  @override
  List<DoctorInDepartment> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  @JsonKey(name: "total_count")
  final int totalCount;

  @override
  String toString() {
    return 'DoctorsByDepartmentResponse(departmentId: $departmentId, doctors: $doctors, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorsByDepartmentResponseImpl &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    departmentId,
    const DeepCollectionEquality().hash(_doctors),
    totalCount,
  );

  /// Create a copy of DoctorsByDepartmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorsByDepartmentResponseImplCopyWith<_$DoctorsByDepartmentResponseImpl>
  get copyWith =>
      __$$DoctorsByDepartmentResponseImplCopyWithImpl<
        _$DoctorsByDepartmentResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorsByDepartmentResponseImplToJson(this);
  }
}

abstract class _DoctorsByDepartmentResponse
    implements DoctorsByDepartmentResponse {
  const factory _DoctorsByDepartmentResponse({
    @JsonKey(name: "department_id") required final String departmentId,
    required final List<DoctorInDepartment> doctors,
    @JsonKey(name: "total_count") required final int totalCount,
  }) = _$DoctorsByDepartmentResponseImpl;

  factory _DoctorsByDepartmentResponse.fromJson(Map<String, dynamic> json) =
      _$DoctorsByDepartmentResponseImpl.fromJson;

  @override
  @JsonKey(name: "department_id")
  String get departmentId;
  @override
  List<DoctorInDepartment> get doctors;
  @override
  @JsonKey(name: "total_count")
  int get totalCount;

  /// Create a copy of DoctorsByDepartmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorsByDepartmentResponseImplCopyWith<_$DoctorsByDepartmentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
