// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_add_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedAddReq _$SavedAddReqFromJson(Map<String, dynamic> json) {
  return _SavedModel.fromJson(json);
}

/// @nodoc
mixin _$SavedAddReq {
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: "object_id")
  String? get objectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedAddReqCopyWith<SavedAddReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedAddReqCopyWith<$Res> {
  factory $SavedAddReqCopyWith(
          SavedAddReq value, $Res Function(SavedAddReq) then) =
      _$SavedAddReqCopyWithImpl<$Res, SavedAddReq>;
  @useResult
  $Res call({String? model, @JsonKey(name: "object_id") String? objectId});
}

/// @nodoc
class _$SavedAddReqCopyWithImpl<$Res, $Val extends SavedAddReq>
    implements $SavedAddReqCopyWith<$Res> {
  _$SavedAddReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? objectId = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedModelCopyWith<$Res>
    implements $SavedAddReqCopyWith<$Res> {
  factory _$$_SavedModelCopyWith(
          _$_SavedModel value, $Res Function(_$_SavedModel) then) =
      __$$_SavedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? model, @JsonKey(name: "object_id") String? objectId});
}

/// @nodoc
class __$$_SavedModelCopyWithImpl<$Res>
    extends _$SavedAddReqCopyWithImpl<$Res, _$_SavedModel>
    implements _$$_SavedModelCopyWith<$Res> {
  __$$_SavedModelCopyWithImpl(
      _$_SavedModel _value, $Res Function(_$_SavedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? objectId = freezed,
  }) {
    return _then(_$_SavedModel(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedModel implements _SavedModel {
  const _$_SavedModel({this.model, @JsonKey(name: "object_id") this.objectId});

  factory _$_SavedModel.fromJson(Map<String, dynamic> json) =>
      _$$_SavedModelFromJson(json);

  @override
  final String? model;
  @override
  @JsonKey(name: "object_id")
  final String? objectId;

  @override
  String toString() {
    return 'SavedAddReq(model: $model, objectId: $objectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedModel &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, objectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedModelCopyWith<_$_SavedModel> get copyWith =>
      __$$_SavedModelCopyWithImpl<_$_SavedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedModelToJson(
      this,
    );
  }
}

abstract class _SavedModel implements SavedAddReq {
  const factory _SavedModel(
      {final String? model,
      @JsonKey(name: "object_id") final String? objectId}) = _$_SavedModel;

  factory _SavedModel.fromJson(Map<String, dynamic> json) =
      _$_SavedModel.fromJson;

  @override
  String? get model;
  @override
  @JsonKey(name: "object_id")
  String? get objectId;
  @override
  @JsonKey(ignore: true)
  _$$_SavedModelCopyWith<_$_SavedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
