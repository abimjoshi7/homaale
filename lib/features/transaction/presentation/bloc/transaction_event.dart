part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class TransactionLoaded extends TransactionEvent {
  @override
  List<Object?> get props => [];
}
