// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentVerify _$PaymentVerifyFromJson(Map<String, dynamic> json) {
  return _PaymentVerify.fromJson(json);
}

/// @nodoc
mixin _$PaymentVerify {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Detail? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentVerifyCopyWith<PaymentVerify> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentVerifyCopyWith<$Res> {
  factory $PaymentVerifyCopyWith(
          PaymentVerify value, $Res Function(PaymentVerify) then) =
      _$PaymentVerifyCopyWithImpl<$Res, PaymentVerify>;
  @useResult
  $Res call({String? status, String? message, Detail? detail});

  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$PaymentVerifyCopyWithImpl<$Res, $Val extends PaymentVerify>
    implements $PaymentVerifyCopyWith<$Res> {
  _$PaymentVerifyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? detail = freezed,
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
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $DetailCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentVerifyCopyWith<$Res>
    implements $PaymentVerifyCopyWith<$Res> {
  factory _$$_PaymentVerifyCopyWith(
          _$_PaymentVerify value, $Res Function(_$_PaymentVerify) then) =
      __$$_PaymentVerifyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, Detail? detail});

  @override
  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$_PaymentVerifyCopyWithImpl<$Res>
    extends _$PaymentVerifyCopyWithImpl<$Res, _$_PaymentVerify>
    implements _$$_PaymentVerifyCopyWith<$Res> {
  __$$_PaymentVerifyCopyWithImpl(
      _$_PaymentVerify _value, $Res Function(_$_PaymentVerify) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_PaymentVerify(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentVerify implements _PaymentVerify {
  const _$_PaymentVerify({this.status, this.message, this.detail});

  factory _$_PaymentVerify.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentVerifyFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final Detail? detail;

  @override
  String toString() {
    return 'PaymentVerify(status: $status, message: $message, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentVerify &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentVerifyCopyWith<_$_PaymentVerify> get copyWith =>
      __$$_PaymentVerifyCopyWithImpl<_$_PaymentVerify>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentVerifyToJson(
      this,
    );
  }
}

abstract class _PaymentVerify implements PaymentVerify {
  const factory _PaymentVerify(
      {final String? status,
      final String? message,
      final Detail? detail}) = _$_PaymentVerify;

  factory _PaymentVerify.fromJson(Map<String, dynamic> json) =
      _$_PaymentVerify.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  Detail? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentVerifyCopyWith<_$_PaymentVerify> get copyWith =>
      throw _privateConstructorUsedError;
}

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  String? get pidx => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  int? get totalAmount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  dynamic get transactionId => throw _privateConstructorUsedError;
  int? get fee => throw _privateConstructorUsedError;
  bool? get refunded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call(
      {String? pidx,
      @JsonKey(name: 'total_amount') int? totalAmount,
      String? status,
      @JsonKey(name: 'transaction_id') dynamic transactionId,
      int? fee,
      bool? refunded});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pidx = freezed,
    Object? totalAmount = freezed,
    Object? status = freezed,
    Object? transactionId = freezed,
    Object? fee = freezed,
    Object? refunded = freezed,
  }) {
    return _then(_value.copyWith(
      pidx: freezed == pidx
          ? _value.pidx
          : pidx // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      refunded: freezed == refunded
          ? _value.refunded
          : refunded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$_DetailCopyWith(_$_Detail value, $Res Function(_$_Detail) then) =
      __$$_DetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pidx,
      @JsonKey(name: 'total_amount') int? totalAmount,
      String? status,
      @JsonKey(name: 'transaction_id') dynamic transactionId,
      int? fee,
      bool? refunded});
}

/// @nodoc
class __$$_DetailCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$_Detail>
    implements _$$_DetailCopyWith<$Res> {
  __$$_DetailCopyWithImpl(_$_Detail _value, $Res Function(_$_Detail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pidx = freezed,
    Object? totalAmount = freezed,
    Object? status = freezed,
    Object? transactionId = freezed,
    Object? fee = freezed,
    Object? refunded = freezed,
  }) {
    return _then(_$_Detail(
      pidx: freezed == pidx
          ? _value.pidx
          : pidx // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      refunded: freezed == refunded
          ? _value.refunded
          : refunded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Detail implements _Detail {
  const _$_Detail(
      {this.pidx,
      @JsonKey(name: 'total_amount') this.totalAmount,
      this.status,
      @JsonKey(name: 'transaction_id') this.transactionId,
      this.fee,
      this.refunded});

  factory _$_Detail.fromJson(Map<String, dynamic> json) =>
      _$$_DetailFromJson(json);

  @override
  final String? pidx;
  @override
  @JsonKey(name: 'total_amount')
  final int? totalAmount;
  @override
  final String? status;
  @override
  @JsonKey(name: 'transaction_id')
  final dynamic transactionId;
  @override
  final int? fee;
  @override
  final bool? refunded;

  @override
  String toString() {
    return 'Detail(pidx: $pidx, totalAmount: $totalAmount, status: $status, transactionId: $transactionId, fee: $fee, refunded: $refunded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Detail &&
            (identical(other.pidx, pidx) || other.pidx == pidx) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.refunded, refunded) ||
                other.refunded == refunded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pidx, totalAmount, status,
      const DeepCollectionEquality().hash(transactionId), fee, refunded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailCopyWith<_$_Detail> get copyWith =>
      __$$_DetailCopyWithImpl<_$_Detail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailToJson(
      this,
    );
  }
}

abstract class _Detail implements Detail {
  const factory _Detail(
      {final String? pidx,
      @JsonKey(name: 'total_amount') final int? totalAmount,
      final String? status,
      @JsonKey(name: 'transaction_id') final dynamic transactionId,
      final int? fee,
      final bool? refunded}) = _$_Detail;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$_Detail.fromJson;

  @override
  String? get pidx;
  @override
  @JsonKey(name: 'total_amount')
  int? get totalAmount;
  @override
  String? get status;
  @override
  @JsonKey(name: 'transaction_id')
  dynamic get transactionId;
  @override
  int? get fee;
  @override
  bool? get refunded;
  @override
  @JsonKey(ignore: true)
  _$$_DetailCopyWith<_$_Detail> get copyWith =>
      throw _privateConstructorUsedError;
}
