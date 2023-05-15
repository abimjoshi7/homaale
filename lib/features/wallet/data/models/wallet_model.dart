// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    int? id,
    String? currency,
    @JsonKey(name: "last_received") double? lastReceived,
    @JsonKey(name: "last_paid") double? lastPaid,
    @JsonKey(name: "total_income") double? totalIncome,
    @JsonKey(name: "total_withdrawals") double? totalWithdrawals,
    @JsonKey(name: "available_balance") String? availableBalance,
    @JsonKey(name: "frozen_amount") String? frozenAmount,
    String? user,
    String? merchant,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}
