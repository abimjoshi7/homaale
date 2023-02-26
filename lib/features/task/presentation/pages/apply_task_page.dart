import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ApplyTaskPage extends StatelessWidget {
  static const routeName = '/apply-task-page';
  const ApplyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          addVerticalSpace(50),
          CustomHeader(
            label: 'Apply',
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomFormField(
                  label: 'Task Details',
                  isRequired: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Title :'),
                          Text('Need a garden cleaner'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Budget :'),
                          Text('Rs. 1000'),
                        ],
                      ),
                      Text(
                        'Hiring a reputable professional landscape gardener entail paying for their knowledge, experience, time, equipment, and materials. They will be able to discuss your vision and tailor your garden design to your exact needs, taking into account your taste, lifestyle, budget.',
                        style: kHelper13,
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'Your Price',
                  isRequired: false,
                  child: CustomTextFormField(
                    hintText: 'Rs 1,000',
                  ),
                ),
                CustomFormField(
                  label: 'Remarks',
                  isRequired: false,
                  child: CustomTextFormField(
                    hintText: 'Applying (Remark)',
                    maxLines: 4,
                  ),
                ),
                CustomFormField(
                  label: 'Pre-requisites',
                  isRequired: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This helps clients to find about your requirements better.',
                        style: kHelper13,
                      ),
                      CustomTextFormField(
                        hintText: 'Add requirements',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(20),
          CustomElevatedButton(
            callback: () {},
            label: 'Apply',
          ),
        ],
      ),
    );
  }
}
