// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:dependencies/dependencies.dart';
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
      _onTransactionLoaded,
      transformer: throttleDroppable(
        throttleDuration,
      ),
    );
    on<TransactionStatusChanged>(_onTransactionStatusChanged);
    on<TransactionDateChanged>(_onTransactionDateChanged);
  }

  Future<void> _onTransactionLoaded(
      TransactionEvent event, Emitter<TransactionState> emit) async {
    if (state.hasReachedMax == true) return;

    try {
      if (state.theStates == TheStates.initial) {
        final transactionsRes = await repo.getTransactions();
        return emit(
          state.copyWith(
            theStates: TheStates.success,
            res: transactionsRes,
            hasReachedMax: false,
            transactions: transactionsRes.result,
          ),
        );
      }

      if (state.res?.current != state.res?.totalPages) {
        final transactionsRes = await repo.getTransactions(
          pageNumber: state.res!.current! + 1,
        );
        transactionsRes.result!.isEmpty
            ? emit(state.copyWith(
                hasReachedMax: true,
              ))
            : emit(
                state.copyWith(
                  theStates: TheStates.success,
                  res: transactionsRes,
                  hasReachedMax: false,
                  transactions: List.from(state.transactions as Iterable)
                    ..addAll(transactionsRes.result!),
                ),
              );
      } else
        emit(
          state.copyWith(
            hasReachedMax: true,
          ),
        );
    } catch (_) {
      emit(
        state.copyWith(
          theStates: TheStates.failure,
        ),
      );
    }
  }

  Future<void> _onTransactionStatusChanged(
    TransactionStatusChanged event,
    Emitter<TransactionState> emit,
  ) async {
    final transactions = await repo.getTransactions(
      status: event.status,
    );
    return emit(
      state.copyWith(
        res: transactions,
        transactions: transactions.result,
      ),
    );
  }

  Future<void> _onTransactionDateChanged(
    TransactionDateChanged event,
    Emitter<TransactionState> emit,
  ) async {
    final transactionsRes = await repo.getTransactions(
      dateBefore: event.beforeDate == null
          ? null
          : DateFormat("yyyy-MM-dd").format(
              event.beforeDate!,
            ),
      dateAfter: event.afterDate == null
          ? null
          : DateFormat("yyyy-MM-dd").format(
              event.afterDate!,
            ),
    );
    return emit(
      state.copyWith(
        res: transactionsRes,
        transactions: transactionsRes.result,
      ),
    );
  }
}
