import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class KycDetailsOrganization extends StatelessWidget {
  const KycDetailsOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'KYC Details',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          kHeight20,
          const Text(
            'KYC Details',
            style: kHeading1,
          ),
          kHeight20,
          const GeneralInformationSection(),
          const CompanyContactSection(),
          const PanVatInformationSection(),
        ],
      ),
    );
  }
}

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
