// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletModel _$$_WalletModelFromJson(Map<String, dynamic> json) =>
    _$_WalletModel(
      id: json['id'] as int?,
      currency: json['currency'] as String?,
      lastReceived: json['last_received'] as String?,
      lastPaid: json['last_paid'] as String?,
      totalIncome: json['total_income'] as String?,
      totalWithdrawals: json['total_withdrawals'] as String?,
      availableBalance: (json['available_balance'] as num?)?.toDouble(),
      frozenAmount: (json['frozen_amount'] as num?)?.toDouble(),
      user: json['user'] as String?,
      merchant: json['merchant'] as String?,
    );

Map<String, dynamic> _$$_WalletModelToJson(_$_WalletModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'last_received': instance.lastReceived,
      'last_paid': instance.lastPaid,
      'total_income': instance.totalIncome,
      'total_withdrawals': instance.totalWithdrawals,
      'available_balance': instance.availableBalance,
      'frozen_amount': instance.frozenAmount,
      'user': instance.user,
      'merchant': instance.merchant,
    };
