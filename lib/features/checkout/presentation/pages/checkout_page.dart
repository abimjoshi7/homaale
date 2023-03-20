import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_event.dart';
import 'package:cipher/features/payment/presentation/pages/payment_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';


class CheckoutPage extends StatelessWidget {
  static const routeName = '/checkout-page';
  const CheckoutPage({super.key});

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
            child: const Text('Checkout'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Billing Location',
                                      style: kPurpleText16,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const IconText(
                                  label: 'Bagbazaar, Kathmandu',
                                  iconData: Icons.location_on_outlined,
                                  color: Colors.pink,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CustomCheckBox(
                                        onTap: () {},
                                      ),
                                      addHorizontalSpace(10),
                                      const Text(
                                        'Same as task location',
                                        style: kBodyText1,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        addVerticalSpace(5),
                        Card(
                          child: ListTile(
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Service List',
                                      style: kPurpleText16,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Placeholder(
                                        fallbackHeight: 70,
                                        fallbackWidth: 70,
                                      ),
                                      addHorizontalSpace(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Trimming & Cutting'),
                                          const IconText(
                                            label: 'Bagbazaar, Kathmandu',
                                            iconData:
                                                Icons.location_on_outlined,
                                            color: Colors.pink,
                                          ),
                                          Row(
                                            children: const [
                                              IconText(
                                                label: 'June 02, 2022',
                                                iconData:
                                                    Icons.location_on_outlined,
                                                color: Colors.pink,
                                              ),
                                              IconText(
                                                label: 'June 02, 2022',
                                                iconData:
                                                    Icons.location_on_outlined,
                                                color: Colors.pink,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      addHorizontalSpace(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Icon(Icons.delete),
                                          Text(
                                            'Rs 3,000',
                                            style: kText15,
                                          ),
                                          Text(
                                            '/per project',
                                            style: kHelper13,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xffF0F8FD),
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add voucher or promo code',
                            style: kPurpleText16,
                          ),
                          addVerticalSpace(
                            5,
                          ),
                          Row(
                            children: [
                              const Flexible(
                                flex: 3,
                                child: CustomTextFormField(
                                  hintText: 'Enter code',
                                ),
                              ),
                              Flexible(
                                child: CustomElevatedButton(
                                  callback: () {},
                                  label: 'Apply',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Details',
                            style: kPurpleText16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Service Charge'),
                              Text('Rs 3,000'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Service Charge'),
                              Text('Rs 3,000'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Service Charge'),
                              Text('Rs 3,000'),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Total'),
                              Text('Rs 3,000'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    'Get Membership',
                    style: kPurpleText16,
                  ),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Free trial',
                              style: kPurpleText13,
                            ),
                            const SizedBox(
                              width: 150,
                              child: CustomModalSheetDrawerIcon(
                                color: kColorPrimary,
                              ),
                            ),
                            const Text(
                              'Free',
                              style: kPurpleText16,
                            ),
                            addVerticalSpace(20),
                            const IconText(
                              label: 'Up to 2 users',
                              iconData: Icons.circle,
                              size: 10,
                            ),
                            const IconText(
                              label: 'Up to 2 users',
                              iconData: Icons.circle,
                              size: 10,
                            ),
                            const IconText(
                              label: 'Up to 2 users',
                              iconData: Icons.circle,
                              size: 10,
                            ),
                            addVerticalSpace(40),
                            SizedBox(
                              height: 45,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomElevatedButton(
                                  callback: () {},
                                  label: 'Select Plan',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          addHorizontalSpace(10),
                      itemCount: 5,
                    ),
                  ),
                  const Text(
                    'Popular on Homaale',
                    style: kPurpleText16,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffBCD4FA),
            ),
            child: Padding(
              padding: kPadding20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Total Price'),
                      Text(
                        // "Rs. ${state.result.budgetTo}",
                        "Rs. 200",
                        style: kText20,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: CustomElevatedButton(
                      callback: () {
                        context
                            .read<PaymentTypeBloc>()
                            .add(const PaymentTypeListInitiated());
                        Navigator.pushNamed(
                          context,
                          PaymentPage.routeName,
                        );
                      },
                      label: 'Proceed',
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
