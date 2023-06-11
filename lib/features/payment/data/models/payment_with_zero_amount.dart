

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'payment_with_zero_amount.freezed.dart';
part 'payment_with_zero_amount.g.dart';



@freezed
class PaymentWithZeroAmount with _$PaymentWithZeroAmount {
  const factory PaymentWithZeroAmount({
    String? status,
    String? message,
  }) = _PaymentWithZeroAmount;

  factory PaymentWithZeroAmount.fromJson(Map<String, dynamic> json) => _$PaymentWithZeroAmountFromJson(json);
}
