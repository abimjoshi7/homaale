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
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomFormField(
                  label: 'Booking Details',
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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
                            children: const [
                              Text('Master Card'),
                              Text(
                                '****7892456',
                                style: kHelper13,
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Billing Location',
                              style: kPurpleText16,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        const IconText(
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
                              const Text(
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
