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
  TransactionLoaded({
    this.pageNumber,
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

  TransactionLoaded copyWith({
    int? pageNumber,
    DateTime? dateAfter,
    DateTime? dateBefore,
    String? status,
    String? transactionType,
    int? paymentMethod,
  }) {
    return TransactionLoaded(
      pageNumber: pageNumber ?? this.pageNumber,
      dateAfter: dateAfter ?? this.dateAfter,
      dateBefore: dateBefore ?? this.dateBefore,
      status: status ?? this.status,
      transactionType: transactionType ?? this.transactionType,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
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
  TransactionDateChanged({
    this.beforeDate,
    this.afterDate,
  });
  @override
  List<Object?> get props => [
        beforeDate,
        afterDate,
      ];
}
