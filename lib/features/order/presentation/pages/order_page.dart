import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/invoice/presentation/pages/invoice_page.dart';
import 'package:cipher/widgets/my_seperator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order-page';
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          CustomHeader(
            leadingWidget: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            trailingWidget: IconButton(
              onPressed: () {
                // Navigator.pushNamed(
                //   context,
                //   CompleteProfilePage.routeName,
                // );
              },
              icon: const Icon(Icons.search),
            ),
            child: const Text('Your Order'),
          ),
          const OrderCard(),
          addVerticalSpace(10),
          OrderCard(
            leadinglabel: 'Order Details',
            trailingLabel: '',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Text('Trimming & Cutting'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Text('Rs 1200'),
                    ),
                    const SizedBox(
                      child: Text('Rs 1180'),
                      // width: MediaQuery.of(context).size.width / 3,
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Text(
                        'Planting + Watering + Trimming trees and shrubs + Landscape plans + Fertilizing & Mowing Lawns',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          addVerticalSpace(10),
          OrderCard(
            leadinglabel: 'Payment Details',
            trailingLabel: '',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Service Charge:',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Rs 1,200',
                      style: kPurpleText16,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Service Charge:',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Rs 1,200',
                      style: kPurpleText16,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Service Charge:',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Rs 1,200',
                      style: kPurpleText16,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Service Charge:',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Rs 1,200',
                      style: kPurpleText16,
                    ),
                  ],
                ),
                addVerticalSpace(5),
                const MySeparator(),
                addVerticalSpace(5),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Service Charge:',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Rs 1,200',
                        style: kPurpleText16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(20),
          CustomElevatedButton(
            label: 'Confirm Payment',
            callback: () {
              Navigator.pushNamed(
                context,
                InvoicePage.routeName,
              );
            },
          )
        ],
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
  });

  final String? leadinglabel;
  final String? trailingLabel;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
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
                        trailingLabel ?? 'Invoice#-0023',
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
                                children: const [
                                  Text(
                                    'Service Provider:',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Modern Gardener',
                                    style: kPurpleText16,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Customer ID:',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '72633',
                                    style: kPurpleText16,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Date/Time',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'June 28, 2022 12:12 pm',
                                    style: kPurpleText16,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Billing Address:',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Bagbazaar, Kathmandu',
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
