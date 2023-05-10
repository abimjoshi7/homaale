part of 'wallet_bloc.dart';

class WalletState extends Equatable {
  final TheStates? theStates;
  final List<WalletModel>? walletModel;
  final WalletHistoryRes? walletHistoryRes;
  WalletState({
    this.theStates = TheStates.initial,
    this.walletModel,
    this.walletHistoryRes,
  });

  WalletState copyWith({
    TheStates? theStates,
    List<WalletModel>? walletModel,
    WalletHistoryRes? walletHistoryRes,
  }) {
    return WalletState(
      theStates: theStates ?? this.theStates,
      walletModel: walletModel ?? this.walletModel,
      walletHistoryRes: walletHistoryRes ?? this.walletHistoryRes,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        walletModel,
        walletHistoryRes,
      ];
}
