import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  static const routeName = '/invoice-page';
  const InvoicePage({super.key});

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
            child: const Text('Invoice'),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/homaale_logo_title.png'),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'INVOICE',
                      style: kPurpleText19,
                    ),
                    addVerticalSpace(5),
                    const Text(
                      'INV#-0023',
                      style: kTealText18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bill To',
                    style: kTealText18,
                  ),
                  const Text(
                    'Dipesh Das',
                    style: kPurpleText16,
                  ),
                  const Text(
                    'Baneshwor, Kathmandu',
                    style: kPurpleText16,
                  ),
                  const Text(
                    'Nepal',
                    style: kPurpleText16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Balance Due',
                            style: kTealText18,
                          ),
                          Text(
                            'Rs.3000.00',
                            style: kPurpleText16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                        width: 0.5,
                        color: kColorGrey,
                      ),
                      bottom: BorderSide(
                        width: 0.5,
                        color: kColorGrey,
                      ),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(4),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                    },
                    children: const [
                      TableRow(
                        children: [
                          Text(
                            'Name',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Unit Price',
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Total',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                        decoration: BoxDecoration(
                          color: kColorPrimaryAccent,
                        ),
                      ),
                      TableRow(
                        children: [
                          Text('Gardening Service'),
                          Text('Nrs. 1000'),
                          Text(
                            'Nrs. 3000',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Flat Shipping Rate:'),
                          Text('Free (Inside valley only)'),
                          Text(''),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Grand Total'),
                          Text('Nrs. 1000'),
                          Text(''),
                        ],
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Sub Total',
                            style: kPurpleText16,
                          ),
                          addHorizontalSpace(20),
                          const Text(
                            'NPR 3000.00',
                            style: kPurpleText16,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Total',
                            style: kPurpleText16,
                          ),
                          addHorizontalSpace(20),
                          const Text(
                            'NPR 3000.00',
                            style: kPurpleText16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          addVerticalSpace(10),
          CustomElevatedButton(
            callback: () {},
            label: 'Download Invoice',
          ),
          addVerticalSpace(10),
          CustomElevatedButton(
            callback: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Root.routeName,
                (route) => false,
              );
            },
            label: 'Continue',
            mainColor: Colors.white,
            textColor: kColorPrimary,
          ),
          addVerticalSpace(50),
        ],
      ),
    );
  }
}
