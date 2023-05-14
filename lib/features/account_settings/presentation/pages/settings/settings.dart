import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/deactivate_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/password_and_security.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/notification/presentation/pages/notification_from_home.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
            label: 'Account',
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
              Icons.lock_outline_sharp,
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
          // AccountListTileSection(
          //   icon: const Icon(Icons.private_connectivity_sharp),
          //   label: 'Connected Account',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios,
          //     size: 16,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       ConnectedAccountPage.routeName,
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
          // AccountListTileSection(
          //   icon: const Icon(Icons.monetization_on_outlined),
          //   label: 'Billing & Payments',
          //   trailingWidget: const Icon(
          //     Icons.arrow_forward_ios,
          //     size: 16,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       BillingAndPaymentPage.routeName,
          //     );
          //   },
          // ),
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
