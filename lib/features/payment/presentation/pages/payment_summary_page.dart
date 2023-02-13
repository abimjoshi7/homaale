import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/order/presentation/pages/order_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PaymentSummaryPage extends StatelessWidget {
  static const routeName = '/payment-summary-page';
  const PaymentSummaryPage({super.key});

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
            child: const Text('Payment Summary'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomFormField(
                  label: 'Booking Details',
                  isRequired: false,
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text('Trimming & Cutting'),
                                  width: MediaQuery.of(context).size.width / 3,
                                ),
                                SizedBox(
                                  child: Text('Rs 1200'),
                                  width: MediaQuery.of(context).size.width / 3,
                                ),
                                SizedBox(
                                  child: Text('Rs 1180'),
                                  // width: MediaQuery.of(context).size.width / 3,
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
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
                    ),
                  ),
                ),
                CustomFormField(
                  label: 'Payment Details',
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading:
                              Image.asset('assets/logos/Group 48099169.png'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Master Card'),
                              Text(
                                '****7892456',
                                style: kHelper13,
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                  isRequired: false,
                ),
                Card(
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Billing Location',
                              style: kPurpleText16,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        IconText(
                          label: 'Bagbazaar, Kathmandu',
                          iconData: Icons.location_on_outlined,
                          color: Colors.pink,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomCheckBox(
                                onTap: () {},
                              ),
                              addHorizontalSpace(10),
                              Text(
                                'Same as task location',
                                style: kBodyText1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(20),
          CustomElevatedButton(
            callback: () {
              Navigator.pushNamed(
                context,
                OrderPage.routeName,
              );
            },
            label: 'Confirm',
          ),
          addVerticalSpace(10),
          CustomElevatedButton(
            callback: () {},
            label: 'Cancel',
            textColor: kColorPrimary,
            mainColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
