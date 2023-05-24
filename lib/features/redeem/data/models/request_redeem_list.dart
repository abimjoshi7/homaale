

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_redeem_list.freezed.dart';
part 'request_redeem_list.g.dart';

@freezed
class RequestRedeemList with _$RequestRedeemList {
  const factory RequestRedeemList({
  @JsonKey(name:'total_pages')  int? totalPages,
    int? count,
    int? current,
    dynamic next,
    dynamic previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _RequestRedeemList;

  factory RequestRedeemList.fromJson(Map<String, dynamic> json) => _$RequestRedeemListFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? title,
    String? image,
    String? description,
  @JsonKey(name: 'start_date')  DateTime? startDate,
  @JsonKey(name: 'end_date')  dynamic endDate,
  @JsonKey(name: 'offer_type')  String? offerType,
    dynamic code,
    dynamic offerRule,
   @JsonKey(name: 'redeem_points') int? redeemPoints,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
