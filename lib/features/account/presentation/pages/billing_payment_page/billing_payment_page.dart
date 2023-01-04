import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account/presentation/widgets/account_list_tile_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BillingAndPaymentPage extends StatelessWidget {
  const BillingAndPaymentPage({super.key});
  static const routeName = '/billing-payment-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Billing & Payments',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffECECF2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Billing Address',
                            style: kPurpleText16,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'edit',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Customer ID :'),
                            Text(
                              '72633',
                              style: kPurpleText12,
                            ),
                          ],
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Name :'),
                            Text(
                              'Harry Smith',
                              style: kPurpleText12,
                            ),
                          ],
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Phone number :'),
                            Text(
                              '+977-9876543210',
                              style: kPurpleText12,
                            ),
                          ],
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Email :'),
                            Text(
                              'harrysmith@gmail.com',
                              style: kPurpleText12,
                            ),
                          ],
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Billing Address :'),
                            Text(
                              'Bagbazaar, Kathmandu',
                              style: kPurpleText12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Payment Methods',
                      style: kPurpleText16,
                    ),
                    Icon(Icons.arrow_drop_down_outlined)
                  ],
                ),
                kHeight10,
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Image.asset(
                                'assets/logos/Group 48099169.png',
                              ),
                            ),
                            kWidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Master Card'),
                                Text('**** 0330'),
                                kHeight10
                              ],
                            ),
                          ],
                        ),
                        CustomRadio(
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Image.asset('assets/logos/esewa 1.png'),
                            ),
                            kWidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Esewa Mobile Wallet'),
                                Text('******* 0330'),
                                kHeight10
                              ],
                            ),
                          ],
                        ),
                        CustomRadio(
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '+ Add payment method',
              style: kHeading2,
            ),
          ),
          AccountListTileSection(
            icon: const Text(
              'View transaction history',
              style: kPurpleText16,
            ),
            label: '',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
