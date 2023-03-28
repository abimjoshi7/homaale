import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_list_state.dart';
import 'package:cipher/features/payment/presentation/pages/add_payment_method_page.dart';
import 'package:cipher/features/payment/presentation/pages/payment_summary_page.dart';
import 'package:cipher/features/payment/presentation/pages/widgets/common_wallet_card.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../bloc/payment_type_bloc.dart';

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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentTypeBloc, PaymentTypeListState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Methods',
                        style: TextStyle(color: Colors.blue),
                      ),
                      if (state.theState == TheStates.initial)
                        const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state.theState == TheStates.success &&
                          state.paymentType!.result != null)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.paymentType?.result!.length,
                            itemBuilder: (context, index) {
                              return CommonWalletDisplayCard(
                                radio: Builder(
                                  builder: (BuildContext context) {
                                    print(state.paymentType?.result!.length);
                                    return Radio(
                                      groupValue:
                                          state.paymentType?.result![index],
                                      value: state
                                          .paymentType?.result![currentIndex],
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            currentIndex = index;
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                walletAssets:
                                    state.paymentType?.result![index].logo ??
                                        "",
                                walletName:
                                    state.paymentType?.result![index].name ??
                                        "",
                                walletCardNo: state
                                        .paymentType?.result![index].id
                                        .toString() ??
                                    "",
                              );
                            }),
                      commonSize,
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
                CustomElevatedButton(
                  callback: () {
                    Navigator.pushNamed(
                      context,
                      PaymentSummaryPage.routeName,
                    );
                    print(currentIndex);
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
