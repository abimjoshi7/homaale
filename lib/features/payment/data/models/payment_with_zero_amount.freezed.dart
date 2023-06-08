// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_with_zero_amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentWithZeroAmount _$PaymentWithZeroAmountFromJson(
    Map<String, dynamic> json) {
  return _PaymentWithZeroAmount.fromJson(json);
}

/// @nodoc
mixin _$PaymentWithZeroAmount {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentWithZeroAmountCopyWith<PaymentWithZeroAmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentWithZeroAmountCopyWith<$Res> {
  factory $PaymentWithZeroAmountCopyWith(PaymentWithZeroAmount value,
          $Res Function(PaymentWithZeroAmount) then) =
      _$PaymentWithZeroAmountCopyWithImpl<$Res, PaymentWithZeroAmount>;
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class _$PaymentWithZeroAmountCopyWithImpl<$Res,
        $Val extends PaymentWithZeroAmount>
    implements $PaymentWithZeroAmountCopyWith<$Res> {
  _$PaymentWithZeroAmountCopyWithImpl(this._value, this._then);

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
abstract class _$$_PaymentWithZeroAmountCopyWith<$Res>
    implements $PaymentWithZeroAmountCopyWith<$Res> {
  factory _$$_PaymentWithZeroAmountCopyWith(_$_PaymentWithZeroAmount value,
          $Res Function(_$_PaymentWithZeroAmount) then) =
      __$$_PaymentWithZeroAmountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message});
}

/// @nodoc
class __$$_PaymentWithZeroAmountCopyWithImpl<$Res>
    extends _$PaymentWithZeroAmountCopyWithImpl<$Res, _$_PaymentWithZeroAmount>
    implements _$$_PaymentWithZeroAmountCopyWith<$Res> {
  __$$_PaymentWithZeroAmountCopyWithImpl(_$_PaymentWithZeroAmount _value,
      $Res Function(_$_PaymentWithZeroAmount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_PaymentWithZeroAmount(
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
class _$_PaymentWithZeroAmount implements _PaymentWithZeroAmount {
  const _$_PaymentWithZeroAmount({this.status, this.message});

  factory _$_PaymentWithZeroAmount.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentWithZeroAmountFromJson(json);

  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'PaymentWithZeroAmount(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentWithZeroAmount &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentWithZeroAmountCopyWith<_$_PaymentWithZeroAmount> get copyWith =>
      __$$_PaymentWithZeroAmountCopyWithImpl<_$_PaymentWithZeroAmount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentWithZeroAmountToJson(
      this,
    );
  }
}

abstract class _PaymentWithZeroAmount implements PaymentWithZeroAmount {
  const factory _PaymentWithZeroAmount(
      {final String? status, final String? message}) = _$_PaymentWithZeroAmount;

  factory _PaymentWithZeroAmount.fromJson(Map<String, dynamic> json) =
      _$_PaymentWithZeroAmount.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentWithZeroAmountCopyWith<_$_PaymentWithZeroAmount> get copyWith =>
      throw _privateConstructorUsedError;
}
