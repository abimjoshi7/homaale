import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/complete_profile_page.dart';
import 'package:cipher/features/checkout/presentation/pages/checkout_page.dart';
import 'package:cipher/widgets/dashed_rect.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
            child: Text('Booking Details'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomFormField(
                    label: 'Trimming & Cutting',
                    isRequired: false,
                    child: Text('data'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                  ],
                                ),
                              ),
                              isRequired: false,
                            ),
                            CustomFormField(
                              label: 'How many tress are affected ?',
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                  ],
                                ),
                              ),
                              isRequired: false,
                            ),
                            CustomFormField(
                              label: 'What Service are you looking for ?',
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      value: 'Only trimming',
                                      groupValue: 'Only Trimming',
                                      onChanged: (value) => false,
                                      title: Text('Only trimming'),
                                    ),
                                  ],
                                ),
                              ),
                              isRequired: false,
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
                    children: [
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

class BookingDetailsFormSection extends StatefulWidget {
  const BookingDetailsFormSection({
    super.key,
  });

  @override
  State<BookingDetailsFormSection> createState() =>
      _BookingDetailsFormSectionState();
}

class _BookingDetailsFormSectionState extends State<BookingDetailsFormSection> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFormField(
              label: 'Problem Description',
              isRequired: true,
              child: CustomTextFormField(),
            ),
            CustomFormField(
              label: 'Requirements',
              isRequired: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This helps merchants to find about your requirements better.',
                    style: kHelper13,
                  ),
                  addVerticalSpace(10),
                  MultiSelectDialogField(
                    items: List.generate(
                      2,
                      (index) => MultiSelectItem('1', '2'),
                    ),
                    onConfirm: (p0) {
                      setState(
                        () {
                          // interestCodes = p0.map((e) => int.parse(e)).toList();
                        },
                      );
                    },
                  ),
                  // CustomTextFormField(
                  //   hintText: 'Add Requirements',
                  // ),
                ],
              ),
            ),
            CustomFormField(
              label: 'Images',
              isRequired: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Maximum Image Size 20 MB',
                        style: kHelper13,
                      ),
                      addHorizontalSpace(5),
                      Icon(
                        Icons.info_outline,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  addVerticalSpace(5),
                  CustomDottedContainerStack(
                    label: 'Select Images',
                  ),
                ],
              ),
            ),
            CustomFormField(
              label: 'Videos',
              isRequired: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Maximum Video Size 20 MB',
                        style: kHelper13,
                      ),
                      addHorizontalSpace(5),
                      Icon(
                        Icons.info_outline,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  addVerticalSpace(5),
                  CustomDottedContainerStack(
                    label: 'Select Videos',
                  ),
                ],
              ),
            ),
            CustomFormField(
              label: 'When do you need this done?',
              child: Column(
                children: [
                  // Row(
                  // 	children: [
                  // 		S
                  // 	],
                  // ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: kPurpleText12,
                            ),
                            CustomFormContainer(
                              hintText: 'dd/mm/yy',
                            ),
                          ],
                        ),
                      ),
                      addHorizontalSpace(10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Date',
                              style: kPurpleText12,
                            ),
                            CustomFormContainer(
                              hintText: 'dd/mm/yy',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomCheckBox(
                        onTap: () {},
                      ),
                      addHorizontalSpace(5),
                      Text('Set specific time'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          child: Container(
                            width: 40,
                            color: kColorPrimary,
                            child: Center(
                              child: Text(
                                weekNames[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => kWidth10,
                      itemCount: weekNames.length,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.orange,
                        size: 10,
                      ),
                      addHorizontalSpace(10),
                      Text('Sunday'),
                      addHorizontalSpace(50),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: CustomFormContainer(),
                            ),
                            Text(' - '),
                            Flexible(
                              child: CustomFormContainer(),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 340,
                        child: CustomElevatedButton(
                          callback: () {},
                          label: 'Add',
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.orange,
                        size: 10,
                      ),
                      addHorizontalSpace(10),
                      Text('Monday'),
                      addHorizontalSpace(50),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: CustomFormContainer(),
                            ),
                            Text(' - '),
                            Flexible(
                              child: CustomFormContainer(),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 340,
                        child: CustomElevatedButton(
                          callback: () {},
                          label: 'Add',
                        ),
                      )
                    ],
                  ),
                ],
              ),
              isRequired: true,
            ),
          ],
        ),
      ),
    );
  }
}
