// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentIntent _$$_PaymentIntentFromJson(Map<String, dynamic> json) =>
    _$_PaymentIntent(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      intentId: json['intent_id'] as String?,
    );

Map<String, dynamic> _$$_PaymentIntentToJson(_$_PaymentIntent instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'intent_id': instance.intentId,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      pidx: json['pidx'] as String?,
      paymentUrl: json['payment_url'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      expiresIn: json['expires_in'] as int?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'pidx': instance.pidx,
      'payment_url': instance.paymentUrl,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'expires_in': instance.expiresIn,
    };
