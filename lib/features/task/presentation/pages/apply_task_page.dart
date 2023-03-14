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
          const CustomHeader(
            label: 'Apply',
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomFormField(
                  label: 'Task Details',
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Title :'),
                          Text('Need a garden cleaner'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Budget :'),
                          Text('Rs. 1000'),
                        ],
                      ),
                      const Text(
                        'Hiring a reputable professional landscape gardener entail paying for their knowledge, experience, time, equipment, and materials. They will be able to discuss your vision and tailor your garden design to your exact needs, taking into account your taste, lifestyle, budget.',
                        style: kHelper13,
                      ),
                    ],
                  ),
                ),
                const CustomFormField(
                  label: 'Your Price',
                  child: CustomTextFormField(
                    hintText: 'Rs 1,000',
                  ),
                ),
                const CustomFormField(
                  label: 'Remarks',
                  child: CustomTextFormField(
                    hintText: 'Applying (Remark)',
                    maxLines: 4,
                  ),
                ),
                CustomFormField(
                  label: 'Pre-requisites',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
