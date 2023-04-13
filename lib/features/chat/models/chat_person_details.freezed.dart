// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_person_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatPersonDetails _$ChatPersonDetailsFromJson(Map<String, dynamic> json) {
  return _ChatPersonDetails.fromJson(json);
}

/// @nodoc
mixin _$ChatPersonDetails {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get groupName => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatPersonDetailsCopyWith<ChatPersonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPersonDetailsCopyWith<$Res> {
  factory $ChatPersonDetailsCopyWith(
          ChatPersonDetails value, $Res Function(ChatPersonDetails) then) =
      _$ChatPersonDetailsCopyWithImpl<$Res, ChatPersonDetails>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'profile_image') String? profileImage,
      String? lastMessage,
      String? groupName,
      String? date,
      bool? isRead});
}

/// @nodoc
class _$ChatPersonDetailsCopyWithImpl<$Res, $Val extends ChatPersonDetails>
    implements $ChatPersonDetailsCopyWith<$Res> {
  _$ChatPersonDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? profileImage = freezed,
    Object? lastMessage = freezed,
    Object? groupName = freezed,
    Object? date = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatPersonDetailsCopyWith<$Res>
    implements $ChatPersonDetailsCopyWith<$Res> {
  factory _$$_ChatPersonDetailsCopyWith(_$_ChatPersonDetails value,
          $Res Function(_$_ChatPersonDetails) then) =
      __$$_ChatPersonDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'profile_image') String? profileImage,
      String? lastMessage,
      String? groupName,
      String? date,
      bool? isRead});
}

/// @nodoc
class __$$_ChatPersonDetailsCopyWithImpl<$Res>
    extends _$ChatPersonDetailsCopyWithImpl<$Res, _$_ChatPersonDetails>
    implements _$$_ChatPersonDetailsCopyWith<$Res> {
  __$$_ChatPersonDetailsCopyWithImpl(
      _$_ChatPersonDetails _value, $Res Function(_$_ChatPersonDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? profileImage = freezed,
    Object? lastMessage = freezed,
    Object? groupName = freezed,
    Object? date = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_$_ChatPersonDetails(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatPersonDetails implements _ChatPersonDetails {
  const _$_ChatPersonDetails(
      {this.id,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'profile_image') this.profileImage,
      this.lastMessage,
      this.groupName,
      this.date,
      this.isRead});

  factory _$_ChatPersonDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ChatPersonDetailsFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  final String? lastMessage;
  @override
  final String? groupName;
  @override
  final String? date;
  @override
  final bool? isRead;

  @override
  String toString() {
    return 'ChatPersonDetails(id: $id, fullName: $fullName, profileImage: $profileImage, lastMessage: $lastMessage, groupName: $groupName, date: $date, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatPersonDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, profileImage,
      lastMessage, groupName, date, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatPersonDetailsCopyWith<_$_ChatPersonDetails> get copyWith =>
      __$$_ChatPersonDetailsCopyWithImpl<_$_ChatPersonDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatPersonDetailsToJson(
      this,
    );
  }
}

abstract class _ChatPersonDetails implements ChatPersonDetails {
  const factory _ChatPersonDetails(
      {final String? id,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'profile_image') final String? profileImage,
      final String? lastMessage,
      final String? groupName,
      final String? date,
      final bool? isRead}) = _$_ChatPersonDetails;

  factory _ChatPersonDetails.fromJson(Map<String, dynamic> json) =
      _$_ChatPersonDetails.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  String? get lastMessage;
  @override
  String? get groupName;
  @override
  String? get date;
  @override
  bool? get isRead;
  @override
  @JsonKey(ignore: true)
  _$$_ChatPersonDetailsCopyWith<_$_ChatPersonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
