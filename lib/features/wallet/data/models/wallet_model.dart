// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    int? id,
    String? currency,
    @JsonKey(name: "last_received") String? lastReceived,
    @JsonKey(name: "last_paid") String? lastPaid,
    @JsonKey(name: "total_income") String? totalIncome,
    @JsonKey(name: "total_withdrawals") String? totalWithdrawals,
    @JsonKey(name: "available_balance") double? availableBalance,
    @JsonKey(name: "frozen_amount") double? frozenAmount,
    String? user,
    String? merchant,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
