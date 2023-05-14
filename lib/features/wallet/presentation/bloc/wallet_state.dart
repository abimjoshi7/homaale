part of 'wallet_bloc.dart';

class WalletState extends Equatable {
  final TheStates theStates;
  final List<WalletModel> walletModel;
  final WalletHistoryRes walletHistoryRes;
  final List<Result> walletHistoryList;
  final bool hasReachedMax;

  WalletState({
    this.theStates = TheStates.initial,
    this.walletModel = const <WalletModel>[],
    this.walletHistoryRes = const WalletHistoryRes(),
    this.walletHistoryList = const <Result>[],
    this.hasReachedMax = false,
  });

  WalletState copyWith({
    TheStates? theStates,
    List<WalletModel>? walletModel,
    WalletHistoryRes? walletHistoryRes,
    List<Result>? walletHistoryList,
    bool? hasReachedMax,
  }) {
    return WalletState(
      theStates: theStates ?? this.theStates,
      walletModel: walletModel ?? this.walletModel,
      walletHistoryRes: walletHistoryRes ?? this.walletHistoryRes,
      walletHistoryList: walletHistoryList ?? this.walletHistoryList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        walletModel,
        walletHistoryRes,
        walletHistoryList,
        hasReachedMax,
      ];
}
