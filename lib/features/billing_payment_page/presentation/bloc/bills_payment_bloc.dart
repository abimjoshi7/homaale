import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/features/billing_payment_page/data/model/bank_branch_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/bank_names_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/linked_bank_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/save_payment_method_dto.dart';
import 'package:cipher/features/billing_payment_page/data/repositories/bank_repositories.dart';
import 'package:dependencies/dependencies.dart';
import 'package:stream_transform/stream_transform.dart';

part 'bills_payment_event.dart';
part 'bills_payment_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class BillsPaymentBloc extends Bloc<BillsPaymentEvent, BillsPaymentState> {
  final BankRepository bankRepository;

  BillsPaymentBloc({required this.bankRepository}) : super(BillsPaymentState()) {
    on<InitializeState>(
      (event, emit) {
        emit(state.copyWith(
          billsPaymentStatus: BillsPaymentStatus.initial,
          hasReachedMax: false,
          linkedBankList: const <LinkedBankDto>[],
          linkedBankResponseDto: const LinkedBankResponseDto(),
          bankNameStatus: BankNameStatus.initial,
          bankBranchNameStatus: BankBranchNameStatus.initial,
          savePaymentMethodStatus: SavePaymentMethodStatus.initial,
          bankNameList: const <BankNamesResponseDto>[],
          bankBranchList: const <BankBranchResponseDto>[],
        ));
      },
    );

    on<FetchLinkedBankAccount>(
      (event, emit) async {
        if (!event.isNewFetch && state.hasReachedMax) return;
        try {
          if (state.billsPaymentStatus == BillsPaymentStatus.initial) {
            final linkedBankResponseDto = await bankRepository.fetchLinkedBankAccount();

            final LinkedBankList = linkedBankResponseDto.result;
            return emit(state.copyWith(
              billsPaymentStatus: BillsPaymentStatus.success,
              linkedBankResponseDto: linkedBankResponseDto,
              linkedBankList: LinkedBankList,
              hasReachedMax: linkedBankResponseDto.current == linkedBankResponseDto.totalPages,
            ));
          }

          if (state.linkedBankResponseDto.current != state.linkedBankResponseDto.totalPages) {
            final linkedBankResponseDto =
                await bankRepository.fetchLinkedBankAccount(state.linkedBankResponseDto.current! + 1);
            emit(linkedBankResponseDto.result!.isEmpty
                ? state.copyWith(hasReachedMax: true)
                : state.copyWith(
                    billsPaymentStatus: BillsPaymentStatus.success,
                    linkedBankResponseDto: linkedBankResponseDto,
                    linkedBankList: List.of(state.linkedBankList)..addAll(linkedBankResponseDto.result!),
                    hasReachedMax: false,
                  ));
          } else {
            emit(state.copyWith(hasReachedMax: true));
          }
        } catch (_) {
          emit(state.copyWith(billsPaymentStatus: BillsPaymentStatus.failure));
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );

    on<FetchBankNames>((event, emit) async {
      try {
        emit(state.copyWith(bankNameStatus: BankNameStatus.loading));

        final bankList = await bankRepository.fetchBankNames(search: event.search, isWallet: event.isWallet);

        emit(state.copyWith(
          bankNameStatus: BankNameStatus.success,
          bankBranchNameStatus: BankBranchNameStatus.initial,
          bankNameList: bankList,
          bankBranchList: [],
        ));
      } catch (_) {
        emit(state.copyWith(bankNameStatus: BankNameStatus.failure));
      }
    });

    on<FetchBankBranch>((event, emit) async {
      try {
        emit(state.copyWith(bankBranchNameStatus: BankBranchNameStatus.loading));

        final bankBranchList = await bankRepository.fetchBankBranchNames(bankId: event.bankId);

        emit(state.copyWith(
          bankBranchNameStatus: BankBranchNameStatus.success,
          bankBranchList: bankBranchList,
        ));
      } catch (_) {
        emit(state.copyWith(bankBranchNameStatus: BankBranchNameStatus.failure));
      }
    });

    on<SavePaymentMethodEvent>((event, emit) async {
      try {
        emit(state.copyWith(savePaymentMethodStatus: SavePaymentMethodStatus.loading));
        Map<String, dynamic> data = {};

        if (event.savePaymentMethodDto.branchName == null) {
          data = {
            "bank_account_name": "${event.savePaymentMethodDto.bankAccountName}",
            "bank_account_number": "${event.savePaymentMethodDto.bankAccountNumber}",
            "is_primary": event.savePaymentMethodDto.isPrimary,
            "bank_name": event.savePaymentMethodDto.bankName
          };
        } else {
          data = {
            "bank_account_name": "${event.savePaymentMethodDto.bankAccountName}",
            "bank_account_number": "${event.savePaymentMethodDto.bankAccountNumber}",
            "is_primary": event.savePaymentMethodDto.isPrimary,
            "bank_name": event.savePaymentMethodDto.bankName,
            "branch_name": event.savePaymentMethodDto.branchName
          };
        }

        final res = await bankRepository.addPaymentMethod(data: data);
        if (res) {
          emit(state.copyWith(
            savePaymentMethodStatus: SavePaymentMethodStatus.success,
            billsPaymentStatus: BillsPaymentStatus.initial,
          ));
          add(FetchLinkedBankAccount(isNewFetch: true));
        } else {
          throw Exception();
        }
      } catch (_) {
        emit(state.copyWith(savePaymentMethodStatus: SavePaymentMethodStatus.failure));
      }
    });

    on<DeleteLinkedMethod>((event, emit) async {
      try {
        final res = await bankRepository.deletePaymentMethod(bankId: event.bankId);
        if (res) {
          emit(state.copyWith(
            billsPaymentStatus: BillsPaymentStatus.initial,
          ));
          add(FetchLinkedBankAccount(isNewFetch: true));
        } else {
          throw Exception();
        }
      } catch (_) {
        emit(state.copyWith(billsPaymentStatus: BillsPaymentStatus.failure));
      }
    });
  }
}
