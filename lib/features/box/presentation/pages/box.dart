import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_event.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_event.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_state.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../bookings/presentation/widgets/sections/services/services_section.dart';
import '../../../checkout/presentation/pages/checkout_page.dart';
import '../bloc/order_id_create_bloc.dart';

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

  final TextStyle style = TextStyle(color: Colors.black, fontSize: 14);
  List<int> selectedItems = [];
  int current = 0;
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Box',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: BlocBuilder<OrderItemListBloc, OrderItemListState>(
        builder: (context, state) {
          print(_tabController.index);
          return Column(
            children: [
              TabBar(
                labelPadding: kPadding10,
                controller: _tabController,
                tabs: [
                  Text(
                    'Payment',
                  ),
                  Text(
                    'Waiting List',
                  ),
                  // Text('Saved'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: state.orderItemList?.result!.length,
                      itemBuilder: (context, index) {
                        // state.orderItemList?.result!.forEach((element) {
                        //   selectedItems=state.orderItemList?.result![index];
                        //   sum = (sum + element.entityService!.budgetTo!.toInt());
                        // });
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              if (selectedItems.contains(index)) {
                                selectedItems.remove(index);
                              } else {
                                selectedItems.add(index);
                              }
                            });
                            current = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedItems.contains(index)
                                    ? Color(0xffDEB988)
                                    : Colors.grey.shade300,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 200,
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 72,
                                            width: 72,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    //TODO: display media image from entity/service
                                                    state
                                                            .orderItemList
                                                            ?.result![index]
                                                            .assigner!
                                                            .profileImage ??
                                                        ""
                                                    // 'https://picsum.photos/1000/1000',
                                                    ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          addHorizontalSpace(8),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.65,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(state
                                                                .orderItemList
                                                                ?.result![index]
                                                                .entityService!
                                                                .title ??
                                                            ""
                                                        // 'Trimming & Cutting',
                                                        ),
                                                    // Icon(
                                                    //   Icons
                                                    //       .delete_outline_sharp,
                                                    //   color: Colors
                                                    //       .red,
                                                    // )
                                                  ],
                                                ),
                                                addVerticalSpace(8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 16,
                                                          color: Colors.red,
                                                        ),
                                                        Text(
                                                          state
                                                                  .orderItemList
                                                                  ?.result![
                                                                      index]
                                                                  .entityService!
                                                                  .city!
                                                                  .name ??
                                                              "",
                                                          // 'Buddhanagar, Kathmandu',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '${state.orderItemList?.result![index].currency!.symbol}'
                                                      '  '
                                                      '${state.orderItemList?.result![index].entityService!.budgetTo.toString() ?? "0"}',
                                                    ),
                                                  ],
                                                ),
                                                addVerticalSpace(8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              size: 20,
                                                              color: Colors.red,
                                                            ),
                                                            Text(
                                                              '  '
                                                              '${state.orderItemList?.result![index].startDate ?? ""}',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        addHorizontalSpace(
                                                          16,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .watch_later_outlined,
                                                              size: 20,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            Text(
                                                              '${state.orderItemList?.result![index].startTime ?? ""}',
                                                              // '8:00 PM',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const Text(
                                                      'per project',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: kColorSilver,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Booking:',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          addHorizontalSpace(4),
                                          Chip(
                                            backgroundColor:
                                                Colors.lightBlue.shade50,
                                            label: Text(
                                              'Approved',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.lightBlue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        child: const Text(
                                          'Booking Details',
                                          style: TextStyle(
                                            color: kColorSilver,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ServicesSection(isCheckPending: true),
                  ],
                ),
              ),
              if (selectedItems.isNotEmpty)
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 100.0,
                      top: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          height: 3,
                          thickness: 2,
                          color: Color(0Xff00D084),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<OrderIdCreateBloc>().add(
                                  OrderIdCreateInitiated(
                                      uuid: state.orderItemList
                                              ?.result![current].id ??
                                          ""),
                                );
                            Navigator.pushNamed(
                              context,
                              CheckoutPage.routeName,
                            );
                            // print('${state.orderItemList?.result![current].id}');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Price',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rs  '
                                      '${state.orderItemList?.result![current].entityService?.budgetTo.toString()}',
                                      // '${sum.toString()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color:  Color(0Xff00D084),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Proceed to Payment ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
