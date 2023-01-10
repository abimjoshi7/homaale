import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BankDetailsSection extends StatelessWidget {
  const BankDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Bank Details',
          style: kPurpleText19,
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Bank name',
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
          hintText: 'Nabil Bank Pvt. Ltd',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Bank account name',
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
          hintText: 'Harry Smith',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Bank Account',
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
          hintText: '17485963220',
        ),
        kHeight20,
        CustomElevatedButton(
          callback: () {},
        )
      ],
    );
  }
}
