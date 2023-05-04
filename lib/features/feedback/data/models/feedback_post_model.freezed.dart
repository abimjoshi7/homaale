// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedbackPostModel _$FeedbackPostModelFromJson(Map<String, dynamic> json) {
  return _FeedbackPostModel.fromJson(json);
}

/// @nodoc
mixin _$FeedbackPostModel {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackPostModelCopyWith<FeedbackPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackPostModelCopyWith<$Res> {
  factory $FeedbackPostModelCopyWith(
          FeedbackPostModel value, $Res Function(FeedbackPostModel) then) =
      _$FeedbackPostModelCopyWithImpl<$Res, FeedbackPostModel>;
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class _$FeedbackPostModelCopyWithImpl<$Res, $Val extends FeedbackPostModel>
    implements $FeedbackPostModelCopyWith<$Res> {
  _$FeedbackPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeedbackPostModelCopyWith<$Res>
    implements $FeedbackPostModelCopyWith<$Res> {
  factory _$$_FeedbackPostModelCopyWith(_$_FeedbackPostModel value,
          $Res Function(_$_FeedbackPostModel) then) =
      __$$_FeedbackPostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class __$$_FeedbackPostModelCopyWithImpl<$Res>
    extends _$FeedbackPostModelCopyWithImpl<$Res, _$_FeedbackPostModel>
    implements _$$_FeedbackPostModelCopyWith<$Res> {
  __$$_FeedbackPostModelCopyWithImpl(
      _$_FeedbackPostModel _value, $Res Function(_$_FeedbackPostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_FeedbackPostModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedbackPostModel implements _FeedbackPostModel {
  const _$_FeedbackPostModel({this.status, this.message});

  factory _$_FeedbackPostModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeedbackPostModelFromJson(json);

  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'FeedbackPostModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedbackPostModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedbackPostModelCopyWith<_$_FeedbackPostModel> get copyWith =>
      __$$_FeedbackPostModelCopyWithImpl<_$_FeedbackPostModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedbackPostModelToJson(
      this,
    );
  }
}

abstract class _FeedbackPostModel implements FeedbackPostModel {
  const factory _FeedbackPostModel(
      {final String? status, final String? message}) = _$_FeedbackPostModel;

  factory _FeedbackPostModel.fromJson(Map<String, dynamic> json) =
      _$_FeedbackPostModel.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_FeedbackPostModelCopyWith<_$_FeedbackPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
