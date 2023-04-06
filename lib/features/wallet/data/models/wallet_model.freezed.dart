// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  int? get id => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "last_received")
  String? get lastReceived => throw _privateConstructorUsedError;
  @JsonKey(name: "last_paid")
  String? get lastPaid => throw _privateConstructorUsedError;
  @JsonKey(name: "total_income")
  String? get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: "total_withdrawals")
  String? get totalWithdrawals => throw _privateConstructorUsedError;
  @JsonKey(name: "available_balance")
  double? get availableBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "frozen_amount")
  double? get frozenAmount => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get merchant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {int? id,
      String? currency,
      @JsonKey(name: "last_received") String? lastReceived,
      @JsonKey(name: "last_paid") String? lastPaid,
      @JsonKey(name: "total_income") String? totalIncome,
      @JsonKey(name: "total_withdrawals") String? totalWithdrawals,
      @JsonKey(name: "available_balance") double? availableBalance,
      @JsonKey(name: "frozen_amount") double? frozenAmount,
      String? user,
      String? merchant});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? currency = freezed,
    Object? lastReceived = freezed,
    Object? lastPaid = freezed,
    Object? totalIncome = freezed,
    Object? totalWithdrawals = freezed,
    Object? availableBalance = freezed,
    Object? frozenAmount = freezed,
    Object? user = freezed,
    Object? merchant = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReceived: freezed == lastReceived
          ? _value.lastReceived
          : lastReceived // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPaid: freezed == lastPaid
          ? _value.lastPaid
          : lastPaid // ignore: cast_nullable_to_non_nullable
              as String?,
      totalIncome: freezed == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as String?,
      totalWithdrawals: freezed == totalWithdrawals
          ? _value.totalWithdrawals
          : totalWithdrawals // ignore: cast_nullable_to_non_nullable
              as String?,
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      frozenAmount: freezed == frozenAmount
          ? _value.frozenAmount
          : frozenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletModelCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$_WalletModelCopyWith(
          _$_WalletModel value, $Res Function(_$_WalletModel) then) =
      __$$_WalletModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? currency,
      @JsonKey(name: "last_received") String? lastReceived,
      @JsonKey(name: "last_paid") String? lastPaid,
      @JsonKey(name: "total_income") String? totalIncome,
      @JsonKey(name: "total_withdrawals") String? totalWithdrawals,
      @JsonKey(name: "available_balance") double? availableBalance,
      @JsonKey(name: "frozen_amount") double? frozenAmount,
      String? user,
      String? merchant});
}

/// @nodoc
class __$$_WalletModelCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$_WalletModel>
    implements _$$_WalletModelCopyWith<$Res> {
  __$$_WalletModelCopyWithImpl(
      _$_WalletModel _value, $Res Function(_$_WalletModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? currency = freezed,
    Object? lastReceived = freezed,
    Object? lastPaid = freezed,
    Object? totalIncome = freezed,
    Object? totalWithdrawals = freezed,
    Object? availableBalance = freezed,
    Object? frozenAmount = freezed,
    Object? user = freezed,
    Object? merchant = freezed,
  }) {
    return _then(_$_WalletModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReceived: freezed == lastReceived
          ? _value.lastReceived
          : lastReceived // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPaid: freezed == lastPaid
          ? _value.lastPaid
          : lastPaid // ignore: cast_nullable_to_non_nullable
              as String?,
      totalIncome: freezed == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as String?,
      totalWithdrawals: freezed == totalWithdrawals
          ? _value.totalWithdrawals
          : totalWithdrawals // ignore: cast_nullable_to_non_nullable
              as String?,
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      frozenAmount: freezed == frozenAmount
          ? _value.frozenAmount
          : frozenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletModel implements _WalletModel {
  const _$_WalletModel(
      {this.id,
      this.currency,
      @JsonKey(name: "last_received") this.lastReceived,
      @JsonKey(name: "last_paid") this.lastPaid,
      @JsonKey(name: "total_income") this.totalIncome,
      @JsonKey(name: "total_withdrawals") this.totalWithdrawals,
      @JsonKey(name: "available_balance") this.availableBalance,
      @JsonKey(name: "frozen_amount") this.frozenAmount,
      this.user,
      this.merchant});

  factory _$_WalletModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletModelFromJson(json);

  @override
  final int? id;
  @override
  final String? currency;
  @override
  @JsonKey(name: "last_received")
  final String? lastReceived;
  @override
  @JsonKey(name: "last_paid")
  final String? lastPaid;
  @override
  @JsonKey(name: "total_income")
  final String? totalIncome;
  @override
  @JsonKey(name: "total_withdrawals")
  final String? totalWithdrawals;
  @override
  @JsonKey(name: "available_balance")
  final double? availableBalance;
  @override
  @JsonKey(name: "frozen_amount")
  final double? frozenAmount;
  @override
  final String? user;
  @override
  final String? merchant;

  @override
  String toString() {
    return 'WalletModel(id: $id, currency: $currency, lastReceived: $lastReceived, lastPaid: $lastPaid, totalIncome: $totalIncome, totalWithdrawals: $totalWithdrawals, availableBalance: $availableBalance, frozenAmount: $frozenAmount, user: $user, merchant: $merchant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.lastReceived, lastReceived) ||
                other.lastReceived == lastReceived) &&
            (identical(other.lastPaid, lastPaid) ||
                other.lastPaid == lastPaid) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalWithdrawals, totalWithdrawals) ||
                other.totalWithdrawals == totalWithdrawals) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.frozenAmount, frozenAmount) ||
                other.frozenAmount == frozenAmount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      currency,
      lastReceived,
      lastPaid,
      totalIncome,
      totalWithdrawals,
      availableBalance,
      frozenAmount,
      user,
      merchant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletModelCopyWith<_$_WalletModel> get copyWith =>
      __$$_WalletModelCopyWithImpl<_$_WalletModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletModelToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel(
      {final int? id,
      final String? currency,
      @JsonKey(name: "last_received") final String? lastReceived,
      @JsonKey(name: "last_paid") final String? lastPaid,
      @JsonKey(name: "total_income") final String? totalIncome,
      @JsonKey(name: "total_withdrawals") final String? totalWithdrawals,
      @JsonKey(name: "available_balance") final double? availableBalance,
      @JsonKey(name: "frozen_amount") final double? frozenAmount,
      final String? user,
      final String? merchant}) = _$_WalletModel;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$_WalletModel.fromJson;

  @override
  int? get id;
  @override
  String? get currency;
  @override
  @JsonKey(name: "last_received")
  String? get lastReceived;
  @override
  @JsonKey(name: "last_paid")
  String? get lastPaid;
  @override
  @JsonKey(name: "total_income")
  String? get totalIncome;
  @override
  @JsonKey(name: "total_withdrawals")
  String? get totalWithdrawals;
  @override
  @JsonKey(name: "available_balance")
  double? get availableBalance;
  @override
  @JsonKey(name: "frozen_amount")
  double? get frozenAmount;
  @override
  String? get user;
  @override
  String? get merchant;
  @override
  @JsonKey(ignore: true)
  _$$_WalletModelCopyWith<_$_WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}
