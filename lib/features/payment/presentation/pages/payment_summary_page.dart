import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/order/presentation/pages/order_invoice_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final orderID = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Payment Summary',trailingWidget: SizedBox()
      ),
      body: BlocBuilder<OrderItemRetriveBloc, OrderItemRetriveState>(
          builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Booking Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 30, top: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name'),
                                Text('Price'),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Divider(),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: state.orderItemRetriveList
                                          ?.orderItem?.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                state
                                                        .orderItemRetriveList
                                                        ?.orderItem?[index]
                                                        .task
                                                        ?.title ??
                                                    "",
                                                style: TextStyle(
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Text(
                                                '${state.orderItemRetriveList?.orderItem?[index].task?.currency} '
                                                '${Decimal.parse(state.orderItemRetriveList?.orderItem?[index].amount ?? '0.0').toStringAsFixed(2)}'),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Text(
                                      '${state.orderItemRetriveList?.orderItem?[0].task?.currency} '
                                      '${state.orderItemRetriveList?.grandTotal}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Text(
                        'Payment Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: BlocBuilder<PaymentTypeBloc, PaymentTypeListState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                state
                                        .paymentType
                                        ?.result![state.currentIndex ?? 0]
                                        .logo ??
                                    "",
                                height: 100,
                                width: 100,
                                scale: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  state
                                          .paymentType
                                          ?.result![state.currentIndex ?? 0]
                                          .name ??
                                      "",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    CommonBillingAddressContainer(),
                  ],
                ),
              ),
              Center(
                child: CustomElevatedButton(
                  callback: () {
                    Navigator.pushNamed(
                      context,
                      OrderInvoicePage.routeName,
                      arguments: orderID,
                    );
                    print("second orderId: ${orderID}");
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
          ),
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
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Billing Details',
            style: Theme.of(context).textTheme.headlineSmall,
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
              Text(
                'Same as task location',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
