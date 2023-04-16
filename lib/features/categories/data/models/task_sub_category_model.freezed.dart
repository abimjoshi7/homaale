// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_sub_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskSubCategoryModel _$TaskSubCategoryModelFromJson(Map<String, dynamic> json) {
  return _TaskSubCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$TaskSubCategoryModel {
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskSubCategoryModelCopyWith<TaskSubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskSubCategoryModelCopyWith<$Res> {
  factory $TaskSubCategoryModelCopyWith(TaskSubCategoryModel value,
          $Res Function(TaskSubCategoryModel) then) =
      _$TaskSubCategoryModelCopyWithImpl<$Res, TaskSubCategoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      List<Result>? result});
}

/// @nodoc
class _$TaskSubCategoryModelCopyWithImpl<$Res,
        $Val extends TaskSubCategoryModel>
    implements $TaskSubCategoryModelCopyWith<$Res> {
  _$TaskSubCategoryModelCopyWithImpl(this._value, this._then);

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
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_TaskSubCategoryModelCopyWith<$Res>
    implements $TaskSubCategoryModelCopyWith<$Res> {
  factory _$$_TaskSubCategoryModelCopyWith(_$_TaskSubCategoryModel value,
          $Res Function(_$_TaskSubCategoryModel) then) =
      __$$_TaskSubCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      List<Result>? result});
}

/// @nodoc
class __$$_TaskSubCategoryModelCopyWithImpl<$Res>
    extends _$TaskSubCategoryModelCopyWithImpl<$Res, _$_TaskSubCategoryModel>
    implements _$$_TaskSubCategoryModelCopyWith<$Res> {
  __$$_TaskSubCategoryModelCopyWithImpl(_$_TaskSubCategoryModel _value,
      $Res Function(_$_TaskSubCategoryModel) _then)
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
    return _then(_$_TaskSubCategoryModel(
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
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_TaskSubCategoryModel implements _TaskSubCategoryModel {
  const _$_TaskSubCategoryModel(
      {@JsonKey(name: "total_pages") this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: "page_size") this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_TaskSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskSubCategoryModelFromJson(json);

  @override
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @override
  final int? count;
  @override
  final int? current;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  @JsonKey(name: "page_size")
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
    return 'TaskSubCategoryModel(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskSubCategoryModel &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPages, count, current, next,
      previous, pageSize, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskSubCategoryModelCopyWith<_$_TaskSubCategoryModel> get copyWith =>
      __$$_TaskSubCategoryModelCopyWithImpl<_$_TaskSubCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskSubCategoryModelToJson(
      this,
    );
  }
}

abstract class _TaskSubCategoryModel implements TaskSubCategoryModel {
  const factory _TaskSubCategoryModel(
      {@JsonKey(name: "total_pages") final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: "page_size") final int? pageSize,
      final List<Result>? result}) = _$_TaskSubCategoryModel;

  factory _TaskSubCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_TaskSubCategoryModel.fromJson;

  @override
  @JsonKey(name: "total_pages")
  int? get totalPages;
  @override
  int? get count;
  @override
  int? get current;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(name: "page_size")
  int? get pageSize;
  @override
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_TaskSubCategoryModelCopyWith<_$_TaskSubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  dynamic get icon => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "media_limit")
  int? get mediaLimit => throw _privateConstructorUsedError;
  int? get parent => throw _privateConstructorUsedError;

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
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      String? name,
      int? level,
      dynamic icon,
      String? slug,
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "media_limit") int? mediaLimit,
      int? parent});
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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? icon = freezed,
    Object? slug = freezed,
    Object? isActive = freezed,
    Object? mediaLimit = freezed,
    Object? parent = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaLimit: freezed == mediaLimit
          ? _value.mediaLimit
          : mediaLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      String? name,
      int? level,
      dynamic icon,
      String? slug,
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "media_limit") int? mediaLimit,
      int? parent});
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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? icon = freezed,
    Object? slug = freezed,
    Object? isActive = freezed,
    Object? mediaLimit = freezed,
    Object? parent = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaLimit: freezed == mediaLimit
          ? _value.mediaLimit
          : mediaLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.name,
      this.level,
      this.icon,
      this.slug,
      @JsonKey(name: "is_active") this.isActive,
      @JsonKey(name: "media_limit") this.mediaLimit,
      this.parent});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  final String? name;
  @override
  final int? level;
  @override
  final dynamic icon;
  @override
  final String? slug;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  @JsonKey(name: "media_limit")
  final int? mediaLimit;
  @override
  final int? parent;

  @override
  String toString() {
    return 'Result(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, level: $level, icon: $icon, slug: $slug, isActive: $isActive, mediaLimit: $mediaLimit, parent: $parent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.mediaLimit, mediaLimit) ||
                other.mediaLimit == mediaLimit) &&
            (identical(other.parent, parent) || other.parent == parent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      name,
      level,
      const DeepCollectionEquality().hash(icon),
      slug,
      isActive,
      mediaLimit,
      parent);

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
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt,
      final String? name,
      final int? level,
      final dynamic icon,
      final String? slug,
      @JsonKey(name: "is_active") final bool? isActive,
      @JsonKey(name: "media_limit") final int? mediaLimit,
      final int? parent}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  String? get name;
  @override
  int? get level;
  @override
  dynamic get icon;
  @override
  String? get slug;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  @JsonKey(name: "media_limit")
  int? get mediaLimit;
  @override
  int? get parent;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
