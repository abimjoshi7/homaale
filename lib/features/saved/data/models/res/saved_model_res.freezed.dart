// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_model_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedModelRes _$SavedModelResFromJson(Map<String, dynamic> json) {
  return _SavedModelRes.fromJson(json);
}

/// @nodoc
mixin _$SavedModelRes {
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  dynamic get previous => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "result")
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedModelResCopyWith<SavedModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedModelResCopyWith<$Res> {
  factory $SavedModelResCopyWith(
          SavedModelRes value, $Res Function(SavedModelRes) then) =
      _$SavedModelResCopyWithImpl<$Res, SavedModelRes>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      dynamic next,
      dynamic previous,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "result") List<Result>? result});
}

/// @nodoc
class _$SavedModelResCopyWithImpl<$Res, $Val extends SavedModelRes>
    implements $SavedModelResCopyWith<$Res> {
  _$SavedModelResCopyWithImpl(this._value, this._then);

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
abstract class _$$_SavedModelResCopyWith<$Res>
    implements $SavedModelResCopyWith<$Res> {
  factory _$$_SavedModelResCopyWith(
          _$_SavedModelRes value, $Res Function(_$_SavedModelRes) then) =
      __$$_SavedModelResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      dynamic next,
      dynamic previous,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "result") List<Result>? result});
}

/// @nodoc
class __$$_SavedModelResCopyWithImpl<$Res>
    extends _$SavedModelResCopyWithImpl<$Res, _$_SavedModelRes>
    implements _$$_SavedModelResCopyWith<$Res> {
  __$$_SavedModelResCopyWithImpl(
      _$_SavedModelRes _value, $Res Function(_$_SavedModelRes) _then)
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
    return _then(_$_SavedModelRes(
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
class _$_SavedModelRes implements _SavedModelRes {
  const _$_SavedModelRes(
      {@JsonKey(name: "total_pages") this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: "page_size") this.pageSize,
      @JsonKey(name: "result") final List<Result>? result})
      : _result = result;

  factory _$_SavedModelRes.fromJson(Map<String, dynamic> json) =>
      _$$_SavedModelResFromJson(json);

  @override
  @JsonKey(name: "total_pages")
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
  @JsonKey(name: "page_size")
  final int? pageSize;
  final List<Result>? _result;
  @override
  @JsonKey(name: "result")
  List<Result>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SavedModelRes(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedModelRes &&
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
  _$$_SavedModelResCopyWith<_$_SavedModelRes> get copyWith =>
      __$$_SavedModelResCopyWithImpl<_$_SavedModelRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedModelResToJson(
      this,
    );
  }
}

abstract class _SavedModelRes implements SavedModelRes {
  const factory _SavedModelRes(
      {@JsonKey(name: "total_pages") final int? totalPages,
      final int? count,
      final int? current,
      final dynamic next,
      final dynamic previous,
      @JsonKey(name: "page_size") final int? pageSize,
      @JsonKey(name: "result") final List<Result>? result}) = _$_SavedModelRes;

  factory _SavedModelRes.fromJson(Map<String, dynamic> json) =
      _$_SavedModelRes.fromJson;

  @override
  @JsonKey(name: "total_pages")
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
  @JsonKey(name: "page_size")
  int? get pageSize;
  @override
  @JsonKey(name: "result")
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_SavedModelResCopyWith<_$_SavedModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "object_id")
  String? get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: "content_type")
  int? get contentType => throw _privateConstructorUsedError;

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
      String? user,
      String? type,
      @JsonKey(name: "data") dynamic data,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "object_id") String? objectId,
      @JsonKey(name: "content_type") int? contentType});
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
    Object? user = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? objectId = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int?,
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
      String? user,
      String? type,
      @JsonKey(name: "data") dynamic data,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "object_id") String? objectId,
      @JsonKey(name: "content_type") int? contentType});
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
    Object? user = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? objectId = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      this.user,
      this.type,
      @JsonKey(name: "data") this.data,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "object_id") this.objectId,
      @JsonKey(name: "content_type") this.contentType});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  final String? user;
  @override
  final String? type;
  @override
  @JsonKey(name: "data")
  final dynamic data;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "object_id")
  final String? objectId;
  @override
  @JsonKey(name: "content_type")
  final int? contentType;

  @override
  String toString() {
    return 'Result(id: $id, user: $user, type: $type, data: $data, createdAt: $createdAt, updatedAt: $updatedAt, objectId: $objectId, contentType: $contentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      type,
      const DeepCollectionEquality().hash(data),
      createdAt,
      updatedAt,
      objectId,
      contentType);

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
      final String? user,
      final String? type,
      @JsonKey(name: "data") final dynamic data,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt,
      @JsonKey(name: "object_id") final String? objectId,
      @JsonKey(name: "content_type") final int? contentType}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  String? get user;
  @override
  String? get type;
  @override
  @JsonKey(name: "data")
  dynamic get data;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "object_id")
  String? get objectId;
  @override
  @JsonKey(name: "content_type")
  int? get contentType;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
