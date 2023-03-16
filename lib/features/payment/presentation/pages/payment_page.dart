import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:cipher/features/payment/presentation/pages/add_payment_method_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
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
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomFormField(
            label: 'Payment Methods',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: ListTile(
                    leading: Image.asset('assets/logos/esewa 1.png'),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Esewa Digital Wallet'),
                        Text('*****09876')
                      ],
                    ),
                    trailing: Radio(
                      value: 'esewa',
                      groupValue: 'Khalti',
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Card(
                  child: ListTile(
                    leading: Image.network('https://dao578ztqooau.cloudfront.net/static/img/logo1.png'),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                addVerticalSpace(20),
                const Text(
                  'Other payment methods',
                  style: kBodyText1,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 90,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/logos/payment/Payment-method-button-40px1.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => addHorizontalSpace(
                      10,
                    ),
                    itemCount: 4,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: const Text('Add Payment Method'),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AddPaymentMethodPage.routeName,
                      );
                    },
                  ),
                ),
                addVerticalSpace(20),
              ],
            ),
          ),
        ),
        BlocBuilder<PaymentBloc, PaymentIntentState>(
          builder: (context, state) {
            return CustomElevatedButton(
              callback: () async {
                final Uri url = Uri.parse(
                  state.paymentIntent!.data!.paymentUrl!,
                );
                context.read<PaymentBloc>().add(
                      const PaymentIntentInitiated(
                          provider: "khalti",
                          uuid: '5d99da8f-be5b-409c-88b4-f4e4a04bcdd9'),
                    );
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
                // Navigator.pushNamed(
                //   context,
                //   PaymentSummaryPage.routeName,
                // );
              },
              label: 'Proceed',
            );
          },
        ),
      ],
    ));
  }
}
