// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskerProfile taskerProfile) taskerProfileResult,
    required TResult Function(TaskEntityService taskEntityService)
        taskEntityServiceResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskerProfile taskerProfile)? taskerProfileResult,
    TResult? Function(TaskEntityService taskEntityService)?
        taskEntityServiceResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskerProfile taskerProfile)? taskerProfileResult,
    TResult Function(TaskEntityService taskEntityService)?
        taskEntityServiceResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskerProfileResult value) taskerProfileResult,
    required TResult Function(_TaskEntityServiceResult value)
        taskEntityServiceResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskerProfileResult value)? taskerProfileResult,
    TResult? Function(_TaskEntityServiceResult value)? taskEntityServiceResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskerProfileResult value)? taskerProfileResult,
    TResult Function(_TaskEntityServiceResult value)? taskEntityServiceResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TaskerProfileResultCopyWith<$Res> {
  factory _$$_TaskerProfileResultCopyWith(_$_TaskerProfileResult value,
          $Res Function(_$_TaskerProfileResult) then) =
      __$$_TaskerProfileResultCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskerProfile taskerProfile});

  $TaskerProfileCopyWith<$Res> get taskerProfile;
}

/// @nodoc
class __$$_TaskerProfileResultCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$_TaskerProfileResult>
    implements _$$_TaskerProfileResultCopyWith<$Res> {
  __$$_TaskerProfileResultCopyWithImpl(_$_TaskerProfileResult _value,
      $Res Function(_$_TaskerProfileResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskerProfile = null,
  }) {
    return _then(_$_TaskerProfileResult(
      null == taskerProfile
          ? _value.taskerProfile
          : taskerProfile // ignore: cast_nullable_to_non_nullable
              as TaskerProfile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskerProfileCopyWith<$Res> get taskerProfile {
    return $TaskerProfileCopyWith<$Res>(_value.taskerProfile, (value) {
      return _then(_value.copyWith(taskerProfile: value));
    });
  }
}

/// @nodoc

class _$_TaskerProfileResult extends _TaskerProfileResult {
  const _$_TaskerProfileResult(this.taskerProfile) : super._();

  @override
  final TaskerProfile taskerProfile;

  @override
  String toString() {
    return 'SearchResult.taskerProfileResult(taskerProfile: $taskerProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskerProfileResult &&
            (identical(other.taskerProfile, taskerProfile) ||
                other.taskerProfile == taskerProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskerProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskerProfileResultCopyWith<_$_TaskerProfileResult> get copyWith =>
      __$$_TaskerProfileResultCopyWithImpl<_$_TaskerProfileResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskerProfile taskerProfile) taskerProfileResult,
    required TResult Function(TaskEntityService taskEntityService)
        taskEntityServiceResult,
  }) {
    return taskerProfileResult(taskerProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskerProfile taskerProfile)? taskerProfileResult,
    TResult? Function(TaskEntityService taskEntityService)?
        taskEntityServiceResult,
  }) {
    return taskerProfileResult?.call(taskerProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskerProfile taskerProfile)? taskerProfileResult,
    TResult Function(TaskEntityService taskEntityService)?
        taskEntityServiceResult,
    required TResult orElse(),
  }) {
    if (taskerProfileResult != null) {
      return taskerProfileResult(taskerProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskerProfileResult value) taskerProfileResult,
    required TResult Function(_TaskEntityServiceResult value)
        taskEntityServiceResult,
  }) {
    return taskerProfileResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskerProfileResult value)? taskerProfileResult,
    TResult? Function(_TaskEntityServiceResult value)? taskEntityServiceResult,
  }) {
    return taskerProfileResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskerProfileResult value)? taskerProfileResult,
    TResult Function(_TaskEntityServiceResult value)? taskEntityServiceResult,
    required TResult orElse(),
  }) {
    if (taskerProfileResult != null) {
      return taskerProfileResult(this);
    }
    return orElse();
  }
}

abstract class _TaskerProfileResult extends SearchResult {
  const factory _TaskerProfileResult(final TaskerProfile taskerProfile) =
      _$_TaskerProfileResult;
  const _TaskerProfileResult._() : super._();

  TaskerProfile get taskerProfile;
  @JsonKey(ignore: true)
  _$$_TaskerProfileResultCopyWith<_$_TaskerProfileResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TaskEntityServiceResultCopyWith<$Res> {
  factory _$$_TaskEntityServiceResultCopyWith(_$_TaskEntityServiceResult value,
          $Res Function(_$_TaskEntityServiceResult) then) =
      __$$_TaskEntityServiceResultCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskEntityService taskEntityService});

  $TaskEntityServiceCopyWith<$Res> get taskEntityService;
}

/// @nodoc
class __$$_TaskEntityServiceResultCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$_TaskEntityServiceResult>
    implements _$$_TaskEntityServiceResultCopyWith<$Res> {
  __$$_TaskEntityServiceResultCopyWithImpl(_$_TaskEntityServiceResult _value,
      $Res Function(_$_TaskEntityServiceResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskEntityService = null,
  }) {
    return _then(_$_TaskEntityServiceResult(
      null == taskEntityService
          ? _value.taskEntityService
          : taskEntityService // ignore: cast_nullable_to_non_nullable
              as TaskEntityService,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskEntityServiceCopyWith<$Res> get taskEntityService {
    return $TaskEntityServiceCopyWith<$Res>(_value.taskEntityService, (value) {
      return _then(_value.copyWith(taskEntityService: value));
    });
  }
}

/// @nodoc

class _$_TaskEntityServiceResult extends _TaskEntityServiceResult {
  const _$_TaskEntityServiceResult(this.taskEntityService) : super._();

  @override
  final TaskEntityService taskEntityService;

  @override
  String toString() {
    return 'SearchResult.taskEntityServiceResult(taskEntityService: $taskEntityService)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskEntityServiceResult &&
            (identical(other.taskEntityService, taskEntityService) ||
                other.taskEntityService == taskEntityService));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskEntityService);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskEntityServiceResultCopyWith<_$_TaskEntityServiceResult>
      get copyWith =>
          __$$_TaskEntityServiceResultCopyWithImpl<_$_TaskEntityServiceResult>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskerProfile taskerProfile) taskerProfileResult,
    required TResult Function(TaskEntityService taskEntityService)
        taskEntityServiceResult,
  }) {
    return taskEntityServiceResult(taskEntityService);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskerProfile taskerProfile)? taskerProfileResult,
    TResult? Function(TaskEntityService taskEntityService)?
        taskEntityServiceResult,
  }) {
    return taskEntityServiceResult?.call(taskEntityService);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskerProfile taskerProfile)? taskerProfileResult,
    TResult Function(TaskEntityService taskEntityService)?
        taskEntityServiceResult,
    required TResult orElse(),
  }) {
    if (taskEntityServiceResult != null) {
      return taskEntityServiceResult(taskEntityService);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskerProfileResult value) taskerProfileResult,
    required TResult Function(_TaskEntityServiceResult value)
        taskEntityServiceResult,
  }) {
    return taskEntityServiceResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskerProfileResult value)? taskerProfileResult,
    TResult? Function(_TaskEntityServiceResult value)? taskEntityServiceResult,
  }) {
    return taskEntityServiceResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskerProfileResult value)? taskerProfileResult,
    TResult Function(_TaskEntityServiceResult value)? taskEntityServiceResult,
    required TResult orElse(),
  }) {
    if (taskEntityServiceResult != null) {
      return taskEntityServiceResult(this);
    }
    return orElse();
  }
}

abstract class _TaskEntityServiceResult extends SearchResult {
  const factory _TaskEntityServiceResult(
      final TaskEntityService taskEntityService) = _$_TaskEntityServiceResult;
  const _TaskEntityServiceResult._() : super._();

  TaskEntityService get taskEntityService;
  @JsonKey(ignore: true)
  _$$_TaskEntityServiceResultCopyWith<_$_TaskEntityServiceResult>
      get copyWith => throw _privateConstructorUsedError;
}
