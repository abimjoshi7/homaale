// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class TransactionLoaded extends TransactionEvent {
  final int pageNumber;
  final DateTime? dateAfter;
  final DateTime? dateBefore;
  final String? status;
  final String? transactionType;
  final int? paymentMethod;
  TransactionLoaded({
    required this.pageNumber,
    this.dateAfter,
    this.dateBefore,
    this.status,
    this.transactionType,
    this.paymentMethod,
  });
  @override
  List<Object?> get props => [
        pageNumber,
        dateAfter,
        dateBefore,
        status,
        transactionType,
        paymentMethod,
      ];
}
