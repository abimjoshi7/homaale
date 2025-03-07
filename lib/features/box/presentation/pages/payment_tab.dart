import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_event.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_state.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_state.dart';
import 'package:cipher/features/checkout/presentation/pages/checkout_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/custom_toast.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../error_pages/no_internet_page.dart';
import '../../../user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';

class PaymentTab extends StatefulWidget {
  const PaymentTab({super.key});

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  final orderIdCreateBloc = locator<OrderIdCreateBloc>();
  final TextStyle style = TextStyle(color: Colors.black, fontSize: 14);
  List<int> selectedItems = [];
  List<String> selectedUuid = [];

  double sum = 0.0;
  int currentIndex = 0;

  String getTotalPrice(OrderItemListState state) {
    if (selectedItems.isNotEmpty) {
      sum = 0.0;
      for (var items in selectedItems) {
        sum = sum + double.parse(state.orderItemList?.result?[items].price.toString() ?? "0.0");
      }
      return double.parse(sum.toStringAsFixed(2)).toString();
    }
    return "Rs. 0.0";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderItemListBloc, OrderItemListState>(
      builder: (context, state) {
        switch (state.theStates) {
          case TheStates.success:
            if (state.orderItemList?.result!.length == 0) {
              return Center(
                  child: CommonErrorContainer(
                assetsPath: 'assets/no_data_found.png',
                errorTile: 'Payment Item not available right Now.',
                errorDes: 'We’re sorry, the data you search could not found. '
                    'Please go back.',
              ));
            } else {
              return Scaffold(
                bottomNavigationBar: selectedItems.isNotEmpty
                    ? Container(
                        // height: MediaQuery.of(context).size.height * 0.15,
                        margin: EdgeInsets.only(bottom: 100),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                              thickness: 1.5,
                            ),
                            BlocBuilder<OrderIdCreateBloc, OrderIdCreateState>(
                              bloc: orderIdCreateBloc,
                              builder: (context, orderState) {
                                return GestureDetector(
                                  onTap: () {
                                    selectedUuid = [];

                                    for (var items in selectedItems) {
                                      setState(() {
                                        selectedUuid.add(state.orderItemList?.result?[items].id ?? "");
                                      });
                                    }

                                    orderIdCreateBloc.add(OrderIdCreateInitiated(uuid: selectedUuid));

                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () {
                                        if (orderIdCreateBloc.state.orderIdCreate?.order != null ||
                                            (orderIdCreateBloc.state.orderIdCreate?.order?.isNotEmpty ?? false)) {
                                          context.read<UserSuspendBloc>().state.userAccountSuspension?.isSuspended ==
                                                  true
                                              ? showDialog(
                                                  context: context,
                                                  builder: (context) => AccountSuspendCustomToast(
                                                    heading: 'ACCOUNT SUSPENDED',
                                                    content: 'User is suspended',
                                                  ),
                                                )
                                              : Navigator.pushNamed(context, CheckoutPage.routeName, arguments:
                                                  // orderIdCreateBloc
                                                  //     .state
                                                  //     .orderIdCreate
                                                  //     ?.order
                                                  {'orderId': orderIdCreateBloc.state.orderIdCreate?.order});
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) => CustomToast(
                                              heading: 'Failed',
                                              content: 'Payment failed, please try again!',
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              isSuccess: false,
                                            ),
                                          );
                                        }
                                      },
                                    );
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
                                              '${state.orderItemList?.result?[currentIndex].currency?.symbol} ' +
                                                  getTotalPrice(state),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Color(0Xff00D084),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'Proceed to Payment ',
                                          style: TextStyle(
                                              color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' For bulk payment, please choose items with same currency.',
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.orderItemList?.result!.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              currentIndex = index;
                              if (selectedItems.contains(index)) {
                                setState(() {
                                  selectedItems.remove(index);
                                });
                              } else {
                                setState(() {
                                  selectedItems.add(index);
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedItems.contains(index) ? Color(0xffDEB988) : Colors.grey.shade300,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          // width: 300.0,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 82,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(16.0),
                                                      image: DecorationImage(
                                                        image: NetworkImage((state.orderItemList?.result?[index]
                                                                    .entityService?.images?.length ==
                                                                0)
                                                            ? kHomaaleImg
                                                            : state.orderItemList?.result![index].entityService?.images
                                                                    ?.last.media ??
                                                                kHomaaleImg),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5,
                                                    top: 5,
                                                    child: selectedItems.contains(index)
                                                        ? Icon(
                                                            Icons.check_circle_outline,
                                                            color: kColorSecondary,
                                                          )
                                                        : SizedBox(),
                                                  ),
                                                ],
                                              ),
                                              addHorizontalSpace(8),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.64,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(state.orderItemList?.result![index].entityService!.title ??
                                                                ""
                                                            // 'Trimming & Cutting',
                                                            ),
                                                      ],
                                                    ),
                                                    addVerticalSpace(8),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on_outlined,
                                                              size: 16,
                                                              color: Colors.red,
                                                            ),
                                                            Text(
                                                              state.orderItemList?.result?[index].entityService?.city
                                                                      ?.name ??
                                                                  "",
                                                              style: Theme.of(context).textTheme.bodySmall,
                                                              maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    addVerticalSpace(8),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.calendar_month,
                                                                  size: 20,
                                                                  color: Colors.red,
                                                                ),
                                                                Text(
                                                                  '${state.orderItemList?.result![index].startDate ?? ""}',
                                                                  style: Theme.of(context).textTheme.bodySmall,
                                                                ),
                                                              ],
                                                            ),
                                                            addHorizontalSpace(
                                                              16,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.watch_later_outlined,
                                                                  size: 20,
                                                                  color: Colors.blue,
                                                                ),
                                                                Text(
                                                                  '${state.orderItemList!.result![index].startTime ?? '00:00:00'}',
                                                                  style: Theme.of(context).textTheme.bodySmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(6.0),
                                              margin: const EdgeInsets.all(6.0),
                                              height: 25.0,
                                              width: 65.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xffEDF4FF),
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  state.orderItemList!.result?[index].entityService?.isRequested == true
                                                      ? 'Task'
                                                      : 'Service',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(fontSize: 10.0, color: kColorPrimary),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 16.0, right: 10),
                                              child: Text(
                                                '${state.orderItemList?.result?[index].currency?.symbol}'
                                                '${Decimal.parse(state.orderItemList?.result?[index].price.toString() ?? "0").toStringAsFixed(2)}',
                                                style: Theme.of(context).textTheme.bodySmall,
                                              ),
                                            ),
                                            const Text(
                                              '/project',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            // Text(
                                            //   'Booking:',
                                            //   style: Theme.of(context).textTheme.bodySmall,
                                            // ),
                                            addHorizontalSpace(5),
                                            SizedBox(
                                              height: 30,
                                              child: Chip(
                                                backgroundColor: Colors.lightBlue.shade50,
                                                label: Text(
                                                  'Approved',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.lightBlue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'Booking Details',
                                          style: TextStyle(
                                            color: kColorSecondary,
                                            decoration: TextDecoration.underline,
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
                    ),
                    selectedItems.isNotEmpty
                        ? SizedBox.shrink()
                        : SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  ],
                ),
              );
            }
          case TheStates.failure:
            return Center(child: CardLoading(height: 50));
          default:
            return CardLoading(height: 50);
        }
      },
    );
  }
}
