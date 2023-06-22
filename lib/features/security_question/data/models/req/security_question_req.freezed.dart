// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_question_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecurityQuestionReq _$SecurityQuestionReqFromJson(Map<String, dynamic> json) {
  return _SecurityQuestionReq.fromJson(json);
}

/// @nodoc
mixin _$SecurityQuestionReq {
  int? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityQuestionReqCopyWith<SecurityQuestionReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityQuestionReqCopyWith<$Res> {
  factory $SecurityQuestionReqCopyWith(
          SecurityQuestionReq value, $Res Function(SecurityQuestionReq) then) =
      _$SecurityQuestionReqCopyWithImpl<$Res, SecurityQuestionReq>;
  @useResult
  $Res call({int? id, String? question});
}

/// @nodoc
class _$SecurityQuestionReqCopyWithImpl<$Res, $Val extends SecurityQuestionReq>
    implements $SecurityQuestionReqCopyWith<$Res> {
  _$SecurityQuestionReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecurityQuestionReqCopyWith<$Res>
    implements $SecurityQuestionReqCopyWith<$Res> {
  factory _$$_SecurityQuestionReqCopyWith(_$_SecurityQuestionReq value,
          $Res Function(_$_SecurityQuestionReq) then) =
      __$$_SecurityQuestionReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? question});
}

/// @nodoc
class __$$_SecurityQuestionReqCopyWithImpl<$Res>
    extends _$SecurityQuestionReqCopyWithImpl<$Res, _$_SecurityQuestionReq>
    implements _$$_SecurityQuestionReqCopyWith<$Res> {
  __$$_SecurityQuestionReqCopyWithImpl(_$_SecurityQuestionReq _value,
      $Res Function(_$_SecurityQuestionReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
  }) {
    return _then(_$_SecurityQuestionReq(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecurityQuestionReq implements _SecurityQuestionReq {
  const _$_SecurityQuestionReq({this.id, this.question});

  factory _$_SecurityQuestionReq.fromJson(Map<String, dynamic> json) =>
      _$$_SecurityQuestionReqFromJson(json);

  @override
  final int? id;
  @override
  final String? question;

  @override
  String toString() {
    return 'SecurityQuestionReq(id: $id, question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecurityQuestionReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecurityQuestionReqCopyWith<_$_SecurityQuestionReq> get copyWith =>
      __$$_SecurityQuestionReqCopyWithImpl<_$_SecurityQuestionReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecurityQuestionReqToJson(
      this,
    );
  }
}

abstract class _SecurityQuestionReq implements SecurityQuestionReq {
  const factory _SecurityQuestionReq({final int? id, final String? question}) =
      _$_SecurityQuestionReq;

  factory _SecurityQuestionReq.fromJson(Map<String, dynamic> json) =
      _$_SecurityQuestionReq.fromJson;

  @override
  int? get id;
  @override
  String? get question;
  @override
  @JsonKey(ignore: true)
  _$$_SecurityQuestionReqCopyWith<_$_SecurityQuestionReq> get copyWith =>
      throw _privateConstructorUsedError;
}
