// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:cipher/core/helpers/file_storage_helper.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:dependencies/dependencies.dart';

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

    on<TransactionDownloaded>(
      _onTransactionDownloaded,
    );
  }

  Future<void> _onTransactionLoaded(
      TransactionLoaded event, Emitter<TransactionState> emit) async {
    if (!event.isCleared && state.hasReachedMax == true) return;

    try {
      if (event.isCleared == true)
        emit(
          state.copyWith(
            theStates: TheStates.initial,
          ),
        );
      if (state.theStates == TheStates.initial) {
        final transactionsRes = await repo.getTransactions(
          status: event.status,
          dateBefore: event.dateBefore == null
              ? null
              : DateFormat("yyyy-MM-dd").format(
                  event.dateBefore!,
                ),
          dateAfter: event.dateAfter == null
              ? null
              : DateFormat("yyyy-MM-dd").format(
                  event.dateAfter!,
                ),
        );
        return emit(
          state.copyWith(
            theStates: TheStates.success,
            res: transactionsRes,
            hasReachedMax:
                transactionsRes.current == transactionsRes.totalPages,
            transactions: transactionsRes.result,
          ),
        );
      }

      if (state.res.current != state.res.totalPages) {
        final transactionsRes = await repo.getTransactions(
          pageNumber: state.res.current! + 1,
          status: event.status,
          dateBefore: event.dateBefore == null
              ? null
              : DateFormat("yyyy-MM-dd").format(
                  event.dateBefore!,
                ),
          dateAfter: event.dateAfter == null
              ? null
              : DateFormat("yyyy-MM-dd").format(
                  event.dateAfter!,
                ),
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
                  transactions: List.from(
                    state.transactions,
                  )..addAll(transactionsRes.result!),
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

  Future<void> _onTransactionDownloaded(
      TransactionDownloaded event, Emitter<TransactionState> emit) async {
    final contents = await repo.downloadCSV();

    final file = await FileStorageHelper().writeData(
      contents,
    );
    emit(
      state.copyWith(
        csvFile: file,
      ),
    );
  }
}
