import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/complete_profile_page.dart';
import 'package:cipher/features/checkout/presentation/pages/checkout_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingNextDetailPage extends StatelessWidget {
  static const routeName = '/booking-next-detail-page';
  const BookingNextDetailPage({super.key});

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
                Navigator.pushNamed(
                  context,
                  CompleteProfilePage.routeName,
                );
              },
              icon: const Icon(Icons.search),
            ),
            child: const Text('Booking Details'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const CustomFormField(
                    label: 'Trimming & Cutting',
                    child: Text('data'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconText(
                        label: 'Jun 03,2022 to Nov 30,20222',
                        iconData: Icons.calendar_today_rounded,
                        color: Colors.deepOrange,
                      ),
                      IconText(
                        label: 'Estimated Time: 48 hrs',
                        iconData: Icons.calendar_today_rounded,
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomFormField(
                              label: 'What Service are you looking for ?',
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomFormField(
                              label: 'How many tress are affected ?',
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomFormField(
                              label: 'What Service are you looking for ?',
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: const Text('Only trimming'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                        Navigator.pushNamed(
                          context,
                          CheckoutPage.routeName,
                        );
                      },
                      label: 'Book Now',
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
