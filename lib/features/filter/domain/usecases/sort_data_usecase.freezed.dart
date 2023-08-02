// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_data_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortParams {
  bool get isAscending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortParamsCopyWith<SortParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortParamsCopyWith<$Res> {
  factory $SortParamsCopyWith(
          SortParams value, $Res Function(SortParams) then) =
      _$SortParamsCopyWithImpl<$Res, SortParams>;
  @useResult
  $Res call({bool isAscending});
}

/// @nodoc
class _$SortParamsCopyWithImpl<$Res, $Val extends SortParams>
    implements $SortParamsCopyWith<$Res> {
  _$SortParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAscending = null,
  }) {
    return _then(_value.copyWith(
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortParamsCopyWith<$Res>
    implements $SortParamsCopyWith<$Res> {
  factory _$$_SortParamsCopyWith(
          _$_SortParams value, $Res Function(_$_SortParams) then) =
      __$$_SortParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAscending});
}

/// @nodoc
class __$$_SortParamsCopyWithImpl<$Res>
    extends _$SortParamsCopyWithImpl<$Res, _$_SortParams>
    implements _$$_SortParamsCopyWith<$Res> {
  __$$_SortParamsCopyWithImpl(
      _$_SortParams _value, $Res Function(_$_SortParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAscending = null,
  }) {
    return _then(_$_SortParams(
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SortParams extends _SortParams {
  const _$_SortParams({this.isAscending = false}) : super._();

  @override
  @JsonKey()
  final bool isAscending;

  @override
  String toString() {
    return 'SortParams(isAscending: $isAscending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortParams &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAscending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortParamsCopyWith<_$_SortParams> get copyWith =>
      __$$_SortParamsCopyWithImpl<_$_SortParams>(this, _$identity);
}

abstract class _SortParams extends SortParams {
  const factory _SortParams({final bool isAscending}) = _$_SortParams;
  const _SortParams._() : super._();

  @override
  bool get isAscending;
  @override
  @JsonKey(ignore: true)
  _$$_SortParamsCopyWith<_$_SortParams> get copyWith =>
      throw _privateConstructorUsedError;
}
