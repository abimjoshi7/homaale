// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_account_suspension.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAccountSuspension _$UserAccountSuspensionFromJson(
    Map<String, dynamic> json) {
  return _UserAccountSuspension.fromJson(json);
}

/// @nodoc
mixin _$UserAccountSuspension {
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;
  List<Group>? get groups => throw _privateConstructorUsedError;
  List<dynamic>? get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_kyc_verified')
  bool? get isKycVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_only')
  bool? get socialOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_suspended')
  bool? get isSuspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_profile')
  bool? get hasProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccountSuspensionCopyWith<UserAccountSuspension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountSuspensionCopyWith<$Res> {
  factory $UserAccountSuspensionCopyWith(UserAccountSuspension value,
          $Res Function(UserAccountSuspension) then) =
      _$UserAccountSuspensionCopyWithImpl<$Res, UserAccountSuspension>;
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? phone,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_verified') bool? isVerified,
      List<Group>? groups,
      List<dynamic>? permissions,
      @JsonKey(name: 'is_kyc_verified') bool? isKycVerified,
      @JsonKey(name: 'social_only') bool? socialOnly,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_suspended') bool? isSuspended,
      @JsonKey(name: 'has_profile') bool? hasProfile});
}

/// @nodoc
class _$UserAccountSuspensionCopyWithImpl<$Res,
        $Val extends UserAccountSuspension>
    implements $UserAccountSuspensionCopyWith<$Res> {
  _$UserAccountSuspensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? isVerified = freezed,
    Object? groups = freezed,
    Object? permissions = freezed,
    Object? isKycVerified = freezed,
    Object? socialOnly = freezed,
    Object? createdAt = freezed,
    Object? isSuspended = freezed,
    Object? hasProfile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isKycVerified: freezed == isKycVerified
          ? _value.isKycVerified
          : isKycVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      socialOnly: freezed == socialOnly
          ? _value.socialOnly
          : socialOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSuspended: freezed == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasProfile: freezed == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAccountSuspensionCopyWith<$Res>
    implements $UserAccountSuspensionCopyWith<$Res> {
  factory _$$_UserAccountSuspensionCopyWith(_$_UserAccountSuspension value,
          $Res Function(_$_UserAccountSuspension) then) =
      __$$_UserAccountSuspensionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? phone,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_verified') bool? isVerified,
      List<Group>? groups,
      List<dynamic>? permissions,
      @JsonKey(name: 'is_kyc_verified') bool? isKycVerified,
      @JsonKey(name: 'social_only') bool? socialOnly,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_suspended') bool? isSuspended,
      @JsonKey(name: 'has_profile') bool? hasProfile});
}

/// @nodoc
class __$$_UserAccountSuspensionCopyWithImpl<$Res>
    extends _$UserAccountSuspensionCopyWithImpl<$Res, _$_UserAccountSuspension>
    implements _$$_UserAccountSuspensionCopyWith<$Res> {
  __$$_UserAccountSuspensionCopyWithImpl(_$_UserAccountSuspension _value,
      $Res Function(_$_UserAccountSuspension) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? isVerified = freezed,
    Object? groups = freezed,
    Object? permissions = freezed,
    Object? isKycVerified = freezed,
    Object? socialOnly = freezed,
    Object? createdAt = freezed,
    Object? isSuspended = freezed,
    Object? hasProfile = freezed,
  }) {
    return _then(_$_UserAccountSuspension(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isKycVerified: freezed == isKycVerified
          ? _value.isKycVerified
          : isKycVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      socialOnly: freezed == socialOnly
          ? _value.socialOnly
          : socialOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSuspended: freezed == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasProfile: freezed == hasProfile
          ? _value.hasProfile
          : hasProfile // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAccountSuspension implements _UserAccountSuspension {
  const _$_UserAccountSuspension(
      {this.id,
      this.email,
      this.phone,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_verified') this.isVerified,
      final List<Group>? groups,
      final List<dynamic>? permissions,
      @JsonKey(name: 'is_kyc_verified') this.isKycVerified,
      @JsonKey(name: 'social_only') this.socialOnly,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'is_suspended') this.isSuspended,
      @JsonKey(name: 'has_profile') this.hasProfile})
      : _groups = groups,
        _permissions = permissions;

  factory _$_UserAccountSuspension.fromJson(Map<String, dynamic> json) =>
      _$$_UserAccountSuspensionFromJson(json);

  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  final List<Group>? _groups;
  @override
  List<Group>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _permissions;
  @override
  List<dynamic>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_kyc_verified')
  final bool? isKycVerified;
  @override
  @JsonKey(name: 'social_only')
  final bool? socialOnly;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'is_suspended')
  final bool? isSuspended;
  @override
  @JsonKey(name: 'has_profile')
  final bool? hasProfile;

  @override
  String toString() {
    return 'UserAccountSuspension(id: $id, email: $email, phone: $phone, isActive: $isActive, isVerified: $isVerified, groups: $groups, permissions: $permissions, isKycVerified: $isKycVerified, socialOnly: $socialOnly, createdAt: $createdAt, isSuspended: $isSuspended, hasProfile: $hasProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAccountSuspension &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.isKycVerified, isKycVerified) ||
                other.isKycVerified == isKycVerified) &&
            (identical(other.socialOnly, socialOnly) ||
                other.socialOnly == socialOnly) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.hasProfile, hasProfile) ||
                other.hasProfile == hasProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      phone,
      isActive,
      isVerified,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_permissions),
      isKycVerified,
      socialOnly,
      createdAt,
      isSuspended,
      hasProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAccountSuspensionCopyWith<_$_UserAccountSuspension> get copyWith =>
      __$$_UserAccountSuspensionCopyWithImpl<_$_UserAccountSuspension>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAccountSuspensionToJson(
      this,
    );
  }
}

abstract class _UserAccountSuspension implements UserAccountSuspension {
  const factory _UserAccountSuspension(
          {final String? id,
          final String? email,
          final String? phone,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'is_verified') final bool? isVerified,
          final List<Group>? groups,
          final List<dynamic>? permissions,
          @JsonKey(name: 'is_kyc_verified') final bool? isKycVerified,
          @JsonKey(name: 'social_only') final bool? socialOnly,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'is_suspended') final bool? isSuspended,
          @JsonKey(name: 'has_profile') final bool? hasProfile}) =
      _$_UserAccountSuspension;

  factory _UserAccountSuspension.fromJson(Map<String, dynamic> json) =
      _$_UserAccountSuspension.fromJson;

  @override
  String? get id;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  List<Group>? get groups;
  @override
  List<dynamic>? get permissions;
  @override
  @JsonKey(name: 'is_kyc_verified')
  bool? get isKycVerified;
  @override
  @JsonKey(name: 'social_only')
  bool? get socialOnly;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'is_suspended')
  bool? get isSuspended;
  @override
  @JsonKey(name: 'has_profile')
  bool? get hasProfile;
  @override
  @JsonKey(ignore: true)
  _$$_UserAccountSuspensionCopyWith<_$_UserAccountSuspension> get copyWith =>
      throw _privateConstructorUsedError;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  int? get id => throw _privateConstructorUsedError;
  List<Permission>? get permissions => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call({int? id, List<Permission>? permissions, String? name});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? permissions = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$_GroupCopyWith(_$_Group value, $Res Function(_$_Group) then) =
      __$$_GroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, List<Permission>? permissions, String? name});
}

/// @nodoc
class __$$_GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res, _$_Group>
    implements _$$_GroupCopyWith<$Res> {
  __$$_GroupCopyWithImpl(_$_Group _value, $Res Function(_$_Group) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? permissions = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Group(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<Permission>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  const _$_Group({this.id, final List<Permission>? permissions, this.name})
      : _permissions = permissions;

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override
  final int? id;
  final List<Permission>? _permissions;
  @override
  List<Permission>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;

  @override
  String toString() {
    return 'Group(id: $id, permissions: $permissions, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Group &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_permissions), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      __$$_GroupCopyWithImpl<_$_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {final int? id,
      final List<Permission>? permissions,
      final String? name}) = _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  int? get id;
  @override
  List<Permission>? get permissions;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      throw _privateConstructorUsedError;
}

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return _Permission.fromJson(json);
}

/// @nodoc
mixin _$Permission {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get codename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res, Permission>;
  @useResult
  $Res call({int? id, String? name, String? codename});
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res, $Val extends Permission>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? codename = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      codename: freezed == codename
          ? _value.codename
          : codename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PermissionCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$_PermissionCopyWith(
          _$_Permission value, $Res Function(_$_Permission) then) =
      __$$_PermissionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? codename});
}

/// @nodoc
class __$$_PermissionCopyWithImpl<$Res>
    extends _$PermissionCopyWithImpl<$Res, _$_Permission>
    implements _$$_PermissionCopyWith<$Res> {
  __$$_PermissionCopyWithImpl(
      _$_Permission _value, $Res Function(_$_Permission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? codename = freezed,
  }) {
    return _then(_$_Permission(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      codename: freezed == codename
          ? _value.codename
          : codename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Permission implements _Permission {
  const _$_Permission({this.id, this.name, this.codename});

  factory _$_Permission.fromJson(Map<String, dynamic> json) =>
      _$$_PermissionFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? codename;

  @override
  String toString() {
    return 'Permission(id: $id, name: $name, codename: $codename)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Permission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.codename, codename) ||
                other.codename == codename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, codename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionCopyWith<_$_Permission> get copyWith =>
      __$$_PermissionCopyWithImpl<_$_Permission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PermissionToJson(
      this,
    );
  }
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {final int? id,
      final String? name,
      final String? codename}) = _$_Permission;

  factory _Permission.fromJson(Map<String, dynamic> json) =
      _$_Permission.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get codename;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionCopyWith<_$_Permission> get copyWith =>
      throw _privateConstructorUsedError;
}
