import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_profile.dart';

import 'package:cipher/features/account_settings/presentation/pages/settings/settings.dart'
    as sets;

import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/chat/view/chat_listing.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/saved/presentation/pages/saved_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/support/presentation/support_ticket_page.dart';
import 'package:cipher/features/tax_calculator/presentation/screens/tax_calculator.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../theme/presentation/bloc/theme_bloc.dart';
import '../../../../theme/presentation/bloc/theme_event.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});
  static const routeName = '/account-profile';

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  bool isDark = false;

  void checkAppMode() async {
    final theme = await CacheHelper.getCachedString(kAppThemeMode) ?? 'light';
    setState(() {
      if (theme == 'dark') {
        setState(() {
          isDark = true;
          CacheHelper.setCachedString(kAppThemeMode, 'light');
        });
      } else {
        setState(() {
          isDark = false;
          CacheHelper.setCachedString(kAppThemeMode, 'dark');
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // checkAppMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Account",
        leadingWidget: SizedBox.shrink(),
        trailingWidget: SizedBox.shrink(),
      ),
      body: Column(
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.theStates == TheStates.initial)
                const Center(
                  child: CardLoading(
                    height: 200,
                  ),
                );
              if (state.theStates == TheStates.success) {
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.15,
                    ),
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/—Pngtree—blue tech line shading for_4059122 1.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            left: 30,
                            top: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        state.taskerProfile?.profileImage ??
                                            kServiceImageNImg,
                                      ),
                                    ),
                                  ),
                                  width: 100,
                                  height: 70,
                                ),
                                kWidth20,
                                AccountUserInfoSection(
                                  name:
                                      '${state.taskerProfile?.user?.firstName} ${state.taskerProfile?.user?.lastName}',
                                  isVerified:
                                      state.taskerProfile?.isProfileVerified ??
                                          false,
                                  designation: state.taskerProfile?.designation
                                          ?.toString() ??
                                      'Homaale User',
                                  credentialId:
                                      state.taskerProfile?.user?.phone ??
                                          state.taskerProfile?.user?.email ??
                                          '',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      BlocProvider(
                        create: (context) => WalletBloc(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileStatsCard(
                              imagePath: 'assets/reward.png',
                              label: 'Reward Points',
                              value:
                                  state.taskerProfile?.points.toString() ?? '0',
                            ),
                            BlocBuilder<WalletBloc, WalletState>(
                              builder: (context, walletState) {
                                return ProfileStatsCard(
                                  imagePath: 'assets/wallet.png',
                                  label: 'Account Balance',
                                  value:
                                      "Rs. ${walletState.walletModel?.first.availableBalance.toString() ?? "0"}",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      // kHeight20,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: CustomElevatedButton(
                          callback: () {
                            Navigator.pushNamed(context, Profile.routeName);
                          },
                          label: 'View Profile',
                        ),
                      ),
                      // kHeight20,
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            KycProfile.routeName,
                          );
                        },
                        child: const ProfileKycVerifySection(),
                      ),
                      BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          if (state.theStates == TheStates.success) {
                            return Visibility(
                              visible: state.userLoginRes?.hasProfile ?? false,
                              child: AccountListTileSection(
                                onTap: () async {
                                  Navigator.pushNamed(
                                    context,
                                    KycDetails.routeName,
                                  );
                                },
                                icon: const Icon(
                                  Icons.card_membership_rounded,
                                ),
                                label: 'KYC',
                                trailingWidget: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),

                      AccountListTileSection(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ChatListingPage.routeName);
                        },
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                        ),
                        label: 'Chats',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      AccountListTileSection(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SavedPage.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          // color: Color(0xff495057),
                        ),
                        label: 'Saved',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      AccountListTileSection(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            OffersPage.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.card_giftcard_outlined,
                        ),
                        label: 'Offers',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),

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
                        onTap: () {
                          // setState(
                          //   () {
                          //     // isDark = !isDark;
                          //     context.read<ThemeBloc>().add(
                          //           ThemeChangeChanged(),
                          //         );
                          //     checkAppMode();
                          //   },
                          // );
                        },
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
                                  // isDark = !isDark;
                                  // isDark = value;
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
                          Navigator.pushNamed(
                              context, PrivacyPolicyPage.routeName);
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
                          Navigator.pushNamed(
                              context, TermsOfUsePage.routeName);
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
                  ),
                );
              }
              return const Center(
                child: CardLoading(
                  height: 200,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
