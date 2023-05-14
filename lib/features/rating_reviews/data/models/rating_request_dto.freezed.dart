// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingRequestDto _$RatingRequestDtoFromJson(Map<String, dynamic> json) {
  return _RatingRequestDto.fromJson(json);
}

/// @nodoc
mixin _$RatingRequestDto {
  int? get rating => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingRequestDtoCopyWith<RatingRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingRequestDtoCopyWith<$Res> {
  factory $RatingRequestDtoCopyWith(
          RatingRequestDto value, $Res Function(RatingRequestDto) then) =
      _$RatingRequestDtoCopyWithImpl<$Res, RatingRequestDto>;
  @useResult
  $Res call({int? rating, String? task, String? review});
}

/// @nodoc
class _$RatingRequestDtoCopyWithImpl<$Res, $Val extends RatingRequestDto>
    implements $RatingRequestDtoCopyWith<$Res> {
  _$RatingRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? task = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingRequestDtoCopyWith<$Res>
    implements $RatingRequestDtoCopyWith<$Res> {
  factory _$$_RatingRequestDtoCopyWith(
          _$_RatingRequestDto value, $Res Function(_$_RatingRequestDto) then) =
      __$$_RatingRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? rating, String? task, String? review});
}

/// @nodoc
class __$$_RatingRequestDtoCopyWithImpl<$Res>
    extends _$RatingRequestDtoCopyWithImpl<$Res, _$_RatingRequestDto>
    implements _$$_RatingRequestDtoCopyWith<$Res> {
  __$$_RatingRequestDtoCopyWithImpl(
      _$_RatingRequestDto _value, $Res Function(_$_RatingRequestDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? task = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_RatingRequestDto(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingRequestDto implements _RatingRequestDto {
  const _$_RatingRequestDto({this.rating, this.task, this.review});

  factory _$_RatingRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_RatingRequestDtoFromJson(json);

  @override
  final int? rating;
  @override
  final String? task;
  @override
  final String? review;

  @override
  String toString() {
    return 'RatingRequestDto(rating: $rating, task: $task, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingRequestDto &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rating, task, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingRequestDtoCopyWith<_$_RatingRequestDto> get copyWith =>
      __$$_RatingRequestDtoCopyWithImpl<_$_RatingRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingRequestDtoToJson(
      this,
    );
  }
}

abstract class _RatingRequestDto implements RatingRequestDto {
  const factory _RatingRequestDto(
      {final int? rating,
      final String? task,
      final String? review}) = _$_RatingRequestDto;

  factory _RatingRequestDto.fromJson(Map<String, dynamic> json) =
      _$_RatingRequestDto.fromJson;

  @override
  int? get rating;
  @override
  String? get task;
  @override
  String? get review;
  @override
  @JsonKey(ignore: true)
  _$$_RatingRequestDtoCopyWith<_$_RatingRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}
