import 'dart:math';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_event.dart';
import 'package:cipher/widgets/loading_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../box/presentation/bloc/order_retrive_bloc.dart';
import '../../../box/presentation/bloc/order_retrive_state.dart';
import '../../../checkout/presentation/pages/checkout_page.dart';
import '../../../payment/presentation/bloc/payment_bloc.dart';
import '../../../payment/presentation/bloc/payment_type_bloc.dart';
import '../../../payment/presentation/bloc/payment_type_list_state.dart';
import '../../../payment/presentation/pages/payment_ongoing_page.dart';

class OrderInvoicePage extends StatefulWidget {
  static const routeName = '/order-invoice-page';
  const OrderInvoicePage({super.key});

  @override
  State<OrderInvoicePage> createState() => _OrderInvoicePageState();
}

class _OrderInvoicePageState extends State<OrderInvoicePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final orderID = ModalRoute.of(context)?.settings.arguments as String;
    return LoadingWidget(
      isLoading: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(
          appBarTitle: 'Invoice',
          trailingWidget: SizedBox(),
        ),
        body: BlocBuilder<OrderItemRetriveBloc, OrderItemRetriveState>(
          builder: (context, retriveState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          retriveState.orderItemRetriveList?.orderItem?.length,
                      itemBuilder: (context, index) {
                        return OrderCard(
                          trailingLabel: retriveState.orderItemRetriveList
                                  ?.orderItem![index].task?.id!
                                  .substring(
                                      0,
                                      min(
                                          retriveState
                                              .orderItemRetriveList!
                                              .orderItem![index]
                                              .task!
                                              .id!
                                              .length,
                                          3)) ??
                              "",
                          serviceName: retriveState.orderItemRetriveList
                              ?.orderItem![index].task?.title,
                          dateTime: retriveState.orderItemRetriveList
                              ?.orderItem![index].createdAt,
                        );
                      }),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        retriveState.orderItemRetriveList?.orderItem?.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        leadinglabel: 'Order Details ',
                        trailingLabel: retriveState
                            .orderItemRetriveList?.orderItem![index].task?.id!
                            .substring(
                                0,
                                min(
                                    retriveState.orderItemRetriveList!
                                        .orderItem![index].task!.id!.length,
                                    3)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'Price',
                                  style: Theme.of(context).textTheme.bodyLarge,

                                  // style: kText15,
                                ),
                                Text(
                                  'Total',
                                  style: Theme.of(context).textTheme.bodyLarge,

                                  // style: kText15,
                                ),
                              ],
                            ),
                            const Divider(),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Text(retriveState.orderItemRetriveList
                                          ?.orderItem![index].task?.title ??
                                      ""),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Text(
                                      '${retriveState.orderItemRetriveList?.orderItem![index].task?.currency}'
                                      '   ${Decimal.parse(retriveState.orderItemRetriveList?.orderItem![index].amount ?? "0.0").toStringAsFixed(2)}'),
                                ),
                                SizedBox(
                                  child: Text(
                                      '${retriveState.orderItemRetriveList?.orderItem![index].task?.currency}'
                                      '   ${retriveState.orderItemRetriveList?.grandTotal ?? ""}'),
                                ),
                              ],
                            ),
                            addVerticalSpace(5),
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    retriveState
                                            .orderItemRetriveList
                                            ?.orderItem![index]
                                            .task
                                            ?.assigner
                                            ?.designation ??
                                        "",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  PaymentDetailsContainer(
                    state: retriveState,
                  ),
                  addVerticalSpace(20),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<PaymentTypeBloc, PaymentTypeListState>(
                builder: (context, paymentTypeState) {
                  return BlocListener<PaymentBloc, PaymentIntentState>(
                    listener: (context, stateType) async {
                      if (stateType.theState == TheStates.success) {
                        setState(() => isLoading = false);
                        await Navigator.pushNamed(
                            context, PaymentOnGoingPage.routeName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Payment Failure.Please try again after sometime."),
                          duration: const Duration(seconds: 1),
                        ));
                        // Navigator.pop(context);
                      }
                    },
                    child: BlocBuilder<PaymentBloc, PaymentIntentState>(
                      builder: (context, state) {
                        return CustomElevatedButton(
                          callback: () async {
                            setState(() => isLoading = true);
                            context.read<PaymentBloc>().add(
                                  PaymentIntentInitiated(
                                    provider: paymentTypeState
                                            .paymentType
                                            ?.result![
                                                paymentTypeState.currentIndex!]
                                            .slug ??
                                        "",
                                    uuid: orderID,
                                  ),
                                );
                          },
                          label: 'Confirm Payment',
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    this.child,
    this.leadinglabel,
    this.trailingLabel,
    this.serviceName,
    this.dateTime,
  });

  final String? leadinglabel;
  final String? trailingLabel;
  final String? serviceName;
  final String? dateTime;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              color: Theme.of(context).cardColor,
            ),
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        leadinglabel ?? 'Order Information',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Invoice#-0${trailingLabel ?? ''}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: child ??
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Service Provider: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      serviceName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date/Time',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    Jiffy(dateTime ?? "").yMMMMd,
                                    // 'June 28, 2022 12:12 pm',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
