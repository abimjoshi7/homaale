import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:cipher/features/payment/presentation/pages/add_payment_method_page.dart';
import 'package:cipher/features/payment/presentation/pages/widgets/common_wallet_card.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payment-page';
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final SizedBox commonSize = const SizedBox(
    height: 20,
  );
  RadioChangeValue? defaultValue = RadioChangeValue.khalti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentBloc, PaymentIntentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
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
                  padding: const EdgeInsets.all(20),
                  child: CustomFormField(
                    label: 'Payment Methods',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.eSewa,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://esewa.com.np/common/images/esewa-icon-large.png',
                          walletName: 'Esewa Mobile Wallet',
                          walletCardNo: '*****09876',
                          // radioValue: RadioChangeValue.eSewa,
                        ),
                        commonSize,
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.khalti,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                  log('$defaultValue');
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://dao578ztqooau.cloudfront.net/static/img/logo1.png',
                          walletName: 'Khalti Digital Wallet',
                          walletCardNo: '*****09876',
                          // radioValue: RadioChangeValue.khalti,
                        ),
                        commonSize,
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.masterCard,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png',
                          walletName: 'Master Card',
                          walletCardNo: '*****09876',
                          // radioValue: RadioChangeValue.masterCard,
                        ),
                        commonSize,
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.visaCard,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://usa.visa.com/dam/VCOM/regional/ve/romania/blogs/hero-image/visa-logo-800x450.jpg',
                          walletName: 'Visa Card',
                          walletCardNo: '*****09876',
                          // radioValue: RadioChangeValue.visaCard,
                        ),
                        commonSize,
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.googlePay,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://1000logos.net/wp-content/uploads/2020/04/Google-Pay-Logo.png',
                          walletName: 'Google Pay',
                          walletCardNo: '*****09876',
                          // radioValue: RadioChangeValue.googlePay,
                        ),
                        commonSize,
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.paypal,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://1000logos.net/wp-content/uploads/2017/05/emblem-Paypal.jpg',
                          walletName: 'Paypal',
                          walletCardNo: '*****09876',
                          // radioValue:RadioChangeValue.paypal,
                        ),
                        commonSize,
                        CommonWalletDisplayCard(
                          radio: Radio<RadioChangeValue>(
                            value: RadioChangeValue.applePay,
                            groupValue: defaultValue,
                            onChanged: (RadioChangeValue? value) {
                              setState(
                                () {
                                  defaultValue = value;
                                },
                              );
                            },
                          ),
                          walletAssets:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ0oB4mcJKRwvUTySReKWZX5l2kqAXzTxMmRMdBFxucWGX_449WCjGYLAa5SgvzGnesg4&usqp=CAU',
                          walletName: 'Apple Pay',
                          walletCardNo: '*****09876',
                          // radioValue: RadioChangeValue.applePay,
                        ),
                        addVerticalSpace(20),
                        const Text(
                          'Other payment methods',
                          style: kBodyText1,
                        ),
                        addVerticalSpace(10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: ListTile(
                            leading: const Icon(Icons.credit_card),
                            title: const Text('Add Payment Method'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_outlined),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AddPaymentMethodPage.routeName,
                              );
                            },
                          ),
                        ),
                        // addVerticalSpace(20),
                      ],
                    ),
                  ),
                ),
                CustomElevatedButton(
                  callback: () async {
                    final Uri url = Uri.parse(
                      state.paymentIntent?.data?.paymentUrl ?? '',
                      // 'https://test-pay.khalti.com/?pidx=oaYidQWSwrRo2HpeCVj6h4',
                    );
                    context.read<PaymentBloc>().add(
                          PaymentIntentInitiated(
                            provider: defaultValue == RadioChangeValue.khalti
                                ? "khalti"
                                : defaultValue == RadioChangeValue.eSewa
                                    ? "esewa"
                                    : defaultValue ==
                                            RadioChangeValue.masterCard
                                        ? "mastercard"
                                        : defaultValue ==
                                                RadioChangeValue.visaCard
                                            ? 'visacard'
                                            : defaultValue ==
                                                    RadioChangeValue.googlePay
                                                ? "googlepay"
                                                : defaultValue ==
                                                        RadioChangeValue.paypal
                                                    ? 'paypal'
                                                    : 'applepay',
                            uuid: '5d99da8f-be5b-409c-88b4-f4e4a04bcdd9',
                          ),
                        );
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  label: 'Proceed',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
