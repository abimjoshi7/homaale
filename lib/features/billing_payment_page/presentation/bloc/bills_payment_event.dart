// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bills_payment_bloc.dart';

class BillsPaymentEvent extends Equatable {
  const BillsPaymentEvent();

  @override
  List<Object?> get props => [];
}

class InitializeState extends BillsPaymentEvent {}

class FetchLinkedBankAccount extends BillsPaymentEvent {
  final bool isNewFetch;

  FetchLinkedBankAccount({
    this.isNewFetch = false,
  });
}

class FetchBankNames extends BillsPaymentEvent {
  final String? search;
  final bool? isWallet;

  FetchBankNames({
    this.search,
    this.isWallet,
  });
}

class FetchBankBranch extends BillsPaymentEvent {
  final int bankId;

  FetchBankBranch({required this.bankId});
}

class SavePaymentMethodEvent extends BillsPaymentEvent {
  final SavePaymentMethodDto savePaymentMethodDto;

  SavePaymentMethodEvent({required this.savePaymentMethodDto});
}

class DeleteLinkedMethod extends BillsPaymentEvent {
  final int bankId;

  DeleteLinkedMethod({required this.bankId});
}
