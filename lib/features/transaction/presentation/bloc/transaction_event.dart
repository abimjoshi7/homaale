// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class TransactionLoaded extends TransactionEvent {
  final int? pageNumber;
  final DateTime? dateAfter;
  final DateTime? dateBefore;
  final String? status;
  final String? transactionType;
  final int? paymentMethod;
  final bool? beforeSelected;
  final bool? afterSelected;
  TransactionLoaded({
    this.pageNumber,
    this.dateAfter,
    this.dateBefore,
    this.status,
    this.transactionType,
    this.paymentMethod,
    this.beforeSelected,
    this.afterSelected,
  });
  @override
  List<Object?> get props => [
        pageNumber,
        dateAfter,
        dateBefore,
        status,
        transactionType,
        paymentMethod,
        beforeSelected,
        afterSelected,
      ];
}

class TransactionStatusChanged extends TransactionEvent {
  final String? status;
  TransactionStatusChanged({
    this.status,
  });
  @override
  List<Object?> get props => [
        status,
      ];
}

class TransactionDateChanged extends TransactionEvent {
  final DateTime? beforeDate;
  final DateTime? afterDate;
  final bool? beforeSelected;
  final bool? afterSelected;
  TransactionDateChanged({
    this.beforeDate,
    this.afterDate,
    this.beforeSelected,
    this.afterSelected,
  });
  @override
  List<Object?> get props => [
        beforeDate,
        afterDate,
        beforeSelected,
        afterSelected,
      ];
}
