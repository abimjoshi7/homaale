// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_deactive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDeactiveModel _$UserDeactiveModelFromJson(Map<String, dynamic> json) {
  return _UserDeactiveModel.fromJson(json);
}

/// @nodoc
mixin _$UserDeactiveModel {
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'reactivate_date')
  String? get reactivateDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDeactiveModelCopyWith<UserDeactiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeactiveModelCopyWith<$Res> {
  factory $UserDeactiveModelCopyWith(
          UserDeactiveModel value, $Res Function(UserDeactiveModel) then) =
      _$UserDeactiveModelCopyWithImpl<$Res, UserDeactiveModel>;
  @useResult
  $Res call(
      {String? reason,
      @JsonKey(name: 'reactivate_date') String? reactivateDate});
}

/// @nodoc
class _$UserDeactiveModelCopyWithImpl<$Res, $Val extends UserDeactiveModel>
    implements $UserDeactiveModelCopyWith<$Res> {
  _$UserDeactiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? reactivateDate = freezed,
  }) {
    return _then(_value.copyWith(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      reactivateDate: freezed == reactivateDate
          ? _value.reactivateDate
          : reactivateDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDeactiveModelCopyWith<$Res>
    implements $UserDeactiveModelCopyWith<$Res> {
  factory _$$_UserDeactiveModelCopyWith(_$_UserDeactiveModel value,
          $Res Function(_$_UserDeactiveModel) then) =
      __$$_UserDeactiveModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reason,
      @JsonKey(name: 'reactivate_date') String? reactivateDate});
}

/// @nodoc
class __$$_UserDeactiveModelCopyWithImpl<$Res>
    extends _$UserDeactiveModelCopyWithImpl<$Res, _$_UserDeactiveModel>
    implements _$$_UserDeactiveModelCopyWith<$Res> {
  __$$_UserDeactiveModelCopyWithImpl(
      _$_UserDeactiveModel _value, $Res Function(_$_UserDeactiveModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? reactivateDate = freezed,
  }) {
    return _then(_$_UserDeactiveModel(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      reactivateDate: freezed == reactivateDate
          ? _value.reactivateDate
          : reactivateDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDeactiveModel implements _UserDeactiveModel {
  const _$_UserDeactiveModel(
      {this.reason, @JsonKey(name: 'reactivate_date') this.reactivateDate});

  factory _$_UserDeactiveModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserDeactiveModelFromJson(json);

  @override
  final String? reason;
  @override
  @JsonKey(name: 'reactivate_date')
  final String? reactivateDate;

  @override
  String toString() {
    return 'UserDeactiveModel(reason: $reason, reactivateDate: $reactivateDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDeactiveModel &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.reactivateDate, reactivateDate) ||
                other.reactivateDate == reactivateDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reason, reactivateDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDeactiveModelCopyWith<_$_UserDeactiveModel> get copyWith =>
      __$$_UserDeactiveModelCopyWithImpl<_$_UserDeactiveModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDeactiveModelToJson(
      this,
    );
  }
}

abstract class _UserDeactiveModel implements UserDeactiveModel {
  const factory _UserDeactiveModel(
          {final String? reason,
          @JsonKey(name: 'reactivate_date') final String? reactivateDate}) =
      _$_UserDeactiveModel;

  factory _UserDeactiveModel.fromJson(Map<String, dynamic> json) =
      _$_UserDeactiveModel.fromJson;

  @override
  String? get reason;
  @override
  @JsonKey(name: 'reactivate_date')
  String? get reactivateDate;
  @override
  @JsonKey(ignore: true)
  _$$_UserDeactiveModelCopyWith<_$_UserDeactiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
