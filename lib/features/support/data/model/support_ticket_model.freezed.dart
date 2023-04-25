// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportTicketModel _$SupportTicketModelFromJson(Map<String, dynamic> json) {
  return _SupportTicketModel.fromJson(json);
}

/// @nodoc
mixin _$SupportTicketModel {
  int? get id => throw _privateConstructorUsedError;
  SupportTicketType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Image>? get attachment => throw _privateConstructorUsedError;
  String? get object => throw _privateConstructorUsedError;
  @JsonKey(name: "object_type")
  String? get objectType => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: "object_id")
  String? get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_resolved")
  bool? get isResolved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportTicketModelCopyWith<SupportTicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportTicketModelCopyWith<$Res> {
  factory $SupportTicketModelCopyWith(
          SupportTicketModel value, $Res Function(SupportTicketModel) then) =
      _$SupportTicketModelCopyWithImpl<$Res, SupportTicketModel>;
  @useResult
  $Res call(
      {int? id,
      SupportTicketType? type,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      User? user,
      List<Image>? attachment,
      String? object,
      @JsonKey(name: "object_type") String? objectType,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "is_active") bool? isActive,
      String? status,
      String? reason,
      @JsonKey(name: "object_id") String? objectId,
      @JsonKey(name: "is_resolved") bool? isResolved});

  $SupportTicketTypeCopyWith<$Res>? get type;
  $CreatedByCopyWith<$Res>? get createdBy;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SupportTicketModelCopyWithImpl<$Res, $Val extends SupportTicketModel>
    implements $SupportTicketModelCopyWith<$Res> {
  _$SupportTicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? user = freezed,
    Object? attachment = freezed,
    Object? object = freezed,
    Object? objectType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? objectId = freezed,
    Object? isResolved = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SupportTicketType?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      objectType: freezed == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupportTicketTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $SupportTicketTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SupportTicketModelCopyWith<$Res>
    implements $SupportTicketModelCopyWith<$Res> {
  factory _$$_SupportTicketModelCopyWith(_$_SupportTicketModel value,
          $Res Function(_$_SupportTicketModel) then) =
      __$$_SupportTicketModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      SupportTicketType? type,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      User? user,
      List<Image>? attachment,
      String? object,
      @JsonKey(name: "object_type") String? objectType,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "is_active") bool? isActive,
      String? status,
      String? reason,
      @JsonKey(name: "object_id") String? objectId,
      @JsonKey(name: "is_resolved") bool? isResolved});

  @override
  $SupportTicketTypeCopyWith<$Res>? get type;
  @override
  $CreatedByCopyWith<$Res>? get createdBy;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_SupportTicketModelCopyWithImpl<$Res>
    extends _$SupportTicketModelCopyWithImpl<$Res, _$_SupportTicketModel>
    implements _$$_SupportTicketModelCopyWith<$Res> {
  __$$_SupportTicketModelCopyWithImpl(
      _$_SupportTicketModel _value, $Res Function(_$_SupportTicketModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? user = freezed,
    Object? attachment = freezed,
    Object? object = freezed,
    Object? objectType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? status = freezed,
    Object? reason = freezed,
    Object? objectId = freezed,
    Object? isResolved = freezed,
  }) {
    return _then(_$_SupportTicketModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SupportTicketType?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      attachment: freezed == attachment
          ? _value._attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      objectType: freezed == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportTicketModel implements _SupportTicketModel {
  const _$_SupportTicketModel(
      {this.id,
      this.type,
      @JsonKey(name: "created_by") this.createdBy,
      this.user,
      final List<Image>? attachment,
      this.object,
      @JsonKey(name: "object_type") this.objectType,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "is_active") this.isActive,
      this.status,
      this.reason,
      @JsonKey(name: "object_id") this.objectId,
      @JsonKey(name: "is_resolved") this.isResolved})
      : _attachment = attachment;

  factory _$_SupportTicketModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupportTicketModelFromJson(json);

  @override
  final int? id;
  @override
  final SupportTicketType? type;
  @override
  @JsonKey(name: "created_by")
  final CreatedBy? createdBy;
  @override
  final User? user;
  final List<Image>? _attachment;
  @override
  List<Image>? get attachment {
    final value = _attachment;
    if (value == null) return null;
    if (_attachment is EqualUnmodifiableListView) return _attachment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? object;
  @override
  @JsonKey(name: "object_type")
  final String? objectType;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String? status;
  @override
  final String? reason;
  @override
  @JsonKey(name: "object_id")
  final String? objectId;
  @override
  @JsonKey(name: "is_resolved")
  final bool? isResolved;

  @override
  String toString() {
    return 'SupportTicketModel(id: $id, type: $type, createdBy: $createdBy, user: $user, attachment: $attachment, object: $object, objectType: $objectType, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, status: $status, reason: $reason, objectId: $objectId, isResolved: $isResolved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportTicketModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._attachment, _attachment) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      createdBy,
      user,
      const DeepCollectionEquality().hash(_attachment),
      object,
      objectType,
      createdAt,
      updatedAt,
      isActive,
      status,
      reason,
      objectId,
      isResolved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportTicketModelCopyWith<_$_SupportTicketModel> get copyWith =>
      __$$_SupportTicketModelCopyWithImpl<_$_SupportTicketModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportTicketModelToJson(
      this,
    );
  }
}

abstract class _SupportTicketModel implements SupportTicketModel {
  const factory _SupportTicketModel(
          {final int? id,
          final SupportTicketType? type,
          @JsonKey(name: "created_by") final CreatedBy? createdBy,
          final User? user,
          final List<Image>? attachment,
          final String? object,
          @JsonKey(name: "object_type") final String? objectType,
          @JsonKey(name: "created_at") final DateTime? createdAt,
          @JsonKey(name: "updated_at") final DateTime? updatedAt,
          @JsonKey(name: "is_active") final bool? isActive,
          final String? status,
          final String? reason,
          @JsonKey(name: "object_id") final String? objectId,
          @JsonKey(name: "is_resolved") final bool? isResolved}) =
      _$_SupportTicketModel;

  factory _SupportTicketModel.fromJson(Map<String, dynamic> json) =
      _$_SupportTicketModel.fromJson;

  @override
  int? get id;
  @override
  SupportTicketType? get type;
  @override
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy;
  @override
  User? get user;
  @override
  List<Image>? get attachment;
  @override
  String? get object;
  @override
  @JsonKey(name: "object_type")
  String? get objectType;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  String? get status;
  @override
  String? get reason;
  @override
  @JsonKey(name: "object_id")
  String? get objectId;
  @override
  @JsonKey(name: "is_resolved")
  bool? get isResolved;
  @override
  @JsonKey(ignore: true)
  _$$_SupportTicketModelCopyWith<_$_SupportTicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SupportTicketType _$SupportTicketTypeFromJson(Map<String, dynamic> json) {
  return _SupportTicketType.fromJson(json);
}

/// @nodoc
mixin _$SupportTicketType {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportTicketTypeCopyWith<SupportTicketType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportTicketTypeCopyWith<$Res> {
  factory $SupportTicketTypeCopyWith(
          SupportTicketType value, $Res Function(SupportTicketType) then) =
      _$SupportTicketTypeCopyWithImpl<$Res, SupportTicketType>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$SupportTicketTypeCopyWithImpl<$Res, $Val extends SupportTicketType>
    implements $SupportTicketTypeCopyWith<$Res> {
  _$SupportTicketTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupportTicketTypeCopyWith<$Res>
    implements $SupportTicketTypeCopyWith<$Res> {
  factory _$$_SupportTicketTypeCopyWith(_$_SupportTicketType value,
          $Res Function(_$_SupportTicketType) then) =
      __$$_SupportTicketTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_SupportTicketTypeCopyWithImpl<$Res>
    extends _$SupportTicketTypeCopyWithImpl<$Res, _$_SupportTicketType>
    implements _$$_SupportTicketTypeCopyWith<$Res> {
  __$$_SupportTicketTypeCopyWithImpl(
      _$_SupportTicketType _value, $Res Function(_$_SupportTicketType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_SupportTicketType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportTicketType implements _SupportTicketType {
  const _$_SupportTicketType({this.id, this.name});

  factory _$_SupportTicketType.fromJson(Map<String, dynamic> json) =>
      _$$_SupportTicketTypeFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'SupportTicketType(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportTicketType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportTicketTypeCopyWith<_$_SupportTicketType> get copyWith =>
      __$$_SupportTicketTypeCopyWithImpl<_$_SupportTicketType>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportTicketTypeToJson(
      this,
    );
  }
}

abstract class _SupportTicketType implements SupportTicketType {
  const factory _SupportTicketType({final int? id, final String? name}) =
      _$_SupportTicketType;

  factory _SupportTicketType.fromJson(Map<String, dynamic> json) =
      _$_SupportTicketType.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_SupportTicketTypeCopyWith<_$_SupportTicketType> get copyWith =>
      throw _privateConstructorUsedError;
}
