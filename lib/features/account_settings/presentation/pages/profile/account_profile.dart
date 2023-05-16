import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/billing_payment_page/presentation/billing_payment_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';

import 'package:cipher/features/account_settings/presentation/pages/settings/settings.dart' as sets;

import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/features/contact_us/presentation/contact_us_page.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_type_options_bloc.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_type_options_event.dart';
import 'package:cipher/features/support/presentation/support_ticket_page.dart';
import 'package:cipher/features/tax_calculator/presentation/screens/tax_calculator.dart';
import 'package:cipher/features/transaction/presentation/pages/my_transactions_page.dart';
import 'package:cipher/features/wallet/presentation/wallet_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/mixins/the_modal_bottom_sheet.dart';
import '../../../../faq_and_data_deletion/data_deletion_policy.dart';
import '../../../../faq_and_data_deletion/faq_page.dart';
import '../../../../feedback/bloc/feedback_bloc.dart';
import '../../../../feedback/bloc/feedback_event.dart';
import '../../../../feedback/presentation/pages/feedback.dart';
import '../../../../support/presentation/widgets/report_page.dart';
import '../../../../theme/presentation/bloc/theme_bloc.dart';
import '../../../../theme/presentation/bloc/theme_event.dart';
import '../../../../user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});
  static const routeName = '/account-profile';

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> with TheModalBottomSheet {
  bool isDark = false;

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
                  MyTransactionsPage.routeName,
                );
              },
              icon: const Icon(
                Icons.wifi_protected_setup_sharp,
              ),
              label: 'Transactions',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  WalletPage.routeName,
                );
              },
              icon: const Icon(
                Icons.attach_money,
              ),
              label: 'My Earnings',
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
                context.read<BillsPaymentBloc>().add(InitializeState());
                context.read<BillsPaymentBloc>().add(FetchLinkedBankAccount());
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
            AccountListTileSection(
              icon: const Icon(
                Icons.report,
              ),
              label: 'Help & Report',
              trailingWidget: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {
                context.read<SupportTicketTypeOptionsBloc>().add(SupportTicketTypeOptionsLoaded(target: ''));
                context.read<UserSuspendBloc>().state.userAccountSuspension?.isSuspended == true
                    ? showDialog(
                        context: context,
                        builder: (context) => AccountSuspendCustomToast(
                          heading: 'ACCOUNT SUSPENDED',
                          content: 'User is suspended',
                        ),
                      )
                    : Navigator.pushNamed(context, CommonReportPage.routeName);
              },
            ),
            AccountListTileSection(
              onTap: () {
                Navigator.pushNamed(context, FaqPage.routeName);
              },
              icon: const Icon(
                Icons.question_mark,
              ),
              label: 'FAQs',
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
                Icons.contact_support_outlined,
              ),
              label: 'Contact us',
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
