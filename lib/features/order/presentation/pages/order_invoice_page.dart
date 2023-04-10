import 'dart:math';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_event.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../box/presentation/bloc/order_id_create_bloc.dart';
import '../../../box/presentation/bloc/order_id_create_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: const Text(
          'Invoice',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                                        retriveState.orderItemRetriveList!
                                            .orderItem![index].task!.id!.length,
                                        3)) ??
                            "",
                        serviceName: retriveState.orderItemRetriveList
                            ?.orderItem![index].task?.title,
                        dateTime: retriveState
                            .orderItemRetriveList?.orderItem![index].createdAt,
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
                            children: const [
                              Text(
                                'Name',
                                style: kText15,
                              ),
                              Text(
                                'Price',
                                style: kText15,
                              ),
                              Text(
                                'Total',
                                style: kText15,
                              ),
                            ],
                          ),
                          const Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(retriveState.orderItemRetriveList
                                        ?.orderItem![index].task?.title ??
                                    ""),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text('Rs'
                                    '   ${retriveState.orderItemRetriveList?.orderItem![index].amount ?? ""}'),
                              ),
                              SizedBox(
                                child: Text('Rs'
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
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
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
                return BlocBuilder<PaymentBloc, PaymentIntentState>(
                  builder: (context, state) {
                    return BlocBuilder<OrderIdCreateBloc, OrderIdCreateState>(
                        builder: (context, orderState) {
                      return CustomElevatedButton(
                          callback: () async {
                            if (state.theState == TheStates.success) {
                              context.read<PaymentBloc>().add(
                                    PaymentIntentInitiated(
                                      provider: paymentTypeState
                                              .paymentType
                                              ?.result![paymentTypeState
                                                  .currentIndex!]
                                              .slug ??
                                          "",
                                      uuid:
                                          orderState.orderIdCreate?.order ?? "",
                                    ),
                                  );
                              print(
                                  'stripe: ${paymentTypeState.paymentType?.result![paymentTypeState.currentIndex!].slug}');
                              context.read<PaymentVerifyBloc>().add(
                                    PaymentVerifyInitiated(
                                      provider: paymentTypeState
                                              .paymentType
                                              ?.result![paymentTypeState
                                                  .currentIndex!]
                                              .slug ??
                                          "",
                                      pidx:
                                          state.paymentIntent?.data?.pidx ?? "",
                                    ),
                                  );
                              await Navigator.pushNamed(
                                  context, PaymentOnGoingPage.routeName);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (context) => CustomToast(
                                  heading: 'Failure',
                                  content: "Please try again.",
                                  onTap: () {},
                                  isSuccess: false,
                                ),
                              );
                            }
                          },
                          label: 'Confirm Payment');
                    });
                  },
                );
              },
            ),
            SizedBox(
              height: 25,
            )
          ],
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
              color: const Color(0xffECECF2),
            ),
            height: 180,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        leadinglabel ?? 'Order Information',
                        style: kLabelPrimary,
                      ),
                      Text(
                        'Invoice#-0${trailingLabel ?? ''}',
                        style: kLabelPrimary,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
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
                                    'Service Provider:',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    serviceName ?? "",
                                    style: kPurpleText16,
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
                                    dateTime ?? "",
                                    // 'June 28, 2022 12:12 pm',
                                    style: kPurpleText16,
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
