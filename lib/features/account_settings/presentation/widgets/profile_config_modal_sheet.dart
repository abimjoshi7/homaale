import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileConfigModalSheet extends StatelessWidget {
  const ProfileConfigModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomModalSheetDrawerIcon(),
        const Text(
          'Profile Configuration',
          style: kPurpleText19,
        ),
        kHeight20,
        const Text('Visibility'),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Public',
        ),
        kHeight20,
        const Text('Task Preferences'),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Long term tasks',
        ),
        kHeight20,
        CustomElevatedButton(
          callback: () {},
        )
      ],
    );
  }
}
