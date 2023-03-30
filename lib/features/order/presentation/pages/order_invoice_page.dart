import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../box/presentation/bloc/order_retrive_bloc.dart';
import '../../../box/presentation/bloc/order_retrive_state.dart';
import '../../../checkout/presentation/pages/checkout_page.dart';
import '../../../payment/presentation/bloc/payment_bloc.dart';
import '../../../payment/presentation/bloc/payment_type_bloc.dart';
import '../../../payment/presentation/bloc/payment_type_list_state.dart';
import 'dart:math';

class OrderInvoicePage extends StatelessWidget {
  static const routeName = '/order-invoice-page';
  const OrderInvoicePage({super.key});

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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
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
              ),
              Expanded(
                child: ListView.builder(
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
                              // width: MediaQuery.of(context).size.width / 3,
                            ],
                          ),
                          addVerticalSpace(10),
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
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
              ),
              PaymentDetailsContainer(
                state: retriveState,
              ),
              // OrderCard(
              //   leadinglabel: 'Payment Details',
              //   trailingLabel: retriveState
              //       .orderItemRetriveList?.orderItem![0].task?.id!
              //       .substring(
              //       0,
              //       min(
              //           retriveState.orderItemRetriveList!.orderItem![0]
              //               .task!.id!.length,
              //           3)),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: const [
              //           Text(
              //             'Service Charge:',
              //             style: TextStyle(
              //               fontSize: 15,
              //             ),
              //           ),
              //           Text(
              //             'Rs 1,200',
              //             style: kPurpleText16,
              //           ),
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: const [
              //           Text(
              //             'Service Charge:',
              //             style: TextStyle(
              //               fontSize: 15,
              //             ),
              //           ),
              //           Text(
              //             'Rs 1,200',
              //             style: kPurpleText16,
              //           ),
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: const [
              //           Text(
              //             'Service Charge:',
              //             style: TextStyle(
              //               fontSize: 15,
              //             ),
              //           ),
              //           Text(
              //             'Rs 1,200',
              //             style: kPurpleText16,
              //           ),
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: const [
              //           Text(
              //             'Service Charge:',
              //             style: TextStyle(
              //               fontSize: 15,
              //             ),
              //           ),
              //           Text(
              //             'Rs 1,200',
              //             style: kPurpleText16,
              //           ),
              //         ],
              //       ),
              //       addVerticalSpace(5),
              //       const MySeparator(),
              //       addVerticalSpace(5),
              //       Expanded(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: const [
              //             Text(
              //               'Service Charge:',
              //               style: TextStyle(
              //                 fontSize: 15,
              //               ),
              //             ),
              //             Text(
              //               'Rs 1,200',
              //               style: kPurpleText16,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              addVerticalSpace(20),
              BlocBuilder<PaymentTypeBloc, PaymentTypeListState>(
                  builder: (context, paymentTypeState) {
                return BlocBuilder<PaymentBloc, PaymentIntentState>(
                  builder: (context, state) {
                    return
                        // paymentIntentStateOnly.theState == TheStates.initial
                        //   ? CircularProgressIndicator()
                        //   :
                        CustomElevatedButton(
                            callback: () async {
                              final Uri url = Uri.parse(
                                  state.paymentIntent?.data?.paymentUrl ?? ''
                                  // ' https://test-pay.khalti.com/?pidx=ZpEgm5wxH8WzP9bFctswo9',
                                  );
                              context.read<PaymentBloc>().add(
                                    PaymentIntentInitiated(
                                      provider: paymentTypeState
                                              .paymentType?.result![0].slug ??
                                          "khalti",
                                      uuid:
                                          '5d99da8f-be5b-409c-88b4-f4e4a04bcdd9',
                                    ),
                                  );
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            label: 'Confirm Payment');
                  },
                );
              })
            ],
          );
        },
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
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: const [
                              //     Text(
                              //       'Customer ID:',
                              //       style: TextStyle(
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //     Text(
                              //       '72633',
                              //       style: kPurpleText16,
                              //     )
                              //   ],
                              // ),
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
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: const [
                              //     Text(
                              //       'Billing Address:',
                              //       style: TextStyle(
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //     Text(
                              //       'Bagbazaar, Kathmandu',
                              //       style: kPurpleText16,
                              //     )
                              //   ],
                              // ),
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
