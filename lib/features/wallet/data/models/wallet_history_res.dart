import 'package:dependencies/dependencies.dart';

part 'wallet_history_res.freezed.dart';
part 'wallet_history_res.g.dart';

@freezed
class WalletHistoryRes with _$WalletHistoryRes {
  const factory WalletHistoryRes({
    @JsonKey(name: "total_pages") int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: "page_size") int? pageSize,
    List<Result>? result,
  }) = _WalletHistoryRes;

  factory WalletHistoryRes.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryResFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? sender,
    String? receiver,
    @JsonKey(name: "task_title") List<String>? taskTitle,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    String? amount,
    int? wallet,
    String? transaction,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
