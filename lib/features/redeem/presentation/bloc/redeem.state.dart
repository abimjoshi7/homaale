import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import '../../data/models/redeem_items_detail.dart';
import '../../data/models/redeem_submit_response.dart';
import '../../data/models/request_redeem_list.dart';

enum RedeemStatus { initial, success, failure }

enum RedeemSubmitStatus { initial, success, failure }

class RedeemState extends Equatable {
  final TheStates theState;
  final RedeemStatus status;
  final RedeemSubmitStatus redeemSubmitStatus;
  final RequestRedeemList redeemList;
  final bool hasReachedMax;
  final RedeemSubmitResponse redeemSubmitResponse;
  final RedeemItemsDetail redeemItemsDetail;
  final List<EntityService> entityService;
  final List<Result> redeem;
  final String redeemSubmitMessage;

  RedeemState(
      {this.theState = TheStates.initial,
      this.status = RedeemStatus.initial,
      this.redeemSubmitStatus = RedeemSubmitStatus.initial,
      this.redeem = const [],
      this.hasReachedMax = false,
      this.redeemList = const RequestRedeemList(),
      this.redeemItemsDetail = const RedeemItemsDetail(),
      this.entityService = const [],
      this.redeemSubmitResponse = const RedeemSubmitResponse(),
      this.redeemSubmitMessage = ''});

  @override
  List<Object> get props => [
        status,
        theState,
        redeemItemsDetail,
        hasReachedMax,
        redeem,
        entityService,
        redeemList,
        redeemSubmitMessage,
        redeemSubmitStatus,
        redeemSubmitResponse
      ];

  RedeemState copyWith({
    TheStates? theStates,
    RedeemItemsDetail? redeemItemsDetail,
    RedeemStatus? status,
    RedeemSubmitStatus? redeemSubmitStatus,
    RequestRedeemList? redeemList,
    RedeemSubmitResponse? redeemSubmitResponse,
    String? redeemSubmitMessage,
    bool? hasReachedMax,
    List<Result>? redeem,
    List<EntityService>? entityService,
  }) {
    return RedeemState(
        theState: theState ?? this.theState,
        redeemItemsDetail: redeemItemsDetail ?? this.redeemItemsDetail,
        status: status ?? this.status,
        redeemSubmitStatus: redeemSubmitStatus ?? this.redeemSubmitStatus,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        redeem: redeem ?? this.redeem,
        entityService: entityService ?? this.entityService,
        redeemList: redeemList ?? this.redeemList,
        redeemSubmitResponse: redeemSubmitResponse ?? this.redeemSubmitResponse,
        redeemSubmitMessage: redeemSubmitMessage ?? this.redeemSubmitMessage);
  }
}
