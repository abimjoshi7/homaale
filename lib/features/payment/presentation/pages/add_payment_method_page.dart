import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodPage extends StatelessWidget {
  const AddPaymentMethodPage({super.key});
  static const routeName = '/app-payment-method-page';

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
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      CustomModalSheetDrawerIcon(),
                      Text(
                        'Add New Card',
                        style: kText15,
                      ),
                      CustomFormField(
                        label: 'Card Number',
                        child: CustomTextFormField(),
                        isRequired: false,
                      ),
                      CustomFormField(
                        label: 'Card Number',
                        child: CustomTextFormField(),
                        isRequired: false,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormField(
                              label: 'Card Number',
                              child: CustomTextFormField(),
                              isRequired: false,
                            ),
                          ),
                          Flexible(
                            child: CustomFormField(
                              label: 'Card Number',
                              child: CustomTextFormField(),
                              isRequired: false,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomCheckBox(
                            onTap: () {},
                          ),
                          Text('Save as default card ')
                        ],
                      ),
                      CustomElevatedButton(
                        callback: () {},
                        label: 'Save',
                      ),
                      CustomElevatedButton(
                        callback: () {},
                        label: 'Cancel',
                        mainColor: Colors.white,
                        textColor: kColorPrimary,
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
            child: const Text('Add Payment Method'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Methods',
                style: kPurpleText16,
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text('Apple Pay'),
                trailing: Switch(
                  value: true,
                  onChanged: (value) => false,
                ),
              ),
              SwitchListTile(
                value: false,
                onChanged: (value) => false,
                title: Row(
                  children: [CircleAvatar(), Text('data')],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
