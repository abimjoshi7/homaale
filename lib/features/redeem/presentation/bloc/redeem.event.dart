import 'package:cipher/features/redeem/data/models/request_redeem_list.dart';
import 'package:dependencies/dependencies.dart';


abstract class RedeemEvent extends Equatable {
  const RedeemEvent();
}

class SetToInitial extends RedeemEvent {
  final String offerType;
  const SetToInitial({required this.offerType});
  @override
  List<Object?> get props => [offerType];
}

class FetchRedeemList extends RedeemEvent {
  final String offerType;
  const FetchRedeemList({required this.offerType});
  @override
  List<Object?> get props => [offerType];
}

class SubmitRedeemEvent extends RedeemEvent {
  final int  redeemID;
  const SubmitRedeemEvent({required this.redeemID});
  @override
  List<Object?> get props => [redeemID];
}
