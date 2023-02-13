import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/order/presentation/pages/order_page.dart';
import 'package:cipher/widgets/my_seperator.dart';
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
          Column(
            children: [
              CustomFormField(
                label: 'Booking Details',
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name'),
                          Text('Price'),
                          Text('Total'),
                        ],
                      ),
                      MySeparator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Trimming & Cutting'),
                          Text('Rs 1200'),
                          Text('Rs 1180'),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        height: 60,
                        child: Text(
                          'Planting + Watering + Trimming trees and shrubs + Landscape plans + Fertilizing & Mowing Lawns',
                        ),
                      ),
                    ],
                  ),
                ),
                isRequired: false,
              ),
              CustomFormField(
                label: 'Payment Details',
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('data')],
                        ),
                        trailing: Icon(Icons.edit),
                      ),
                    )
                  ],
                ),
                isRequired: false,
              ),
            ],
          ),
          CustomElevatedButton(
            callback: () {
              Navigator.pushNamed(
                context,
                OrderPage.routeName,
              );
            },
          ),
          addVerticalSpace(10),
          CustomElevatedButton(
            callback: () {},
          ),
        ],
      ),
    );
  }
}
