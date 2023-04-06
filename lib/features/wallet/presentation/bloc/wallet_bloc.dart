import 'package:bloc/bloc.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/wallet/data/models/wallet_model.dart';
import 'package:cipher/features/wallet/data/repositories/wallet_repository.dart';
import 'package:equatable/equatable.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final repo = WalletRepository();
  WalletBloc() : super(WalletState()) {
    on<WalletLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
            ),
          );
          await repo.fetchMyWallet().then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    walletModel: List<WalletModel>.from(value),
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
      },
    );
  }
}
