// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_support_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostSupportTicket _$PostSupportTicketFromJson(Map<String, dynamic> json) {
  return _PostSupportTicket.fromJson(json);
}

/// @nodoc
mixin _$PostSupportTicket {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_id')
  String? get objectId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<dynamic>? get attachment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostSupportTicketCopyWith<PostSupportTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostSupportTicketCopyWith<$Res> {
  factory $PostSupportTicketCopyWith(
          PostSupportTicket value, $Res Function(PostSupportTicket) then) =
      _$PostSupportTicketCopyWithImpl<$Res, PostSupportTicket>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'update_at') DateTime? updatedAt,
      String? reason,
      String? description,
      @JsonKey(name: 'object_id') String? objectId,
      String? type,
      List<dynamic>? attachment});
}

/// @nodoc
class _$PostSupportTicketCopyWithImpl<$Res, $Val extends PostSupportTicket>
    implements $PostSupportTicketCopyWith<$Res> {
  _$PostSupportTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reason = freezed,
    Object? description = freezed,
    Object? objectId = freezed,
    Object? type = freezed,
    Object? attachment = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostSupportTicketCopyWith<$Res>
    implements $PostSupportTicketCopyWith<$Res> {
  factory _$$_PostSupportTicketCopyWith(_$_PostSupportTicket value,
          $Res Function(_$_PostSupportTicket) then) =
      __$$_PostSupportTicketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'update_at') DateTime? updatedAt,
      String? reason,
      String? description,
      @JsonKey(name: 'object_id') String? objectId,
      String? type,
      List<dynamic>? attachment});
}

/// @nodoc
class __$$_PostSupportTicketCopyWithImpl<$Res>
    extends _$PostSupportTicketCopyWithImpl<$Res, _$_PostSupportTicket>
    implements _$$_PostSupportTicketCopyWith<$Res> {
  __$$_PostSupportTicketCopyWithImpl(
      _$_PostSupportTicket _value, $Res Function(_$_PostSupportTicket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reason = freezed,
    Object? description = freezed,
    Object? objectId = freezed,
    Object? type = freezed,
    Object? attachment = freezed,
  }) {
    return _then(_$_PostSupportTicket(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value._attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostSupportTicket implements _PostSupportTicket {
  const _$_PostSupportTicket(
      {this.id,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'update_at') this.updatedAt,
      this.reason,
      this.description,
      @JsonKey(name: 'object_id') this.objectId,
      this.type,
      final List<dynamic>? attachment})
      : _attachment = attachment;

  factory _$_PostSupportTicket.fromJson(Map<String, dynamic> json) =>
      _$$_PostSupportTicketFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'update_at')
  final DateTime? updatedAt;
  @override
  final String? reason;
  @override
  final String? description;
  @override
  @JsonKey(name: 'object_id')
  final String? objectId;
  @override
  final String? type;
  final List<dynamic>? _attachment;
  @override
  List<dynamic>? get attachment {
    final value = _attachment;
    if (value == null) return null;
    if (_attachment is EqualUnmodifiableListView) return _attachment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PostSupportTicket(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, reason: $reason, description: $description, objectId: $objectId, type: $type, attachment: $attachment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostSupportTicket &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._attachment, _attachment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      reason,
      description,
      objectId,
      type,
      const DeepCollectionEquality().hash(_attachment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostSupportTicketCopyWith<_$_PostSupportTicket> get copyWith =>
      __$$_PostSupportTicketCopyWithImpl<_$_PostSupportTicket>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostSupportTicketToJson(
      this,
    );
  }
}

abstract class _PostSupportTicket implements PostSupportTicket {
  const factory _PostSupportTicket(
      {final int? id,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'update_at') final DateTime? updatedAt,
      final String? reason,
      final String? description,
      @JsonKey(name: 'object_id') final String? objectId,
      final String? type,
      final List<dynamic>? attachment}) = _$_PostSupportTicket;

  factory _PostSupportTicket.fromJson(Map<String, dynamic> json) =
      _$_PostSupportTicket.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'update_at')
  DateTime? get updatedAt;
  @override
  String? get reason;
  @override
  String? get description;
  @override
  @JsonKey(name: 'object_id')
  String? get objectId;
  @override
  String? get type;
  @override
  List<dynamic>? get attachment;
  @override
  @JsonKey(ignore: true)
  _$$_PostSupportTicketCopyWith<_$_PostSupportTicket> get copyWith =>
      throw _privateConstructorUsedError;
}
