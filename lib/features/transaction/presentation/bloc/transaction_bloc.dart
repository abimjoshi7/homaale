// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';
import 'package:cipher/features/transaction/data/repositories/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository repo;
  TransactionBloc(
    this.repo,
  ) : super(TransactionState()) {
    on<TransactionLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            theStates: TheStates.loading,
          ),
        );
        try {
          await repo.getTransactions(event.pageNumber).then(
                (value) => emit(
                  state.copyWith(
                    res: TransactionsRes.fromJson(
                      value,
                    ),
                    theStates: TheStates.success,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              res: TransactionsRes(),
            ),
          );
        }
      },
    );
  }
}
