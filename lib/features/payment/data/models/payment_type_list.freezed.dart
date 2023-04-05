// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_type_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentTypeList _$PaymentTypeListFromJson(Map<String, dynamic> json) {
  return _PaymentTypeList.fromJson(json);
}

/// @nodoc
mixin _$PaymentTypeList {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  dynamic get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentTypeListCopyWith<PaymentTypeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTypeListCopyWith<$Res> {
  factory $PaymentTypeListCopyWith(
          PaymentTypeList value, $Res Function(PaymentTypeList) then) =
      _$PaymentTypeListCopyWithImpl<$Res, PaymentTypeList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      dynamic next,
      dynamic previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Result>? result});
}

/// @nodoc
class _$PaymentTypeListCopyWithImpl<$Res, $Val extends PaymentTypeList>
    implements $PaymentTypeListCopyWith<$Res> {
  _$PaymentTypeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = freezed,
    Object? count = freezed,
    Object? current = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentTypeListCopyWith<$Res>
    implements $PaymentTypeListCopyWith<$Res> {
  factory _$$_PaymentTypeListCopyWith(
          _$_PaymentTypeList value, $Res Function(_$_PaymentTypeList) then) =
      __$$_PaymentTypeListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      dynamic next,
      dynamic previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Result>? result});
}

/// @nodoc
class __$$_PaymentTypeListCopyWithImpl<$Res>
    extends _$PaymentTypeListCopyWithImpl<$Res, _$_PaymentTypeList>
    implements _$$_PaymentTypeListCopyWith<$Res> {
  __$$_PaymentTypeListCopyWithImpl(
      _$_PaymentTypeList _value, $Res Function(_$_PaymentTypeList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = freezed,
    Object? count = freezed,
    Object? current = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_PaymentTypeList(
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentTypeList implements _PaymentTypeList {
  const _$_PaymentTypeList(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_PaymentTypeList.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentTypeListFromJson(json);

  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @override
  final int? count;
  @override
  final int? current;
  @override
  final dynamic next;
  @override
  final dynamic previous;
  @override
  @JsonKey(name: 'page_size')
  final int? pageSize;
  final List<Result>? _result;
  @override
  List<Result>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentTypeList(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentTypeList &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPages,
      count,
      current,
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(previous),
      pageSize,
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentTypeListCopyWith<_$_PaymentTypeList> get copyWith =>
      __$$_PaymentTypeListCopyWithImpl<_$_PaymentTypeList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentTypeListToJson(
      this,
    );
  }
}

abstract class _PaymentTypeList implements PaymentTypeList {
  const factory _PaymentTypeList(
      {@JsonKey(name: 'total_pages') final int? totalPages,
      final int? count,
      final int? current,
      final dynamic next,
      final dynamic previous,
      @JsonKey(name: 'page_size') final int? pageSize,
      final List<Result>? result}) = _$_PaymentTypeList;

  factory _PaymentTypeList.fromJson(Map<String, dynamic> json) =
      _$_PaymentTypeList.fromJson;

  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  int? get count;
  @override
  int? get current;
  @override
  dynamic get next;
  @override
  dynamic get previous;
  @override
  @JsonKey(name: 'page_size')
  int? get pageSize;
  @override
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentTypeListCopyWith<_$_PaymentTypeList> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumb_nail')
  dynamic get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? logo,
      String? type,
      @JsonKey(name: 'thumb_nail') dynamic thumbnail});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? logo = freezed,
    Object? type = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? logo,
      String? type,
      @JsonKey(name: 'thumb_nail') dynamic thumbnail});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? logo = freezed,
    Object? type = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      this.name,
      this.slug,
      this.logo,
      this.type,
      @JsonKey(name: 'thumb_nail') this.thumbnail});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? logo;
  @override
  final String? type;
  @override
  @JsonKey(name: 'thumb_nail')
  final dynamic thumbnail;

  @override
  String toString() {
    return 'Result(id: $id, name: $name, slug: $slug, logo: $logo, type: $type, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, logo, type,
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {final int? id,
      final String? name,
      final String? slug,
      final String? logo,
      final String? type,
      @JsonKey(name: 'thumb_nail') final dynamic thumbnail}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  String? get logo;
  @override
  String? get type;
  @override
  @JsonKey(name: 'thumb_nail')
  dynamic get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
