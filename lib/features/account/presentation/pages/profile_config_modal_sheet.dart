import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_modal_sheet_drawer_icon.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileConfigModalSheet extends StatelessWidget {
  const ProfileConfigModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomModalSheetDrawerIcon(),
        Text(
          'Profile Configuration',
          style: kHeading2,
        ),
        kHeight20,
        Text('Visibility'),
        kHeight5,
        CustomTextFormField(
          hintText: 'Public',
        ),
        kHeight20,
        Text('Task Preferences'),
        kHeight5,
        CustomTextFormField(
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
