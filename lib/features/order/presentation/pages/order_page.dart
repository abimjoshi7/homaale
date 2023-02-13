import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/invoice/presentation/pages/invoice_page.dart';
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
          Container(
            height: 100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Information',
                      style: kLabelPrimary,
                    ),
                    Text(
                      'Invoice#-0023',
                      style: kLabelPrimary,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
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
