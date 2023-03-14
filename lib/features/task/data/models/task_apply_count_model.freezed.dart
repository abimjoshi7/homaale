// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_apply_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskApplyCountModel _$TaskApplyCountModelFromJson(Map<String, dynamic> json) {
  return _TaskApplyCountModel.fromJson(json);
}

/// @nodoc
mixin _$TaskApplyCountModel {
  List<Count>? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskApplyCountModelCopyWith<TaskApplyCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskApplyCountModelCopyWith<$Res> {
  factory $TaskApplyCountModelCopyWith(
          TaskApplyCountModel value, $Res Function(TaskApplyCountModel) then) =
      _$TaskApplyCountModelCopyWithImpl<$Res, TaskApplyCountModel>;
  @useResult
  $Res call({List<Count>? count});
}

/// @nodoc
class _$TaskApplyCountModelCopyWithImpl<$Res, $Val extends TaskApplyCountModel>
    implements $TaskApplyCountModelCopyWith<$Res> {
  _$TaskApplyCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as List<Count>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskApplyCountModelCopyWith<$Res>
    implements $TaskApplyCountModelCopyWith<$Res> {
  factory _$$_TaskApplyCountModelCopyWith(_$_TaskApplyCountModel value,
          $Res Function(_$_TaskApplyCountModel) then) =
      __$$_TaskApplyCountModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Count>? count});
}

/// @nodoc
class __$$_TaskApplyCountModelCopyWithImpl<$Res>
    extends _$TaskApplyCountModelCopyWithImpl<$Res, _$_TaskApplyCountModel>
    implements _$$_TaskApplyCountModelCopyWith<$Res> {
  __$$_TaskApplyCountModelCopyWithImpl(_$_TaskApplyCountModel _value,
      $Res Function(_$_TaskApplyCountModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_$_TaskApplyCountModel(
      count: freezed == count
          ? _value._count
          : count // ignore: cast_nullable_to_non_nullable
              as List<Count>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskApplyCountModel implements _TaskApplyCountModel {
  const _$_TaskApplyCountModel({final List<Count>? count}) : _count = count;

  factory _$_TaskApplyCountModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskApplyCountModelFromJson(json);

  final List<Count>? _count;
  @override
  List<Count>? get count {
    final value = _count;
    if (value == null) return null;
    if (_count is EqualUnmodifiableListView) return _count;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskApplyCountModel(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskApplyCountModel &&
            const DeepCollectionEquality().equals(other._count, _count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_count));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskApplyCountModelCopyWith<_$_TaskApplyCountModel> get copyWith =>
      __$$_TaskApplyCountModelCopyWithImpl<_$_TaskApplyCountModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskApplyCountModelToJson(
      this,
    );
  }
}

abstract class _TaskApplyCountModel implements TaskApplyCountModel {
  const factory _TaskApplyCountModel({final List<Count>? count}) =
      _$_TaskApplyCountModel;

  factory _TaskApplyCountModel.fromJson(Map<String, dynamic> json) =
      _$_TaskApplyCountModel.fromJson;

  @override
  List<Count>? get count;
  @override
  @JsonKey(ignore: true)
  _$$_TaskApplyCountModelCopyWith<_$_TaskApplyCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Count _$CountFromJson(Map<String, dynamic> json) {
  return _Count.fromJson(json);
}

/// @nodoc
mixin _$Count {
  @JsonKey(name: 'tasker_count')
  int? get taskerCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountCopyWith<Count> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountCopyWith<$Res> {
  factory $CountCopyWith(Count value, $Res Function(Count) then) =
      _$CountCopyWithImpl<$Res, Count>;
  @useResult
  $Res call({@JsonKey(name: 'tasker_count') int? taskerCount});
}

/// @nodoc
class _$CountCopyWithImpl<$Res, $Val extends Count>
    implements $CountCopyWith<$Res> {
  _$CountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskerCount = freezed,
  }) {
    return _then(_value.copyWith(
      taskerCount: freezed == taskerCount
          ? _value.taskerCount
          : taskerCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountCopyWith<$Res> implements $CountCopyWith<$Res> {
  factory _$$_CountCopyWith(_$_Count value, $Res Function(_$_Count) then) =
      __$$_CountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'tasker_count') int? taskerCount});
}

/// @nodoc
class __$$_CountCopyWithImpl<$Res> extends _$CountCopyWithImpl<$Res, _$_Count>
    implements _$$_CountCopyWith<$Res> {
  __$$_CountCopyWithImpl(_$_Count _value, $Res Function(_$_Count) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskerCount = freezed,
  }) {
    return _then(_$_Count(
      taskerCount: freezed == taskerCount
          ? _value.taskerCount
          : taskerCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Count implements _Count {
  const _$_Count({@JsonKey(name: 'tasker_count') this.taskerCount});

  factory _$_Count.fromJson(Map<String, dynamic> json) =>
      _$$_CountFromJson(json);

  @override
  @JsonKey(name: 'tasker_count')
  final int? taskerCount;

  @override
  String toString() {
    return 'Count(taskerCount: $taskerCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Count &&
            (identical(other.taskerCount, taskerCount) ||
                other.taskerCount == taskerCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, taskerCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountCopyWith<_$_Count> get copyWith =>
      __$$_CountCopyWithImpl<_$_Count>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountToJson(
      this,
    );
  }
}

abstract class _Count implements Count {
  const factory _Count(
      {@JsonKey(name: 'tasker_count') final int? taskerCount}) = _$_Count;

  factory _Count.fromJson(Map<String, dynamic> json) = _$_Count.fromJson;

  @override
  @JsonKey(name: 'tasker_count')
  int? get taskerCount;
  @override
  @JsonKey(ignore: true)
  _$$_CountCopyWith<_$_Count> get copyWith =>
      throw _privateConstructorUsedError;
}
