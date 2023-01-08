import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordModalSheet extends StatelessWidget {
  const ChangePasswordModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomModalSheetDrawerIcon(),
        kHeight20,
        const Text(
          'Change password',
          style: kBodyText2,
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Current Password',
              style: kPurpleText16,
            ),
            Text(
              '*',
              style: TextStyle(color: Color(0xffFE5050)),
            )
          ],
        ),
        kHeight5,
        const CustomTextFormField(),
        kHeight20,
        Row(
          children: const [
            Text(
              'New Password',
              style: kPurpleText16,
            ),
            Text(
              '*',
              style: TextStyle(color: Color(0xffFE5050)),
            )
          ],
        ),
        kHeight5,
        const CustomTextFormField(),
        kHeight20,
        Row(
          children: const [
            Text(
              'Confirm Password',
              style: kPurpleText16,
            ),
            Text(
              '*',
              style: TextStyle(color: Color(0xffFE5050)),
            )
          ],
        ),
        kHeight5,
        const CustomTextFormField(),
        kHeight20,
        CustomElevatedButton(
          callback: () {},
          label: 'Save',
        )
      ],
    );
  }
}
