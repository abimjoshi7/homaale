import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  static const routeName = '/payment-page';
  const PaymentPage({super.key});

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
            child: const Text('Select Payment Method'),
          ),
          CustomFormField(
            label: 'Payment Methods',
            isRequired: false,
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Column(
                      children: [
                        Text('Khalti Digital Wallet'),
                        Text('*****09876')
                      ],
                    ),
                    trailing: Radio(
                      value: 'Khalti',
                      groupValue: 'Khalti',
                      onChanged: (value) {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
