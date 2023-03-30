
import 'package:cipher/features/payment/data/models/payment_type_list.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_event.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_list_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import '../../data/repositories/payment_repositories.dart';

class PaymentTypeBloc extends Bloc<PaymentTypeListEvent, PaymentTypeListState> {
  final repositories = PaymentRepositories();
  PaymentTypeBloc() : super(PaymentTypeListState()) {
    on<PaymentTypeListInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories
            .getPaymentTypeList()
            .then(
              (value) =>
              emit(
                state.copyWith(
                  theState: TheStates.success,
                  paymentType: PaymentTypeList.fromJson(value),
                ),
              ),
        );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
    on<PaymentTypeCurrentIndex>((event, emit)  {
      emit(
        state.copyWith(currentIndex: event.currentIndex),
      );

    });
  }
}
