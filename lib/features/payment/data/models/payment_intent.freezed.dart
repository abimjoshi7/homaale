// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentIntent _$PaymentIntentFromJson(Map<String, dynamic> json) {
  return _PaymentIntent.fromJson(json);
}

/// @nodoc
mixin _$PaymentIntent {
  bool? get success => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "intent_id")
  String? get intentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentIntentCopyWith<PaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentIntentCopyWith<$Res> {
  factory $PaymentIntentCopyWith(
          PaymentIntent value, $Res Function(PaymentIntent) then) =
      _$PaymentIntentCopyWithImpl<$Res, PaymentIntent>;
  @useResult
  $Res call(
      {bool? success,
      Data? data,
      @JsonKey(name: "intent_id") String? intentId});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PaymentIntentCopyWithImpl<$Res, $Val extends PaymentIntent>
    implements $PaymentIntentCopyWith<$Res> {
  _$PaymentIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
    Object? intentId = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      intentId: freezed == intentId
          ? _value.intentId
          : intentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentIntentCopyWith<$Res>
    implements $PaymentIntentCopyWith<$Res> {
  factory _$$_PaymentIntentCopyWith(
          _$_PaymentIntent value, $Res Function(_$_PaymentIntent) then) =
      __$$_PaymentIntentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      Data? data,
      @JsonKey(name: "intent_id") String? intentId});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_PaymentIntentCopyWithImpl<$Res>
    extends _$PaymentIntentCopyWithImpl<$Res, _$_PaymentIntent>
    implements _$$_PaymentIntentCopyWith<$Res> {
  __$$_PaymentIntentCopyWithImpl(
      _$_PaymentIntent _value, $Res Function(_$_PaymentIntent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
    Object? intentId = freezed,
  }) {
    return _then(_$_PaymentIntent(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      intentId: freezed == intentId
          ? _value.intentId
          : intentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentIntent implements _PaymentIntent {
  const _$_PaymentIntent(
      {this.success, this.data, @JsonKey(name: "intent_id") this.intentId});

  factory _$_PaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentIntentFromJson(json);

  @override
  final bool? success;
  @override
  final Data? data;
  @override
  @JsonKey(name: "intent_id")
  final String? intentId;

  @override
  String toString() {
    return 'PaymentIntent(success: $success, data: $data, intentId: $intentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentIntent &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.intentId, intentId) ||
                other.intentId == intentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, intentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentIntentCopyWith<_$_PaymentIntent> get copyWith =>
      __$$_PaymentIntentCopyWithImpl<_$_PaymentIntent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentIntentToJson(
      this,
    );
  }
}

abstract class _PaymentIntent implements PaymentIntent {
  const factory _PaymentIntent(
      {final bool? success,
      final Data? data,
      @JsonKey(name: "intent_id") final String? intentId}) = _$_PaymentIntent;

  factory _PaymentIntent.fromJson(Map<String, dynamic> json) =
      _$_PaymentIntent.fromJson;

  @override
  bool? get success;
  @override
  Data? get data;
  @override
  @JsonKey(name: "intent_id")
  String? get intentId;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentIntentCopyWith<_$_PaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get pidx => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_url")
  String? get paymentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_at")
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_in")
  int? get expiresIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? pidx,
      @JsonKey(name: "payment_url") String? paymentUrl,
      @JsonKey(name: "expires_at") DateTime? expiresAt,
      @JsonKey(name: "expires_in") int? expiresIn});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pidx = freezed,
    Object? paymentUrl = freezed,
    Object? expiresAt = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      pidx: freezed == pidx
          ? _value.pidx
          : pidx // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pidx,
      @JsonKey(name: "payment_url") String? paymentUrl,
      @JsonKey(name: "expires_at") DateTime? expiresAt,
      @JsonKey(name: "expires_in") int? expiresIn});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pidx = freezed,
    Object? paymentUrl = freezed,
    Object? expiresAt = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_$_Data(
      pidx: freezed == pidx
          ? _value.pidx
          : pidx // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {this.pidx,
      @JsonKey(name: "payment_url") this.paymentUrl,
      @JsonKey(name: "expires_at") this.expiresAt,
      @JsonKey(name: "expires_in") this.expiresIn});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String? pidx;
  @override
  @JsonKey(name: "payment_url")
  final String? paymentUrl;
  @override
  @JsonKey(name: "expires_at")
  final DateTime? expiresAt;
  @override
  @JsonKey(name: "expires_in")
  final int? expiresIn;

  @override
  String toString() {
    return 'Data(pidx: $pidx, paymentUrl: $paymentUrl, expiresAt: $expiresAt, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.pidx, pidx) || other.pidx == pidx) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pidx, paymentUrl, expiresAt, expiresIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final String? pidx,
      @JsonKey(name: "payment_url") final String? paymentUrl,
      @JsonKey(name: "expires_at") final DateTime? expiresAt,
      @JsonKey(name: "expires_in") final int? expiresIn}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String? get pidx;
  @override
  @JsonKey(name: "payment_url")
  String? get paymentUrl;
  @override
  @JsonKey(name: "expires_at")
  DateTime? get expiresAt;
  @override
  @JsonKey(name: "expires_in")
  int? get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
