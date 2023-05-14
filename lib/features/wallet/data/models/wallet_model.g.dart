// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletModel _$$_WalletModelFromJson(Map<String, dynamic> json) =>
    _$_WalletModel(
      id: json['id'] as int?,
      currency: json['currency'] as String?,
      lastReceived: (json['last_received'] as num?)?.toDouble(),
      lastPaid: (json['last_paid'] as num?)?.toDouble(),
      totalIncome: (json['total_income'] as num?)?.toDouble(),
      totalWithdrawals: (json['total_withdrawals'] as num?)?.toDouble(),
      availableBalance: json['available_balance'] as String?,
      frozenAmount: json['frozen_amount'] as String?,
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
