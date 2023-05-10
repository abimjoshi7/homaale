import 'dart:developer';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/box/data/models/order_item_list.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_event.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../data/repositories/order_list_repositories.dart';


class OrderItemListBloc extends Bloc<OrderItemListEvent, OrderItemListState> {
  final repo = OrderListRepositories();
  OrderItemListBloc() : super(const OrderItemListState()) {
    on<OrderItemListInitiated>(
      (event, emit) async {
        try {
          emit(state.copyWith(theStates: TheStates.initial));
          await repo.getAllOrder().then((value) {
            emit(
              state.copyWith(
                theStates: TheStates.success,
                orderItemList: OrderItemList.fromJson(value),
              ),
            );
          });
        } catch (e) {
          log("Item parse error$e");
          emit(state.copyWith(theStates: TheStates.failure));
        }
      },
    );
  }
}
