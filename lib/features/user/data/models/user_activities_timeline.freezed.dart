// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activities_timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserActivitiesTimeline _$UserActivitiesTimelineFromJson(
    Map<String, dynamic> json) {
  return _UserActivitiesTimeline.fromJson(json);
}

/// @nodoc
mixin _$UserActivitiesTimeline {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  dynamic get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserActivitiesTimelineCopyWith<UserActivitiesTimeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivitiesTimelineCopyWith<$Res> {
  factory $UserActivitiesTimelineCopyWith(UserActivitiesTimeline value,
          $Res Function(UserActivitiesTimeline) then) =
      _$UserActivitiesTimelineCopyWithImpl<$Res, UserActivitiesTimeline>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      dynamic previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Result>? result});
}

/// @nodoc
class _$UserActivitiesTimelineCopyWithImpl<$Res,
        $Val extends UserActivitiesTimeline>
    implements $UserActivitiesTimelineCopyWith<$Res> {
  _$UserActivitiesTimelineCopyWithImpl(this._value, this._then);

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
abstract class _$$_UserActivitiesTimelineCopyWith<$Res>
    implements $UserActivitiesTimelineCopyWith<$Res> {
  factory _$$_UserActivitiesTimelineCopyWith(_$_UserActivitiesTimeline value,
          $Res Function(_$_UserActivitiesTimeline) then) =
      __$$_UserActivitiesTimelineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      dynamic previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Result>? result});
}

/// @nodoc
class __$$_UserActivitiesTimelineCopyWithImpl<$Res>
    extends _$UserActivitiesTimelineCopyWithImpl<$Res,
        _$_UserActivitiesTimeline>
    implements _$$_UserActivitiesTimelineCopyWith<$Res> {
  __$$_UserActivitiesTimelineCopyWithImpl(_$_UserActivitiesTimeline _value,
      $Res Function(_$_UserActivitiesTimeline) _then)
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
    return _then(_$_UserActivitiesTimeline(
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
class _$_UserActivitiesTimeline implements _UserActivitiesTimeline {
  const _$_UserActivitiesTimeline(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_UserActivitiesTimeline.fromJson(Map<String, dynamic> json) =>
      _$$_UserActivitiesTimelineFromJson(json);

  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @override
  final int? count;
  @override
  final int? current;
  @override
  final String? next;
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
    return 'UserActivitiesTimeline(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserActivitiesTimeline &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.next, next) || other.next == next) &&
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
      next,
      const DeepCollectionEquality().hash(previous),
      pageSize,
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserActivitiesTimelineCopyWith<_$_UserActivitiesTimeline> get copyWith =>
      __$$_UserActivitiesTimelineCopyWithImpl<_$_UserActivitiesTimeline>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserActivitiesTimelineToJson(
      this,
    );
  }
}

abstract class _UserActivitiesTimeline implements UserActivitiesTimeline {
  const factory _UserActivitiesTimeline(
      {@JsonKey(name: 'total_pages') final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final dynamic previous,
      @JsonKey(name: 'page_size') final int? pageSize,
      final List<Result>? result}) = _$_UserActivitiesTimeline;

  factory _UserActivitiesTimeline.fromJson(Map<String, dynamic> json) =
      _$_UserActivitiesTimeline.fromJson;

  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  int? get count;
  @override
  int? get current;
  @override
  String? get next;
  @override
  dynamic get previous;
  @override
  @JsonKey(name: 'page_size')
  int? get pageSize;
  @override
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_UserActivitiesTimelineCopyWith<_$_UserActivitiesTimeline> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_time')
  DateTime? get actionTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_id')
  String? get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_repr')
  String? get objectRepr => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'change_message')
  String? get changeMessage => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'content_type') String? contentType,
      @JsonKey(name: 'action_time') DateTime? actionTime,
      @JsonKey(name: 'object_id') String? objectId,
      @JsonKey(name: 'object_repr') String? objectRepr,
      String? action,
      @JsonKey(name: 'change_message') String? changeMessage,
      String? user});
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
    Object? contentType = freezed,
    Object? actionTime = freezed,
    Object? objectId = freezed,
    Object? objectRepr = freezed,
    Object? action = freezed,
    Object? changeMessage = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      actionTime: freezed == actionTime
          ? _value.actionTime
          : actionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      objectRepr: freezed == objectRepr
          ? _value.objectRepr
          : objectRepr // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      changeMessage: freezed == changeMessage
          ? _value.changeMessage
          : changeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'content_type') String? contentType,
      @JsonKey(name: 'action_time') DateTime? actionTime,
      @JsonKey(name: 'object_id') String? objectId,
      @JsonKey(name: 'object_repr') String? objectRepr,
      String? action,
      @JsonKey(name: 'change_message') String? changeMessage,
      String? user});
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
    Object? contentType = freezed,
    Object? actionTime = freezed,
    Object? objectId = freezed,
    Object? objectRepr = freezed,
    Object? action = freezed,
    Object? changeMessage = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      actionTime: freezed == actionTime
          ? _value.actionTime
          : actionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      objectRepr: freezed == objectRepr
          ? _value.objectRepr
          : objectRepr // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      changeMessage: freezed == changeMessage
          ? _value.changeMessage
          : changeMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      @JsonKey(name: 'content_type') this.contentType,
      @JsonKey(name: 'action_time') this.actionTime,
      @JsonKey(name: 'object_id') this.objectId,
      @JsonKey(name: 'object_repr') this.objectRepr,
      this.action,
      @JsonKey(name: 'change_message') this.changeMessage,
      this.user});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'content_type')
  final String? contentType;
  @override
  @JsonKey(name: 'action_time')
  final DateTime? actionTime;
  @override
  @JsonKey(name: 'object_id')
  final String? objectId;
  @override
  @JsonKey(name: 'object_repr')
  final String? objectRepr;
  @override
  final String? action;
  @override
  @JsonKey(name: 'change_message')
  final String? changeMessage;
  @override
  final String? user;

  @override
  String toString() {
    return 'Result(id: $id, contentType: $contentType, actionTime: $actionTime, objectId: $objectId, objectRepr: $objectRepr, action: $action, changeMessage: $changeMessage, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.actionTime, actionTime) ||
                other.actionTime == actionTime) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.objectRepr, objectRepr) ||
                other.objectRepr == objectRepr) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.changeMessage, changeMessage) ||
                other.changeMessage == changeMessage) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, contentType, actionTime,
      objectId, objectRepr, action, changeMessage, user);

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
      @JsonKey(name: 'content_type') final String? contentType,
      @JsonKey(name: 'action_time') final DateTime? actionTime,
      @JsonKey(name: 'object_id') final String? objectId,
      @JsonKey(name: 'object_repr') final String? objectRepr,
      final String? action,
      @JsonKey(name: 'change_message') final String? changeMessage,
      final String? user}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'content_type')
  String? get contentType;
  @override
  @JsonKey(name: 'action_time')
  DateTime? get actionTime;
  @override
  @JsonKey(name: 'object_id')
  String? get objectId;
  @override
  @JsonKey(name: 'object_repr')
  String? get objectRepr;
  @override
  String? get action;
  @override
  @JsonKey(name: 'change_message')
  String? get changeMessage;
  @override
  String? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
