
import 'package:freezed_annotation/freezed_annotation.dart';
part 'redeem_submit_response.freezed.dart';
part 'redeem_submit_response.g.dart';


@freezed
class RedeemSubmitResponse with _$RedeemSubmitResponse {
  const factory RedeemSubmitResponse({
    String? status,
    String? message,
  }) = _RedeemSubmitResponse;

  factory RedeemSubmitResponse.fromJson(Map<String, dynamic> json) => _$RedeemSubmitResponseFromJson(json);
}
