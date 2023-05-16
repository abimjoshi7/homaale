part of 'bills_payment_bloc.dart';

enum BillsPaymentStatus { initial, success, failure }

enum BankNameStatus { initial, success, loading, failure }

enum BankBranchNameStatus { initial, success, loading, failure }

enum SavePaymentMethodStatus { initial, success, loading, failure }

class BillsPaymentState extends Equatable {
  final BillsPaymentStatus billsPaymentStatus;
  final bool hasReachedMax;
  final List<LinkedBankDto> linkedBankList;
  final LinkedBankResponseDto linkedBankResponseDto;
  final BankNameStatus bankNameStatus;
  final BankBranchNameStatus bankBranchNameStatus;
  final List<BankNamesResponseDto> bankNameList;
  final List<BankBranchResponseDto> bankBranchList;
  final SavePaymentMethodStatus savePaymentMethodStatus;

  BillsPaymentState({
    this.billsPaymentStatus = BillsPaymentStatus.initial,
    this.hasReachedMax = false,
    this.linkedBankList = const <LinkedBankDto>[],
    this.linkedBankResponseDto = const LinkedBankResponseDto(),
    this.bankNameStatus = BankNameStatus.initial,
    this.bankBranchNameStatus = BankBranchNameStatus.initial,
    this.bankNameList = const <BankNamesResponseDto>[],
    this.bankBranchList = const <BankBranchResponseDto>[],
    this.savePaymentMethodStatus = SavePaymentMethodStatus.initial,
  });

  @override
  List<Object> get props {
    return [
      billsPaymentStatus,
      hasReachedMax,
      linkedBankList,
      linkedBankResponseDto,
      bankNameStatus,
      bankBranchNameStatus,
      bankNameList,
      bankBranchList,
      savePaymentMethodStatus,
    ];
  }

  BillsPaymentState copyWith({
    BillsPaymentStatus? billsPaymentStatus,
    bool? hasReachedMax,
    List<LinkedBankDto>? linkedBankList,
    LinkedBankResponseDto? linkedBankResponseDto,
    BankNameStatus? bankNameStatus,
    BankBranchNameStatus? bankBranchNameStatus,
    List<BankNamesResponseDto>? bankNameList,
    List<BankBranchResponseDto>? bankBranchList,
    SavePaymentMethodStatus? savePaymentMethodStatus,
  }) {
    return BillsPaymentState(
      billsPaymentStatus: billsPaymentStatus ?? this.billsPaymentStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      linkedBankList: linkedBankList ?? this.linkedBankList,
      linkedBankResponseDto: linkedBankResponseDto ?? this.linkedBankResponseDto,
      bankNameStatus: bankNameStatus ?? this.bankNameStatus,
      bankBranchNameStatus: bankBranchNameStatus ?? this.bankBranchNameStatus,
      bankNameList: bankNameList ?? this.bankNameList,
      bankBranchList: bankBranchList ?? this.bankBranchList,
      savePaymentMethodStatus: savePaymentMethodStatus ?? this.savePaymentMethodStatus,
    );
  }
}
