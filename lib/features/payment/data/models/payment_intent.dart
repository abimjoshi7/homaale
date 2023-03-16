// To parse this JSON data, do
//
//     final paymentIntent = paymentIntentFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent.freezed.dart';
part 'payment_intent.g.dart';

@freezed
class PaymentIntent with _$PaymentIntent {
  const factory PaymentIntent({
    bool? success,
    Data? data,
    @JsonKey(name: "intent_id") String? intentId,
  }) = _PaymentIntent;

  factory PaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? pidx,
    @JsonKey(name: "payment_url") String? paymentUrl,
    @JsonKey(name: "expires_at") DateTime? expiresAt,
    @JsonKey(name: "expires_in") int? expiresIn,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
