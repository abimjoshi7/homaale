// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_submit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RedeemSubmitResponse _$RedeemSubmitResponseFromJson(Map<String, dynamic> json) {
  return _RedeemSubmitResponse.fromJson(json);
}

/// @nodoc
mixin _$RedeemSubmitResponse {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RedeemSubmitResponseCopyWith<RedeemSubmitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemSubmitResponseCopyWith<$Res> {
  factory $RedeemSubmitResponseCopyWith(RedeemSubmitResponse value,
          $Res Function(RedeemSubmitResponse) then) =
      _$RedeemSubmitResponseCopyWithImpl<$Res, RedeemSubmitResponse>;
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class _$RedeemSubmitResponseCopyWithImpl<$Res,
        $Val extends RedeemSubmitResponse>
    implements $RedeemSubmitResponseCopyWith<$Res> {
  _$RedeemSubmitResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_RedeemSubmitResponseCopyWith<$Res>
    implements $RedeemSubmitResponseCopyWith<$Res> {
  factory _$$_RedeemSubmitResponseCopyWith(_$_RedeemSubmitResponse value,
          $Res Function(_$_RedeemSubmitResponse) then) =
      __$$_RedeemSubmitResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class __$$_RedeemSubmitResponseCopyWithImpl<$Res>
    extends _$RedeemSubmitResponseCopyWithImpl<$Res, _$_RedeemSubmitResponse>
    implements _$$_RedeemSubmitResponseCopyWith<$Res> {
  __$$_RedeemSubmitResponseCopyWithImpl(_$_RedeemSubmitResponse _value,
      $Res Function(_$_RedeemSubmitResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_RedeemSubmitResponse(
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
class _$_RedeemSubmitResponse implements _RedeemSubmitResponse {
  const _$_RedeemSubmitResponse({this.status, this.message});

  factory _$_RedeemSubmitResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RedeemSubmitResponseFromJson(json);

  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'RedeemSubmitResponse(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedeemSubmitResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedeemSubmitResponseCopyWith<_$_RedeemSubmitResponse> get copyWith =>
      __$$_RedeemSubmitResponseCopyWithImpl<_$_RedeemSubmitResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RedeemSubmitResponseToJson(
      this,
    );
  }
}

abstract class _RedeemSubmitResponse implements RedeemSubmitResponse {
  const factory _RedeemSubmitResponse(
      {final String? status, final String? message}) = _$_RedeemSubmitResponse;

  factory _RedeemSubmitResponse.fromJson(Map<String, dynamic> json) =
      _$_RedeemSubmitResponse.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_RedeemSubmitResponseCopyWith<_$_RedeemSubmitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
