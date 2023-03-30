// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_promo_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplyPromoCode _$ApplyOfferFromJson(Map<String, dynamic> json) {
  return _ApplyOffer.fromJson(json);
}

/// @nodoc
mixin _$ApplyOffer {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplyOfferCopyWith<ApplyPromoCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyOfferCopyWith<$Res> {
  factory $ApplyOfferCopyWith(
          ApplyPromoCode value, $Res Function(ApplyPromoCode) then) =
      _$ApplyOfferCopyWithImpl<$Res, ApplyPromoCode>;
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class _$ApplyOfferCopyWithImpl<$Res, $Val extends ApplyPromoCode>
    implements $ApplyOfferCopyWith<$Res> {
  _$ApplyOfferCopyWithImpl(this._value, this._then);

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
abstract class _$$_ApplyOfferCopyWith<$Res>
    implements $ApplyOfferCopyWith<$Res> {
  factory _$$_ApplyOfferCopyWith(
          _$_ApplyOffer value, $Res Function(_$_ApplyOffer) then) =
      __$$_ApplyOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class __$$_ApplyOfferCopyWithImpl<$Res>
    extends _$ApplyOfferCopyWithImpl<$Res, _$_ApplyOffer>
    implements _$$_ApplyOfferCopyWith<$Res> {
  __$$_ApplyOfferCopyWithImpl(
      _$_ApplyOffer _value, $Res Function(_$_ApplyOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ApplyOffer(
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
class _$_ApplyOffer implements _ApplyOffer {
  const _$_ApplyOffer({this.status, this.message});

  factory _$_ApplyOffer.fromJson(Map<String, dynamic> json) =>
      _$$_ApplyOfferFromJson(json);

  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'ApplyOffer(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplyOffer &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplyOfferCopyWith<_$_ApplyOffer> get copyWith =>
      __$$_ApplyOfferCopyWithImpl<_$_ApplyOffer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplyOfferToJson(
      this,
    );
  }
}

abstract class _ApplyOffer implements ApplyPromoCode {
  const factory _ApplyOffer({final String? status, final String? message}) =
      _$_ApplyOffer;

  factory _ApplyOffer.fromJson(Map<String, dynamic> json) =
      _$_ApplyOffer.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ApplyOfferCopyWith<_$_ApplyOffer> get copyWith =>
      throw _privateConstructorUsedError;
}
