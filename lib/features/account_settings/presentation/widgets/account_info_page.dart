import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});
  static const routeName = '/account-info-page';

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
            label: 'Personal information',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Address information',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Professional information',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Active Hours',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const SizedBox.shrink(),
            label: 'Profile Configuration',
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
