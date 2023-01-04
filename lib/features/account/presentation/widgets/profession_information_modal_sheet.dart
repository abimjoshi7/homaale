import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfessionalInformationModalSheet extends StatelessWidget {
  const ProfessionalInformationModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomModalSheetDrawerIcon(),
        const Text(
          'Professional Information',
          style: kBodyText2,
        ),
        kHeight20,
        const Text(
          'Select User Type',
          style: kPurpleText16,
        ),
        kHeight5,
        Row(
          children: [
            Row(
              children: [
                CustomRadio(
                  onTap: () {},
                ),
                kWidth5,
                const Text('Client')
              ],
            ),
            kWidth20,
            Row(
              children: [
                CustomRadio(
                  onTap: () {},
                ),
                kWidth5,
                const Text('Tasker')
              ],
            ),
          ],
        ),
        kHeight20,
        const Text(
          'Specialities',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Enter your skills',
        ),
        kHeight20,
        const Text(
          'Experience Level',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Enter your skills',
        ),
        kHeight20,
        const Text(
          'Active Hours',
          style: kPurpleText16,
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sunday',
              style: kPurpleText16,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Flexible(
              child: CustomTextFormField(
                hintText: 'Enter your skills',
              ),
            ),
            Text('To'),
            Flexible(
              child: CustomTextFormField(
                hintText: 'Enter your skills',
              ),
            ),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Monday',
              style: kPurpleText16,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Flexible(
              child: CustomTextFormField(
                hintText: 'Enter your skills',
              ),
            ),
            Text('To'),
            Flexible(
              child: CustomTextFormField(
                hintText: 'Enter your skills',
              ),
            ),
          ],
        ),
        kHeight20,
        const Text(
          'Select day',
          style: kPurpleText16,
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Every day',
        ),
        kHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Flexible(
              child: CustomTextFormField(
                hintText: 'Enter your  skills',
              ),
            ),
            Text('To'),
            Flexible(
              child: CustomTextFormField(
                hintText: 'Enter your skills',
              ),
            ),
          ],
        ),
        CustomElevatedButton(
          callback: () {},
          label: 'Save',
        )
      ],
    );
  }
}
