import 'package:cipher/features/account_settings/presentation/pages/deactivate/deactivate_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/password_and_security.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/notification/presentation/pages/notification_home.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../billing_payment_page/presentation/billing_payment_page.dart';
import '../../../../security_question/presentation/bloc/security_event.dart';
import '../connected_account/connected_account_page.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Settings",
        trailingWidget: SizedBox.shrink(),
      ),
      body: Column(
        children: [
          AccountListTileSection(
            icon: const Icon(Icons.person_outline_outlined),
            label: 'Profile',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                EditProfilePage.routeName,
              );
            },
          ),
          AccountListTileSection(
            icon: const Icon(
              Icons.key,
            ),
            label: 'Password & Security',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                PasswordAndSecurity.routeName,
              );
            },
          ),
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(
                context,
                BillingAndPaymentPage.routeName,
              );
            },
            icon: const Icon(
              Icons.edit_document,
            ),
            label: 'Billing & Payments',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          // AccountListTileSection(
          //   icon: const Icon(Icons.person_add_alt_outlined),
          //   label: 'Membership',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios,
          //     size: 16,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       Membership.routeName,
          //     );
          //   },
          // ),
          AccountListTileSection(
            icon: const Icon(Icons.notifications_none),
            label: 'Notifications',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                NotificationFromHome.routeName,
              );
            },
          ),
          // AccountListTileSection(
          //   icon: const Icon(Icons.language),
          //   label: 'Languages',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios,
          //     size: 16,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       LanguagesPage.routeName,
          //     );
          //   },
          // ),
          AccountListTileSection(
            icon: const Icon(Icons.link),
            label: 'Connected Account',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                ConnectedAccountPage.routeName,
              );
            },
          ),


          // AccountListTileSection(
          //   icon: const Icon(Icons.person_outline_outlined),
          //   label: 'Help & Legal',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios,
          //     size: 16,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       HelpAndLegalPage.routeName,
          //     );
          //   },
          // ),
          AccountListTileSection(
            icon: const Icon(Icons.close),
            label: 'Deactivate',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                DeactivatePage.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
