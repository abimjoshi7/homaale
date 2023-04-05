// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentVerify _$$_PaymentVerifyFromJson(Map<String, dynamic> json) =>
    _$_PaymentVerify(
      status: json['status'] as String?,
      message: json['message'] as String?,
      detail: json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaymentVerifyToJson(_$_PaymentVerify instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'detail': instance.detail,
    };

_$_Detail _$$_DetailFromJson(Map<String, dynamic> json) => _$_Detail(
      pidx: json['pidx'] as String?,
      totalAmount: json['total_amount'] as int?,
      status: json['status'] as String?,
      transactionId: json['transaction_id'],
      fee: json['fee'] as int?,
      refunded: json['refunded'] as bool?,
    );

Map<String, dynamic> _$$_DetailToJson(_$_Detail instance) => <String, dynamic>{
      'pidx': instance.pidx,
      'total_amount': instance.totalAmount,
      'status': instance.status,
      'transaction_id': instance.transactionId,
      'fee': instance.fee,
      'refunded': instance.refunded,
    };
