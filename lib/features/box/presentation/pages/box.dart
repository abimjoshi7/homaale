import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_event.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_state.dart';
import 'package:cipher/features/box/presentation/pages/payment_tab.dart';
import 'package:cipher/features/box/presentation/pages/waiting_list_tab.dart';
import 'package:cipher/locator.dart';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../bookings/presentation/bloc/bookings_bloc.dart';

class BoxPage extends StatefulWidget {
  const BoxPage({super.key});

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<OrderItemListBloc>().add(const OrderItemListInitiated());
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Box',
        leadingWidget: SizedBox(),
        trailingWidget: SizedBox(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorColor: kColorSecondary,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: kPadding10,
            controller: _tabController,
            tabs: [
              Text(
                'Payment',
              ),
              Text(
                'Waiting List',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PaymentTab(),
                WaitingListTab(
                  bloc: locator<BookingsBloc>(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
