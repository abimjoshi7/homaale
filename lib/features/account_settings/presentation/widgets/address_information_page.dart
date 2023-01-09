import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddressInformationPage extends StatelessWidget {
  const AddressInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomModalSheetDrawerIcon(),
        kHeight20,
        const Text(
          'Address Information',
          style: kPurpleText19,
        ),
        kHeight20,
        const Text(
          'Country',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Nepal',
        ),
        kHeight20,
        const Text(
          'Address Line 1',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Baneshwor',
        ),
        kHeight20,
        const Text(
          'Address Line 2',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Buddhanagar',
        ),
        kHeight20,
        const Text(
          'Languages',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'English',
        ),
        kHeight20,
        const Text(
          'Currency',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Choose suitable currency',
        ),
        kHeight20,
        CustomElevatedButton(
          callback: () {},
          label: 'Save',
        ),
      ],
    );
  }
}
