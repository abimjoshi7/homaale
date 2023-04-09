import 'dart:developer';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/box/data/models/order_item_retrive_list.dart';
import 'package:dependencies/dependencies.dart';
import '../../data/repositories/order_list_repositories.dart';
import 'order_retrive_event.dart';
import 'order_retrive_state.dart';

class OrderItemRetriveBloc extends Bloc<OrderItemRetriveEvent, OrderItemRetriveState> {
  final repo = OrderListRepositories();
  OrderItemRetriveBloc() : super(const OrderItemRetriveState()) {
    on<OrderItemRetriveInitiated>(
      (event, emit) async {
        try {
          emit(state.copyWith(theStates: TheStates.initial));
          await repo.getAllOrderRetrive(event.uuid).then((value) {
            emit(
              state.copyWith(
                theStates: TheStates.success,
                orderItemRetriveList: OrderItemRetriveList.fromJson(value),
              ),
            );
          });
        } catch (e) {
          log("notification parse error$e");
          emit(state.copyWith(theStates: TheStates.failure, orderItemRetriveList: OrderItemRetriveList()));
        }
      },
    );
  }
}
