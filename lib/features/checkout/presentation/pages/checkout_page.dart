import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/box/presentation/bloc/order_retrive_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_retrive_event.dart';
import 'package:cipher/features/box/presentation/bloc/order_retrive_state.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/payment/presentation/pages/payment_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../box/promo_code/presentation/pages/apply_promo_and_offer.dart';
import '../../../payment/presentation/bloc/payment_type_event.dart';
import '../../../payment/presentation/pages/payment_summary_page.dart';

class CheckoutPage extends StatefulWidget {
  static const routeName = '/checkout-page';

  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final orderID = ModalRoute.of(context)?.settings.arguments as String;
    context
        .read<OrderItemRetriveBloc>()
        .add(OrderItemRetriveInitiated(uuid: orderID));
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Checkout',
      ),
      body: BlocBuilder<OrderItemRetriveBloc, OrderItemRetriveState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonBillingAddressContainer(),
                      TaskDisplayList(
                        state: state,
                      ),
                    ],
                  ),
                ),
                PromoCodeAddSection(orderId: orderID,),
                PaymentDetailsContainer(state: state),
                Center(
                  child: CustomElevatedButton(
                    callback: () {
                      context
                          .read<PaymentTypeBloc>()
                          .add(PaymentTypeListInitiated());
                      Navigator.pushNamed(
                        context,
                        PaymentPage.routeName,
                        arguments: orderID,
                      );
                    },
                    label: 'Confirm',
                  ),
                ),
                // addVerticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.orangeAccent,
                    ),
                    Expanded(
                      child: Text(
                        'You have to deposit the required amount to complete.',
                        style: Theme.of(context).textTheme.bodySmall,
                        // TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TaskDisplayList extends StatelessWidget {
  final OrderItemRetriveState state;

  const TaskDisplayList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 10),
          child: Text(
            'Task List',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: (state.theStates == TheStates.initial ||
                  state.theStates == TheStates.failure)
              ? const Center(
                  child: CardLoading(
                  height: 100,
                ))
              : state.orderItemRetriveList?.id != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          state.orderItemRetriveList?.orderItem?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          // padding: EdgeInsets.all(16),
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 5),
                                    height: 66,
                                    width: 58,
                                    decoration:
                                    BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          16.0),
                                      image:
                                      DecorationImage(
                                        image: NetworkImage(
                                        //     (state
                                        //     .orderItemRetriveList
                                        //     ?.orderItem?[
                                        // index]
                                        //     .task?.entityServiceImages
                                        //     ?.images
                                        //     ?.length ==
                                        //     0)
                                        //     ? kServiceImageNImg
                                        //     :state
                                        //     .orderItemRetriveList
                                        //     ?.orderItem?[
                                        // index]
                                        //     .task?.entityService
                                        //     ?.images
                                        //     ?.last
                                        //     .media.toString() ??
                                            kServiceImageNImg),
                                        fit: BoxFit
                                            .cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, bottom: 5),
                                        child: Text(
                                          state
                                                  .orderItemRetriveList
                                                  ?.orderItem?[index]
                                                  .task
                                                  ?.title ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.redAccent,
                                              size: 15,
                                            ),
                                            Text(
                                              state
                                                      .orderItemRetriveList
                                                      ?.orderItem?[index]
                                                      .task
                                                      ?.location ??
                                                  "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100.0),
                                              child: Text(
                                                'Rs  '
                                                '${Decimal.parse(state.orderItemRetriveList?.orderItem?[index].amount.toString() ?? "0.0")}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8),
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Colors.redAccent,
                                              size: 15,
                                            ),
                                          ),
                                          Text(Jiffy(state
                                                      .orderItemRetriveList
                                                      ?.orderItem?[index]
                                                      .task
                                                      ?.assigner
                                                      ?.createdAt ??
                                                  DateTime.now().toString())
                                              .yMMMMd),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '/per project',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                  : const Center(
                      child: CardLoading(
                      height: 100,
                    )),
        ),
      ],
    );
  }
}

class PaymentDetailsContainer extends StatelessWidget {
  final OrderItemRetriveState state;

  const PaymentDetailsContainer({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 10, bottom: 10),
          child: Text(
            'Payment Details',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: (state.theStates == TheStates.initial)
              ? const Center(
                  child: CardLoading(
                  height: 200,
                ))
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.orderItemRetriveList?.orderItem?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Item Details',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.orderItemRetriveList?.orderItem?[index]
                                        .task?.title ??
                                    'Service Charge',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Rs '
                                '${Decimal.parse(state.orderItemRetriveList?.orderItem?[index].amount.toString() ?? '0.0')}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax Amount',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Rs '
                                '${Decimal.parse(state.orderItemRetriveList?.orderItem?[index].tax.toString() ?? '0.0')}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Platform Charge',
                              ),
                              Text(
                                'Rs '
                                '${Decimal.parse(state.orderItemRetriveList?.orderItem?[index].platformCharge.toString() ?? '0.0')}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                              ),
                              Text(
                                'Rs '
                                '${Decimal.parse(state.orderItemRetriveList?.orderItem?[index].platformChargeDiscount.toString() ?? '0.0')}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  }),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Rs '
                '${state.orderItemRetriveList?.grandTotal.toString()}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
