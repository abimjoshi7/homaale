

import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_promo_code.freezed.dart';
part 'apply_promo_code.g.dart';

@freezed
class ApplyPromoCode with _$ApplyPromoCode {
  const factory ApplyPromoCode({
    String? status,
    String? message,
  }) = _ApplyOffer;

  factory ApplyPromoCode.fromJson(Map<String, dynamic> json) => _$ApplyPromoCodeFromJson(json);
}
