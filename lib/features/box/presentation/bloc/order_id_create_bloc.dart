import 'package:cipher/features/box/data/models/order_id_create.dart';
import 'package:cipher/features/box/data/repositories/order_list_repositories.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import 'order_id_create_event.dart';
import 'order_id_create_state.dart';

class OrderIdCreateBloc extends Bloc<OrderIdCreateEvent, OrderIdCreateState> {
  final repositories = OrderListRepositories();

  OrderIdCreateBloc() : super(OrderIdCreateState()) {
    on<OrderIdCreateInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.postCreateOrderId(event.uuid).then(
          (value) {
            // log(value.toString() as num);
            emit(
              state.copyWith(
                theState: TheStates.success,
                orderIdCreate: OrderIdCreate.fromJson(value),
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
        // log(e.toString() as num);
      }
    });
  }
}
