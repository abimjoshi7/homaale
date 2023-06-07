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


class RedeemItemsDetails extends RedeemEvent {
  final int redeemId;
  RedeemItemsDetails({required this.redeemId});
  @override
  List<Object?> get props => [redeemId];
}

class SubmitRedeemEvent extends RedeemEvent {
  final int redeemID;
  const SubmitRedeemEvent({required this.redeemID});
  @override
  List<Object?> get props => [redeemID];
}
