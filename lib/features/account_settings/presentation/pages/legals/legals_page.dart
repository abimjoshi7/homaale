import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../content_client/presentation/pages/privacy_policy.dart';
import '../../../../content_client/presentation/pages/terms_of_use.dart';
import '../../../../faq_and_data_deletion/data_deletion_policy.dart';
import '../../widgets/account_list_tile_section.dart';

class LegalsPage extends StatelessWidget {
  static const routeName = '/legals';

  const LegalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Legals',trailingWidget: SizedBox()
      ),
      body: Column(
        children: [
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(context, PrivacyPolicyPage.routeName);
            },
            icon: const Icon(
              Icons.policy_outlined,
            ),
            label: 'Privacy Policy',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(context, TermsOfUsePage.routeName);
            },
            icon: const Icon(
              Icons.book_outlined,
              // color: Color(0xff495057),
            ),
            label: 'Terms & Conditions',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(context, DataDeletionPolicy.routeName);
            },
            icon: const Icon(
              Icons.policy,
            ),
            label: 'Data Deletion Policy',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
