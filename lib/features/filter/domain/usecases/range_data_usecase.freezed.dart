// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'range_data_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RangeParams {
  String? get startValue => throw _privateConstructorUsedError;
  String? get endValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RangeParamsCopyWith<RangeParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeParamsCopyWith<$Res> {
  factory $RangeParamsCopyWith(
          RangeParams value, $Res Function(RangeParams) then) =
      _$RangeParamsCopyWithImpl<$Res, RangeParams>;
  @useResult
  $Res call({String? startValue, String? endValue});
}

/// @nodoc
class _$RangeParamsCopyWithImpl<$Res, $Val extends RangeParams>
    implements $RangeParamsCopyWith<$Res> {
  _$RangeParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startValue = freezed,
    Object? endValue = freezed,
  }) {
    return _then(_value.copyWith(
      startValue: freezed == startValue
          ? _value.startValue
          : startValue // ignore: cast_nullable_to_non_nullable
              as String?,
      endValue: freezed == endValue
          ? _value.endValue
          : endValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RangeParamsCopyWith<$Res>
    implements $RangeParamsCopyWith<$Res> {
  factory _$$_RangeParamsCopyWith(
          _$_RangeParams value, $Res Function(_$_RangeParams) then) =
      __$$_RangeParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? startValue, String? endValue});
}

/// @nodoc
class __$$_RangeParamsCopyWithImpl<$Res>
    extends _$RangeParamsCopyWithImpl<$Res, _$_RangeParams>
    implements _$$_RangeParamsCopyWith<$Res> {
  __$$_RangeParamsCopyWithImpl(
      _$_RangeParams _value, $Res Function(_$_RangeParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startValue = freezed,
    Object? endValue = freezed,
  }) {
    return _then(_$_RangeParams(
      startValue: freezed == startValue
          ? _value.startValue
          : startValue // ignore: cast_nullable_to_non_nullable
              as String?,
      endValue: freezed == endValue
          ? _value.endValue
          : endValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RangeParams extends _RangeParams {
  const _$_RangeParams({this.startValue, this.endValue}) : super._();

  @override
  final String? startValue;
  @override
  final String? endValue;

  @override
  String toString() {
    return 'RangeParams(startValue: $startValue, endValue: $endValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RangeParams &&
            (identical(other.startValue, startValue) ||
                other.startValue == startValue) &&
            (identical(other.endValue, endValue) ||
                other.endValue == endValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startValue, endValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RangeParamsCopyWith<_$_RangeParams> get copyWith =>
      __$$_RangeParamsCopyWithImpl<_$_RangeParams>(this, _$identity);
}

abstract class _RangeParams extends RangeParams {
  const factory _RangeParams(
      {final String? startValue, final String? endValue}) = _$_RangeParams;
  const _RangeParams._() : super._();

  @override
  String? get startValue;
  @override
  String? get endValue;
  @override
  @JsonKey(ignore: true)
  _$$_RangeParamsCopyWith<_$_RangeParams> get copyWith =>
      throw _privateConstructorUsedError;
}
