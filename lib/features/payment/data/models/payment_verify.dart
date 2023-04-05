

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'payment_verify.freezed.dart';
part 'payment_verify.g.dart';

@freezed
class PaymentVerify with _$PaymentVerify {
  const factory PaymentVerify({
    String? status,
    String? message,
    Detail? detail,
  }) = _PaymentVerify;

  factory PaymentVerify.fromJson(Map<String, dynamic> json) => _$PaymentVerifyFromJson(json);
}

@freezed
class Detail with _$Detail {
  const factory Detail({
    String? pidx,
   @JsonKey(name: 'total_amount') int? totalAmount,
    String? status,
  @JsonKey(name: 'transaction_id')  dynamic transactionId,
    int? fee,
    bool? refunded,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
