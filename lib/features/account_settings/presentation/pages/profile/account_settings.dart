import 'package:cipher/features/account_settings/presentation/pages/settings/settings.dart' as sets;
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/contact_us/presentation/contact_us_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../../support/presentation/widgets/help_and_support.dart';
import '../legals/legals_page.dart';
import '../quick_links/quick_link_page.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});
  static const routeName = '/account-profile';

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarTitle: "Account Settings",
          leadingWidget: SizedBox.shrink(),
          trailingWidget: SizedBox.shrink(),
        ),
        body: ListView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.15,
          ),
          children: [
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  sets.Settings.routeName,
                );
              },
              icon: const Icon(
                Icons.settings,
              ),
              label: 'Settings',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(context, QuickLinksPage.routeName);
              },
              icon: const Icon(
                Icons.grid_view,
              ),
              label: 'Quick Links ',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(context, LegalsPage.routeName);
              },
              icon: const Icon(
                Icons.lock,
              ),
              label: 'Legals',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(context, HelpAndSupportPage.routeName);
              },
              icon: const Icon(
                Icons.headphones_outlined,
              ),
              label: 'Help & Support',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(context, ContactUsPage.routeName);
              },
              icon: const Icon(
                Icons.mail,
              ),
              label: 'Contact Us',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return AccountListTileSection(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => CustomLogout(),
                      );
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.redAccent,
                    ),
                    label: 'Logout',
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
                    trailingWidget: SizedBox());
              },
            ),
          ],
        ));
  }
}
