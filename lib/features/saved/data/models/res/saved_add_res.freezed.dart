// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_add_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedAddRes _$SavedAddResFromJson(Map<String, dynamic> json) {
  return _SavedAddRes.fromJson(json);
}

/// @nodoc
mixin _$SavedAddRes {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedAddResCopyWith<SavedAddRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedAddResCopyWith<$Res> {
  factory $SavedAddResCopyWith(
          SavedAddRes value, $Res Function(SavedAddRes) then) =
      _$SavedAddResCopyWithImpl<$Res, SavedAddRes>;
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class _$SavedAddResCopyWithImpl<$Res, $Val extends SavedAddRes>
    implements $SavedAddResCopyWith<$Res> {
  _$SavedAddResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedAddResCopyWith<$Res>
    implements $SavedAddResCopyWith<$Res> {
  factory _$$_SavedAddResCopyWith(
          _$_SavedAddRes value, $Res Function(_$_SavedAddRes) then) =
      __$$_SavedAddResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class __$$_SavedAddResCopyWithImpl<$Res>
    extends _$SavedAddResCopyWithImpl<$Res, _$_SavedAddRes>
    implements _$$_SavedAddResCopyWith<$Res> {
  __$$_SavedAddResCopyWithImpl(
      _$_SavedAddRes _value, $Res Function(_$_SavedAddRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_SavedAddRes(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedAddRes implements _SavedAddRes {
  const _$_SavedAddRes({this.status, this.message});

  factory _$_SavedAddRes.fromJson(Map<String, dynamic> json) =>
      _$$_SavedAddResFromJson(json);

  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'SavedAddRes(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedAddRes &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedAddResCopyWith<_$_SavedAddRes> get copyWith =>
      __$$_SavedAddResCopyWithImpl<_$_SavedAddRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedAddResToJson(
      this,
    );
  }
}

abstract class _SavedAddRes implements SavedAddRes {
  const factory _SavedAddRes({final String? status, final String? message}) =
      _$_SavedAddRes;

  factory _SavedAddRes.fromJson(Map<String, dynamic> json) =
      _$_SavedAddRes.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_SavedAddResCopyWith<_$_SavedAddRes> get copyWith =>
      throw _privateConstructorUsedError;
}
