import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_redeem_statement.freezed.dart';
part 'request_redeem_statement.g.dart';

@freezed
class RequestRedeemStatement with _$RequestRedeemStatement {
  const factory RequestRedeemStatement({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    dynamic previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _RequestRedeemStatement;

  factory RequestRedeemStatement.fromJson(Map<String, dynamic> json) =>
      _$RequestRedeemStatementFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'object_repr') String? objectRepr,
    int? points,
    String? status,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
