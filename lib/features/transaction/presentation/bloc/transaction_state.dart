// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  final TheStates? theStates;
  final TransactionsRes? res;

  TransactionState({
    this.theStates = TheStates.initial,
    this.res,
  });

  @override
  List<Object?> get props => [
        theStates,
        res,
      ];

  TransactionState copyWith({
    TheStates? theStates,
    TransactionsRes? res,
  }) {
    return TransactionState(
      theStates: theStates ?? this.theStates,
      res: res ?? this.res,
    );
  }
}
