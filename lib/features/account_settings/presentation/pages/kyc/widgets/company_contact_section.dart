import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CompanyContactSection extends StatelessWidget {
  const CompanyContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          'Company Contacts',
          style: kPurpleText19,
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Company Owner',
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
          hintText: '+9779874563210',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Vat ID',
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
          hintText: 'Enter you VAT ID to enable VAT invoicing',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Time zone',
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
          hintText: 'UTC+05:45 Kathmandu, Nepal',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Tagline',
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
          hintText: 'Customers are god to us',
        ),
      ],
    );
  }
}
