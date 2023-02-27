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
                      const CustomModalSheetDrawerIcon(),
                      const Text(
                        'Add New Card',
                        style: kText15,
                      ),
                      const CustomFormField(
                        label: 'Card Number',
                        child: CustomTextFormField(),
                      ),
                      const CustomFormField(
                        label: 'Card Number',
                        child: CustomTextFormField(),
                      ),
                      Row(
                        children: const [
                          Flexible(
                            child: CustomFormField(
                              label: 'Card Number',
                              child: CustomTextFormField(),
                            ),
                          ),
                          Flexible(
                            child: CustomFormField(
                              label: 'Card Number',
                              child: CustomTextFormField(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomCheckBox(
                            onTap: () {},
                          ),
                          const Text('Save as default card ')
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
              const Text(
                'Available Methods',
                style: kPurpleText16,
              ),
              ListTile(
                leading: const CircleAvatar(),
                title: const Text('Apple Pay'),
                trailing: Switch(
                  value: true,
                  onChanged: (value) => false,
                ),
              ),
              SwitchListTile(
                value: false,
                onChanged: (value) => false,
                title: Row(
                  children: const [CircleAvatar(), Text('data')],
                ),
              )
            ],
          ),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (v) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    children: [
                      const CustomModalSheetDrawerIcon(),
                      addVerticalSpace(10),
                      const Text(
                        'Add New Card',
                        style: kText15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const CustomFormField(
                              label: 'Card Number',
                              child: CustomTextFormField(),
                            ),
                            const CustomFormField(
                              label: "Card Holder's Name",
                              child: CustomTextFormField(),
                            ),
                            Row(
                              children: [
                                const Flexible(
                                  child: CustomFormField(
                                    label: 'Expiration Date',
                                    child: CustomTextFormField(),
                                  ),
                                ),
                                addHorizontalSpace(20),
                                const Flexible(
                                  child: CustomFormField(
                                    label: 'CVV',
                                    child: CustomTextFormField(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomCheckBox(
                                  onTap: () {},
                                ),
                                const Text('Save as default card ')
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomElevatedButton(
                        callback: () {},
                        label: 'Save',
                      ),
                      addVerticalSpace(10),
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
              secondary: const Icon(
                Icons.credit_card,
                color: kColorSecondary,
              ),
              title: const Text(
                'Credit/Debit Card',
                style: kText15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
