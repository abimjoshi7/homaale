// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  final TheStates? theStates;
  final TransactionsRes? res;
  final List<Transactions>? transactions;
  final bool? hasReachedMax;

  TransactionState({
    this.theStates = TheStates.initial,
    this.res,
    this.transactions,
    this.hasReachedMax,
  });

  @override
  List<Object?> get props => [
        theStates,
        res,
        transactions,
        hasReachedMax,
      ];

  TransactionState copyWith({
    TheStates? theStates,
    TransactionsRes? res,
    List<Transactions>? transactions,
    bool? hasReachedMax,
  }) {
    return TransactionState(
      theStates: theStates ?? this.theStates,
      res: res ?? this.res,
      transactions: transactions ?? this.transactions,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
