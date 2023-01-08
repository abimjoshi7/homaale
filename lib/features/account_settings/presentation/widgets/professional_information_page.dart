import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfessionalInformationPage extends StatelessWidget {
  const ProfessionalInformationPage({super.key});

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
              'Account',
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
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Skills',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Portfolio',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Experience',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Education',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Certification',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
