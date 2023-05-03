import 'package:cipher/core/constants/constants.dart';

import 'package:cipher/features/account_settings/presentation/pages/settings/settings.dart'
    as sets;

import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/support/presentation/support_ticket_page.dart';
import 'package:cipher/features/tax_calculator/presentation/screens/tax_calculator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/mixins/the_modal_bottom_sheet.dart';
import '../../../../feedback/bloc/feedback_bloc.dart';
import '../../../../feedback/bloc/feedback_event.dart';
import '../../../../feedback/presentation/pages/feedback.dart';
import '../../../../theme/presentation/bloc/theme_bloc.dart';
import '../../../../theme/presentation/bloc/theme_event.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});
  static const routeName = '/account-profile';

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile>
    with TheModalBottomSheet {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    checkAppMode();
  }

  void checkAppMode() async {
    final theme = await CacheHelper.getCachedString(kAppThemeMode) ?? 'light';
    setState(() {
      if (theme == 'light') {
        setState(() {
          isDark = true;
          CacheHelper.setCachedString(kAppThemeMode, 'dark');
        });
      } else {
        setState(() {
          isDark = false;
          CacheHelper.setCachedString(kAppThemeMode, 'light');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarTitle: "Account",
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
                Navigator.pushNamed(
                  context,
                  SupportTicketPage.routeName,
                );
              },
              icon: const Icon(
                Icons.headphones,
                // color: Color(0xff495057),
              ),
              label: 'Help & Support',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              onTap: () {},
              icon: const Icon(
                Icons.dark_mode_outlined,
              ),
              label: 'Dark Mode',
              trailingWidget: SizedBox(
                height: 30,
                width: 40,
                child: CupertinoSwitch(
                  activeColor: kColorSecondary,
                  trackColor: Colors.grey.shade300,
                  value: isDark,
                  onChanged: (value) {
                    setState(
                      () {
                        context.read<ThemeBloc>().add(
                              ThemeChangeChanged(),
                            );
                        checkAppMode();
                      },
                    );
                  },
                ),
              ),
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TaxCalculator.routeName,
                );
              },
              icon: const Icon(
                Icons.contact_mail_sharp,
              ),
              label: 'Tax Calculator',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
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
              label: 'Terms of Use',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              icon: const Icon(
                Icons.feed_outlined,
              ),
              label: 'Feedback',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {
                context.read<FeedbackBloc>().add(FeedbackLoaded());
                showCustomBottomSheet(
                  context: context,
                  widget: const FeedbackPage(),
                );
              },
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
                  icon: const Icon(Icons.logout_rounded),
                  label: 'Logout',
                  trailingWidget: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                );
              },
            ),
          ],
        ));
  }
}
