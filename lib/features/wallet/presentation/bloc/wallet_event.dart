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
  WalletHistoryLoaded({
    this.createdAt,
    this.endDate,
    this.startDate,
  });
  @override
  List<Object?> get props => [
        createdAt,
        endDate,
        startDate,
      ];
}
