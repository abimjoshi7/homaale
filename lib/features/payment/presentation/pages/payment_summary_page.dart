import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/order/presentation/pages/order_invoice_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../locator.dart';
import '../../../box/presentation/bloc/order_retrive_bloc.dart';
import '../../../box/presentation/bloc/order_retrive_state.dart';
import '../bloc/payment_type_bloc.dart';
import '../bloc/payment_type_list_state.dart';

class PaymentSummaryPage extends StatefulWidget {
  static const routeName = '/payment-summary-page';
  const PaymentSummaryPage({
    super.key,
  });

  @override
  State<PaymentSummaryPage> createState() => _PaymentSummaryPageState();
}

class _PaymentSummaryPageState extends State<PaymentSummaryPage> {
  final paymentTypeBloc = locator<PaymentTypeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Payment Summary',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
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

          builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: const Text(
                          'Booking Details',
                          style: kPurpleText16,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 30, top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Name'),
                                  Text('Price'),
                                  Text('Total'),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                      '.........................................................................................................................'),
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                        itemCount: state.orderItemRetriveList
                                            ?.orderItem?.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state
                                                        .orderItemRetriveList
                                                        ?.orderItem![index]
                                                        .task
                                                        ?.title ??
                                                    "",
                                                style: TextStyle(
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text('Rs '
                                                  '${state.orderItemRetriveList?.orderItem![index].amount}'),
                                              Text('Rs '
                                                  '${state.orderItemRetriveList?.grandTotal}'),
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: const Text(
                          'Payment Details',
                          style: kPurpleText16,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child:
                            BlocBuilder<PaymentTypeBloc, PaymentTypeListState>(
                              bloc: paymentTypeBloc,
                          builder: (context, state) {
                                print(paymentTypeBloc.state.currentIndex);
                                print(state.paymentType?.result![0]);
                            return ListTile(
                              leading: Image.network(
                                // paymentTypeBloc.state.paymentType?.result![paymentTypeBloc.state.currentIndex!].logo ?? "",
                                state.paymentType?.result![0].logo ?? "",
                                height: 100,
                                width: 100,
                                scale: 1,
                              ),
                              title: Text(
                                  state.paymentType?.result![0].name
                                  // paymentTypeBloc.state.paymentType?.result![paymentTypeBloc.state.currentIndex!].name
                                      ?? ""),
                              subtitle: Text(
                                  state.paymentType?.result![0].id.toString()
                                  // paymentTypeBloc.state.paymentType?.result![paymentTypeBloc.state.currentIndex!].id.toString()
                                      ??
                                      ''),
                            );
                          },
                        ),
                      ),
                      CommonBillingAddressContainer(),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: CustomElevatedButton(
                callback: () {
                  Navigator.pushNamed(context, OrderInvoicePage.routeName);
                },
                label: 'Confirm',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomElevatedButton(
                borderColor: kColorPrimary,
                mainColor: Colors.white,
                callback: () {
                  Navigator.pop(context);
                },
                label: 'Cancel',
                textColor: kColorPrimary,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }
}

class CommonBillingAddressContainer extends StatelessWidget {
  const CommonBillingAddressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Billing Details',
            style: kPurpleText16,
          ),
          SizedBox(
            height: 10,
          ),
          const IconText(
            label: 'Bagbazaar, Kathmandu',
            iconData: Icons.location_on_outlined,
            color: Colors.pink,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.orangeAccent,
              ),
              addHorizontalSpace(10),
              const Text(
                'Same as task location',
                style: kBodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
