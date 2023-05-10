import 'package:bloc/bloc.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/wallet/data/models/wallet_history_res.dart';
import 'package:cipher/features/wallet/data/models/wallet_model.dart';
import 'package:cipher/features/wallet/data/repositories/wallet_repository.dart';
import 'package:equatable/equatable.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final repo = WalletRepository();
  WalletBloc() : super(WalletState()) {
    on<WalletLoaded>(
      _onWalletLoaded,
    );
    on<WalletHistoryLoaded>(
      _onWalletHistoryLoaded,
    );
  }

  Future<void> _onWalletLoaded(
      WalletLoaded event, Emitter<WalletState> emit) async {
    try {
      emit(
        state.copyWith(
          theStates: TheStates.loading,
        ),
      );
      await repo.getMyWallet().then(
            (value) => emit(
              state.copyWith(
                theStates: TheStates.success,
                walletModel: value,
              ),
            ),
          );
    } catch (e) {
      emit(
        state.copyWith(
          theStates: TheStates.failure,
          walletModel: [],
        ),
      );
    }
    ;
  }

  Future<void> _onWalletHistoryLoaded(
      WalletHistoryLoaded event, Emitter<WalletState> emit) async {
    emit(
      state.copyWith(
        theStates: TheStates.loading,
      ),
    );
    try {
      await repo
          .getWalletHistory(
            createdAt: event.createdAt,
            endDate: event.endDate,
            startDate: event.startDate,
          )
          .then(
            (value) => emit(
              state.copyWith(
                theStates: TheStates.success,
                walletHistoryRes: value,
              ),
            ),
          );
    } catch (e) {
      emit(
        state.copyWith(
          theStates: TheStates.failure,
          walletHistoryRes: WalletHistoryRes(),
        ),
      );
    }
    ;
  }
}
