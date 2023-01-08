import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/pages.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  static const routeName = '/settings';

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
              'Settings',
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
              FontAwesomeIcons.key,
            ),
            label: 'Password & Security',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {},
          ),
          AccountListTileSection(
            icon: const Icon(Icons.person_add_alt_outlined),
            label: 'Membership',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                Membership.routeName,
              );
            },
          ),
          AccountListTileSection(
            icon: const Icon(Icons.private_connectivity_sharp),
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
                NotificationsPage.routeName,
              );
            },
          ),
          AccountListTileSection(
            icon: const Icon(FontAwesomeIcons.globe),
            label: 'Languages',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                LanguagesPage.routeName,
              );
            },
          ),
          AccountListTileSection(
            icon: const Icon(Icons.monetization_on_outlined),
            label: 'Billing & Payments',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                BillingAndPaymentPage.routeName,
              );
            },
          ),
          AccountListTileSection(
            icon: const Icon(Icons.person_outline_outlined),
            label: 'Help & Legal',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                HelpAndLegalPage.routeName,
              );
            },
          ),
          AccountListTileSection(
            icon: const Icon(Icons.close),
            label: 'Deactivate',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
