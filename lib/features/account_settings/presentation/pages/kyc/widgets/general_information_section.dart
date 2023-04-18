import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GeneralInformationSection extends StatelessWidget {
  const GeneralInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          'General Information',
          style: kPurpleText19,
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Company Name',
              style: kPurpleText16,
            ),
            kWidth10,
            Text(
              '*',
              style: TextStyle(
                color: Color(0xffFE5050),
              ),
            ),
          ],
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Microsoft',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Website',
              style: kPurpleText16,
            ),
            kWidth10,
            Text(
              '*',
              style: TextStyle(
                color: Color(0xffFE5050),
              ),
            ),
          ],
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'www.homaale.com',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Phone Number',
              style: kPurpleText16,
            ),
            kWidth10,
            Text(
              '*',
              style: TextStyle(
                color: Color(0xffFE5050),
              ),
            ),
          ],
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: '+9779802589658',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Add your industry',
              style: kPurpleText16,
            ),
            kWidth10,
            Text(
              '*',
              style: TextStyle(
                color: Color(0xffFE5050),
              ),
            ),
          ],
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Software Industry',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Bio',
              style: kPurpleText16,
            ),
            kWidth10,
            Text(
              '*',
              style: TextStyle(
                color: Color(0xffFE5050),
              ),
            ),
          ],
        ),
        kHeight5,
        const CustomTextFormField(
          hintText: 'Placeholder text',
        ),
      ],
    );
  }
}
