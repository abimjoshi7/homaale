import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/wallet/data/models/wallet_history_res.dart';
import 'package:cipher/features/wallet/data/models/wallet_model.dart';
import 'package:cipher/features/wallet/data/repositories/wallet_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final repo = WalletRepository();
  WalletBloc() : super(WalletState()) {
    on<WalletLoaded>(_onWalletLoaded);
    on<WalletHistoryLoaded>(
      _onWalletHistoryLoaded,
      transformer: throttleDroppable(
        throttleDuration,
      ),
    );
  }

  Future<void> _onWalletLoaded(WalletLoaded event, Emitter<WalletState> emit) async {
    try {
      emit(
        state.copyWith(
          theStates: TheStates.loading,
        ),
      );
      await repo.getMyWallet().then(
        (value) {
          print(value);
          emit(
            state.copyWith(
              theStates: TheStates.success,
              walletModel: value,
            ),
          );
        },
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          theStates: TheStates.failure,
          walletModel: [],
        ),
      );
    }
    ;
  }

  Future<void> _onWalletHistoryLoaded(WalletHistoryLoaded event, Emitter<WalletState> emit) async {
    if (!event.isNewFetch && state.hasReachedMax) return;
    try {
      if (event.isNewFetch) {
        emit(state.copyWith(theStates: TheStates.initial));
      }

      if (state.theStates == TheStates.initial) {
        final walletHistoryRes = await repo.getWalletHistory(
          event.createdAt,
          event.endDate,
          event.startDate,
        );

        final walletHistoryList = walletHistoryRes.result;
        return emit(state.copyWith(
          theStates: TheStates.success,
          walletHistoryRes: walletHistoryRes,
          walletHistoryList: walletHistoryList,
          hasReachedMax: walletHistoryRes.totalPages == walletHistoryRes.current,
        ));
      }

      if (state.walletHistoryRes.current != state.walletHistoryRes.totalPages) {
        final walletHistoryRes = await repo.getWalletHistory(
            event.createdAt, event.endDate, event.startDate, state.walletHistoryRes.current! + 1);
        emit(walletHistoryRes.result!.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                theStates: TheStates.success,
                walletHistoryRes: walletHistoryRes,
                walletHistoryList: List.of(state.walletHistoryList)..addAll(walletHistoryRes.result!),
                hasReachedMax: false,
              ));
      } else {
        emit(state.copyWith(hasReachedMax: true));
      }
    } catch (e) {
      emit(state.copyWith(theStates: TheStates.failure));
    }
    ;
  }
}
