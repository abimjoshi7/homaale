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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 100,
                color: Colors.amber,
              ),
              Column(
                children: [
                  Text(
                    'INVOICE',
                    style: kPurpleText16,
                  ),
                  Text(
                    'INV#-0023',
                    style: kPurpleText16,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text('Bill To'),
              Text('Bill To'),
              Text('Bill To'),
              Text('Bill To'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text('Balance Due'),
                      Text('Rs.3000.00'),
                    ],
                  ),
                ],
              )
            ],
          ),
          CustomElevatedButton(
            callback: () {},
          ),
          CustomElevatedButton(
            callback: () {},
          ),
        ],
      ),
    );
  }
}
