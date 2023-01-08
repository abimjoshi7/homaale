import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PanVatInformationSection extends StatelessWidget {
  const PanVatInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'PAN/VAT Information',
          style: kHeading2,
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'PAN/VAT Number',
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
          hintText: 'Enter PAN/VAT number',
        ),
        kHeight20,
        Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Issued Date',
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
                    hintText: '03/06/1999',
                  ),
                ],
              ),
            ),
            kWidth10,
            Flexible(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Expiry Date',
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
                    hintText: '03/06/2002',
                  ),
                ],
              ),
            ),
          ],
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'PAN/VAT Card',
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
        Row(
          children: const [
            Text('Upload your PAN/VAT card'),
            kWidth10,
            Icon(
              Icons.info,
              color: Color(0xffFF9700),
            )
          ],
        ),
        const CustomTextFormField(
          hintText: 'Enter you VAT ID to enable VAT invoicing',
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Social links',
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
          hintText: 'www.facebook.com/homaale',
        ),
        kHeight10,
        Row(
          children: [
            CustomCheckBox(
              onTap: () {},
            ),
            kWidth10,
            const Text("Don't have Social Links")
          ],
        ),
        kHeight20,
        Row(
          children: const [
            Text(
              'Company Logo',
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
        Row(
          children: const [
            Text('Upload your Company Logo'),
            kWidth10,
            Icon(
              Icons.info,
              color: Color(0xffFF9700),
            )
          ],
        ),
        const CustomTextFormField(
          hintText: 'Enter you VAT ID to enable VAT invoicing',
        ),
      ],
    );
  }
}
