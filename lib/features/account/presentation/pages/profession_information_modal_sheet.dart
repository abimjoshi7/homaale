import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_modal_sheet_drawer_icon.dart';
import 'package:cipher/widgets/custom_radio.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfessionalInformationModalSheet extends StatelessWidget {
  const ProfessionalInformationModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomModalSheetDrawerIcon(),
        Text(
          'Professional Information',
          style: kBodyText2,
        ),
        kHeight20,
        Text(
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
                Text('Client')
              ],
            ),
            kWidth20,
            Row(
              children: [
                CustomRadio(
                  onTap: () {},
                ),
                kWidth5,
                Text('Tasker')
              ],
            ),
          ],
        ),
        kHeight20,
        Text(
          'Specialities',
          style: kPurpleText16,
        ),
        kHeight5,
        CustomTextFormField(
          hintText: 'Enter your skills',
        ),
        kHeight20,
        Text(
          'Experience Level',
          style: kPurpleText16,
        ),
        kHeight5,
        CustomTextFormField(
          hintText: 'Enter your skills',
        ),
        kHeight20,
        Text(
          'Active Hours',
          style: kPurpleText16,
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sunday',
              style: kPurpleText16,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
            Text(
              'Monday',
              style: kPurpleText16,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
        Text(
          'Select day',
          style: kPurpleText16,
        ),
        kHeight5,
        CustomTextFormField(
          hintText: 'Every day',
        ),
        kHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
