// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterDto<T> _$FilterDtoFromJson<T>(Map<String, dynamic> json) {
  return _FilterDto<T>.fromJson(json);
}

/// @nodoc
mixin _$FilterDto<T> {
  List<dynamic> get dataList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterDtoCopyWith<T, FilterDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterDtoCopyWith<T, $Res> {
  factory $FilterDtoCopyWith(
          FilterDto<T> value, $Res Function(FilterDto<T>) then) =
      _$FilterDtoCopyWithImpl<T, $Res, FilterDto<T>>;
  @useResult
  $Res call({List<dynamic> dataList});
}

/// @nodoc
class _$FilterDtoCopyWithImpl<T, $Res, $Val extends FilterDto<T>>
    implements $FilterDtoCopyWith<T, $Res> {
  _$FilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataList = null,
  }) {
    return _then(_value.copyWith(
      dataList: null == dataList
          ? _value.dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterDtoCopyWith<T, $Res>
    implements $FilterDtoCopyWith<T, $Res> {
  factory _$$_FilterDtoCopyWith(
          _$_FilterDto<T> value, $Res Function(_$_FilterDto<T>) then) =
      __$$_FilterDtoCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<dynamic> dataList});
}

/// @nodoc
class __$$_FilterDtoCopyWithImpl<T, $Res>
    extends _$FilterDtoCopyWithImpl<T, $Res, _$_FilterDto<T>>
    implements _$$_FilterDtoCopyWith<T, $Res> {
  __$$_FilterDtoCopyWithImpl(
      _$_FilterDto<T> _value, $Res Function(_$_FilterDto<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataList = null,
  }) {
    return _then(_$_FilterDto<T>(
      dataList: null == dataList
          ? _value._dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterDto<T> extends _FilterDto<T> {
  const _$_FilterDto({final List<dynamic> dataList = const []})
      : _dataList = dataList,
        super._();

  factory _$_FilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_FilterDtoFromJson(json);

  final List<dynamic> _dataList;
  @override
  @JsonKey()
  List<dynamic> get dataList {
    if (_dataList is EqualUnmodifiableListView) return _dataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataList);
  }

  @override
  String toString() {
    return 'FilterDto<$T>(dataList: $dataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterDto<T> &&
            const DeepCollectionEquality().equals(other._dataList, _dataList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterDtoCopyWith<T, _$_FilterDto<T>> get copyWith =>
      __$$_FilterDtoCopyWithImpl<T, _$_FilterDto<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterDtoToJson<T>(
      this,
    );
  }
}

abstract class _FilterDto<T> extends FilterDto<T> {
  const factory _FilterDto({final List<dynamic> dataList}) = _$_FilterDto<T>;
  const _FilterDto._() : super._();

  factory _FilterDto.fromJson(Map<String, dynamic> json) =
      _$_FilterDto<T>.fromJson;

  @override
  List<dynamic> get dataList;
  @override
  @JsonKey(ignore: true)
  _$$_FilterDtoCopyWith<T, _$_FilterDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
