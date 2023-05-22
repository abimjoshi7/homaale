import 'package:dependencies/dependencies.dart';

import '../../data/models/redeem_submit_response.dart';
import '../../data/models/request_redeem_list.dart';

enum RedeemStatus { initial, success, failure }

enum RedeemSubmitStatus { initial, success, failure }

class RedeemState extends Equatable {
  final RedeemStatus status;
  final RedeemSubmitStatus redeemSubmitStatus;
  final RequestRedeemList redeemList;
  final bool hasReachedMax;
  final RedeemSubmitResponse redeemSubmitResponse;
  final List<Result> redeem;
  final String redeemSubmitMessage;

  RedeemState(
      {this.status = RedeemStatus.initial,
      this.redeemSubmitStatus = RedeemSubmitStatus.initial,
      this.redeem = const [],
      this.hasReachedMax = false,
      this.redeemList = const RequestRedeemList(),
      this.redeemSubmitResponse = const RedeemSubmitResponse(),
      this.redeemSubmitMessage = ''});

  @override
  List<Object> get props => [
        status,
        hasReachedMax,
        redeem,
        redeemList,
        redeemSubmitMessage,
        redeemSubmitStatus,
        redeemSubmitResponse
      ];

  RedeemState copyWith({
    RedeemStatus? status,
    RedeemSubmitStatus? redeemSubmitStatus,
    RequestRedeemList? redeemList,
    RedeemSubmitResponse? redeemSubmitResponse,
    String? redeemSubmitMessage,
    bool? hasReachedMax,
    List<Result>? redeem,
  }) {
    return RedeemState(
        status: status ?? this.status,
        redeemSubmitStatus: redeemSubmitStatus ?? this.redeemSubmitStatus,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        redeem: redeem ?? this.redeem,
        redeemList: redeemList ?? this.redeemList,
        redeemSubmitResponse: redeemSubmitResponse ?? this.redeemSubmitResponse,
        redeemSubmitMessage: redeemSubmitMessage ?? this.redeemSubmitMessage);
  }
}
