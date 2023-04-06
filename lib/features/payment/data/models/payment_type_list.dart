// To parse this JSON data, do
//
//     final paymentTypeList = paymentTypeListFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_list.freezed.dart';
part 'payment_type_list.g.dart';

@freezed
class PaymentTypeList with _$PaymentTypeList {
  const factory PaymentTypeList({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    dynamic next,
    dynamic previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _PaymentTypeList;

  factory PaymentTypeList.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeListFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? name,
    String? slug,
    String? logo,
    String? type,
    @JsonKey(name: 'thumb_nail') dynamic thumbnail,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
