// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_answer_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecurityAnswerRes _$SecurityAnswerResFromJson(Map<String, dynamic> json) {
  return _SecurityAnswerRes.fromJson(json);
}

/// @nodoc
mixin _$SecurityAnswerRes {
  int? get id => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  int? get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityAnswerResCopyWith<SecurityAnswerRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityAnswerResCopyWith<$Res> {
  factory $SecurityAnswerResCopyWith(
          SecurityAnswerRes value, $Res Function(SecurityAnswerRes) then) =
      _$SecurityAnswerResCopyWithImpl<$Res, SecurityAnswerRes>;
  @useResult
  $Res call({int? id, String? answer, int? question});
}

/// @nodoc
class _$SecurityAnswerResCopyWithImpl<$Res, $Val extends SecurityAnswerRes>
    implements $SecurityAnswerResCopyWith<$Res> {
  _$SecurityAnswerResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answer = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecurityAnswerResCopyWith<$Res>
    implements $SecurityAnswerResCopyWith<$Res> {
  factory _$$_SecurityAnswerResCopyWith(_$_SecurityAnswerRes value,
          $Res Function(_$_SecurityAnswerRes) then) =
      __$$_SecurityAnswerResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? answer, int? question});
}

/// @nodoc
class __$$_SecurityAnswerResCopyWithImpl<$Res>
    extends _$SecurityAnswerResCopyWithImpl<$Res, _$_SecurityAnswerRes>
    implements _$$_SecurityAnswerResCopyWith<$Res> {
  __$$_SecurityAnswerResCopyWithImpl(
      _$_SecurityAnswerRes _value, $Res Function(_$_SecurityAnswerRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answer = freezed,
    Object? question = freezed,
  }) {
    return _then(_$_SecurityAnswerRes(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SecurityAnswerRes implements _SecurityAnswerRes {
  const _$_SecurityAnswerRes({this.id, this.answer, this.question});

  factory _$_SecurityAnswerRes.fromJson(Map<String, dynamic> json) =>
      _$$_SecurityAnswerResFromJson(json);

  @override
  final int? id;
  @override
  final String? answer;
  @override
  final int? question;

  @override
  String toString() {
    return 'SecurityAnswerRes(id: $id, answer: $answer, question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecurityAnswerRes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecurityAnswerResCopyWith<_$_SecurityAnswerRes> get copyWith =>
      __$$_SecurityAnswerResCopyWithImpl<_$_SecurityAnswerRes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecurityAnswerResToJson(
      this,
    );
  }
}

abstract class _SecurityAnswerRes implements SecurityAnswerRes {
  const factory _SecurityAnswerRes(
      {final int? id,
      final String? answer,
      final int? question}) = _$_SecurityAnswerRes;

  factory _SecurityAnswerRes.fromJson(Map<String, dynamic> json) =
      _$_SecurityAnswerRes.fromJson;

  @override
  int? get id;
  @override
  String? get answer;
  @override
  int? get question;
  @override
  @JsonKey(ignore: true)
  _$$_SecurityAnswerResCopyWith<_$_SecurityAnswerRes> get copyWith =>
      throw _privateConstructorUsedError;
}
