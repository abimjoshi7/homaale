part of 'wallet_bloc.dart';

class WalletState extends Equatable {
  final TheStates? theStates;
  final List<WalletModel>? walletModel;
  WalletState({
    this.theStates = TheStates.initial,
    this.walletModel,
  });

  WalletState copyWith({
    TheStates? theStates,
    List<WalletModel>? walletModel,
  }) {
    return WalletState(
      theStates: theStates ?? this.theStates,
      walletModel: walletModel ?? this.walletModel,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        walletModel,
      ];
}
