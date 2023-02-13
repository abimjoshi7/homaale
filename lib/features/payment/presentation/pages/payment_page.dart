import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/pages/add_payment_method_page.dart';
import 'package:cipher/features/payment/presentation/pages/payment_summary_page.dart';
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                Text(
                  'Other payment methods',
                  style: kBodyText1,
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                      height: 25,
                      width: 30,
                      color: Colors.amber,
                    ),
                    separatorBuilder: (context, index) => addHorizontalSpace(
                      10,
                    ),
                    itemCount: 4,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Add Payment Method'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AddPaymentMethodPage.routeName,
                      );
                    },
                  ),
                ),
                addVerticalSpace(20),
                CustomElevatedButton(
                  callback: () {
                    Navigator.pushNamed(
                      context,
                      PaymentSummaryPage.routeName,
                    );
                  },
                  label: 'Proceed',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
