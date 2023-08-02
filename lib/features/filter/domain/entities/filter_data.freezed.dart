// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterData<T> {
  List<T> get dataList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterDataCopyWith<T, FilterData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterDataCopyWith<T, $Res> {
  factory $FilterDataCopyWith(
          FilterData<T> value, $Res Function(FilterData<T>) then) =
      _$FilterDataCopyWithImpl<T, $Res, FilterData<T>>;
  @useResult
  $Res call({List<T> dataList});
}

/// @nodoc
class _$FilterDataCopyWithImpl<T, $Res, $Val extends FilterData<T>>
    implements $FilterDataCopyWith<T, $Res> {
  _$FilterDataCopyWithImpl(this._value, this._then);

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
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterDataCopyWith<T, $Res>
    implements $FilterDataCopyWith<T, $Res> {
  factory _$$_FilterDataCopyWith(
          _$_FilterData<T> value, $Res Function(_$_FilterData<T>) then) =
      __$$_FilterDataCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> dataList});
}

/// @nodoc
class __$$_FilterDataCopyWithImpl<T, $Res>
    extends _$FilterDataCopyWithImpl<T, $Res, _$_FilterData<T>>
    implements _$$_FilterDataCopyWith<T, $Res> {
  __$$_FilterDataCopyWithImpl(
      _$_FilterData<T> _value, $Res Function(_$_FilterData<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataList = null,
  }) {
    return _then(_$_FilterData<T>(
      dataList: null == dataList
          ? _value._dataList
          : dataList // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_FilterData<T> extends _FilterData<T> {
  const _$_FilterData({final List<T> dataList = const []})
      : _dataList = dataList,
        super._();

  final List<T> _dataList;
  @override
  @JsonKey()
  List<T> get dataList {
    if (_dataList is EqualUnmodifiableListView) return _dataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataList);
  }

  @override
  String toString() {
    return 'FilterData<$T>(dataList: $dataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterData<T> &&
            const DeepCollectionEquality().equals(other._dataList, _dataList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterDataCopyWith<T, _$_FilterData<T>> get copyWith =>
      __$$_FilterDataCopyWithImpl<T, _$_FilterData<T>>(this, _$identity);
}

abstract class _FilterData<T> extends FilterData<T> {
  const factory _FilterData({final List<T> dataList}) = _$_FilterData<T>;
  const _FilterData._() : super._();

  @override
  List<T> get dataList;
  @override
  @JsonKey(ignore: true)
  _$$_FilterDataCopyWith<T, _$_FilterData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
