// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_submit_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingSubmitResponseDto _$RatingSubmitResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _RatingSubmitResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RatingSubmitResponseDto {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingSubmitResponseDtoCopyWith<RatingSubmitResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingSubmitResponseDtoCopyWith<$Res> {
  factory $RatingSubmitResponseDtoCopyWith(RatingSubmitResponseDto value,
          $Res Function(RatingSubmitResponseDto) then) =
      _$RatingSubmitResponseDtoCopyWithImpl<$Res, RatingSubmitResponseDto>;
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class _$RatingSubmitResponseDtoCopyWithImpl<$Res,
        $Val extends RatingSubmitResponseDto>
    implements $RatingSubmitResponseDtoCopyWith<$Res> {
  _$RatingSubmitResponseDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_RatingSubmitResponseDtoCopyWith<$Res>
    implements $RatingSubmitResponseDtoCopyWith<$Res> {
  factory _$$_RatingSubmitResponseDtoCopyWith(_$_RatingSubmitResponseDto value,
          $Res Function(_$_RatingSubmitResponseDto) then) =
      __$$_RatingSubmitResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class __$$_RatingSubmitResponseDtoCopyWithImpl<$Res>
    extends _$RatingSubmitResponseDtoCopyWithImpl<$Res,
        _$_RatingSubmitResponseDto>
    implements _$$_RatingSubmitResponseDtoCopyWith<$Res> {
  __$$_RatingSubmitResponseDtoCopyWithImpl(_$_RatingSubmitResponseDto _value,
      $Res Function(_$_RatingSubmitResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_RatingSubmitResponseDto(
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
class _$_RatingSubmitResponseDto implements _RatingSubmitResponseDto {
  const _$_RatingSubmitResponseDto({this.status, this.message});

  factory _$_RatingSubmitResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_RatingSubmitResponseDtoFromJson(json);

  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'RatingSubmitResponseDto(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingSubmitResponseDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingSubmitResponseDtoCopyWith<_$_RatingSubmitResponseDto>
      get copyWith =>
          __$$_RatingSubmitResponseDtoCopyWithImpl<_$_RatingSubmitResponseDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingSubmitResponseDtoToJson(
      this,
    );
  }
}

abstract class _RatingSubmitResponseDto implements RatingSubmitResponseDto {
  const factory _RatingSubmitResponseDto(
      {final String? status,
      final String? message}) = _$_RatingSubmitResponseDto;

  factory _RatingSubmitResponseDto.fromJson(Map<String, dynamic> json) =
      _$_RatingSubmitResponseDto.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_RatingSubmitResponseDtoCopyWith<_$_RatingSubmitResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}
