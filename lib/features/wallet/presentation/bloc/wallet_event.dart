// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();
}

class WalletLoaded extends WalletEvent {
  @override
  List<Object?> get props => [];
}

class WalletHistoryLoaded extends WalletEvent {
  final DateTime? createdAt;
  final DateTime? endDate;
  final DateTime? startDate;
  final bool isNewFetch;
  final String? searchQuery;
  WalletHistoryLoaded({
    this.createdAt,
    this.endDate,
    this.startDate,
    this.isNewFetch = false,
    this.searchQuery,
  });
  @override
  List<Object?> get props => [createdAt, endDate, startDate, isNewFetch];
}

class WithdrawFundEvent extends WalletEvent {
  final WithdrawReqResDto withdrawReqResDto;

  WithdrawFundEvent(this.withdrawReqResDto);

  @override
  List<Object?> get props => [withdrawReqResDto];
}
