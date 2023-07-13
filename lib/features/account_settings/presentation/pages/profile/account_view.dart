import 'dart:developer';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';

import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/chat/view/chat_listing.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem_bloc.dart';
import 'package:cipher/features/redeem/statement/presentation/bloc/earned_bloc.dart';
import 'package:cipher/features/redeem/statement/presentation/bloc/redeem_statement_bloc.dart';
import 'package:cipher/features/redeem/statement/presentation/bloc/redeem_statement_event.dart';
import 'package:cipher/features/saved/presentation/pages/saved_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_state.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../redeem/presentation/bloc/redeem.event.dart';
import '../../../../redeem/presentation/pages/redeem_page.dart';
import '../../../../redeem/statement/presentation/bloc/redeemed_bloc.dart';
import '../../../../support/presentation/support_ticket_page.dart';
import '../../../../theme/presentation/bloc/theme_bloc.dart';
import '../../../../theme/presentation/bloc/theme_event.dart';
import '../../../../transaction/presentation/pages/my_transactions_page.dart';
import '../../../../user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';
import '../../../../wallet/presentation/wallet_page.dart';

class AccountView extends StatefulWidget {
  static const routeName = '/account';

  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  bool? isDark;
  void checkAppMode() async {
    final theme = await CacheHelper.getCachedString(kAppThemeMode) ?? 'light';

    if (theme == 'light') {
      await CacheHelper.setCachedString(kAppThemeMode, 'dark').then(
        (value) => setState(() => isDark = true),
      );
    } else {
      await CacheHelper.setCachedString(kAppThemeMode, 'light').then(
        (value) => setState(() => isDark = false),
      );
    }
  }

  @override
  void initState() {
    isDark = context.read<ThemeBloc>().state is ThemeLight ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 25.0,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          onPressed: () => Navigator.popUntil(
            context,
            (route) => route.settings.name == Root.routeName,
          ),
        ),
        appBarTitle: "Profile",
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.theStates == TheStates.initial)
            const Center(
              child: CardLoading(
                height: 200,
              ),
            );
          if (state.theStates == TheStates.success) {
            return ListView(
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
                      top: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(clipBehavior: Clip.none, children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    state.taskerProfile?.profileImage ??
                                        kHomaaleImg,
                                  ),
                                ),
                              ),
                              width: 100,
                              height: 70,
                            ),
                            Positioned(
                              bottom: -18,
                              left: 25,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                child: Center(
                                  child: Image.network(
                                      state.taskerProfile?.badge?.image ?? ""),
                                ),
                              ),
                            ),
                          ]),
                          kWidth20,
                          AccountUserInfoSection(
                            name:
                                '${state.taskerProfile?.user?.firstName} ${state.taskerProfile?.user?.lastName}',
                            isVerified:
                                state.taskerProfile?.isProfileVerified ?? false,
                            designation:
                                state.taskerProfile?.designation?.toString() ??
                                    'Homaale User',
                            credentialId: state.taskerProfile?.user?.phone ??
                                state.taskerProfile?.user?.email ??
                                '',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<RedeemStatementBloc>()
                            .add(StatementListInitiated());
                        context
                            .read<EarnedBloc>()
                            .add(StatementStatusInitiated(status: 'earned'));
                        context
                            .read<RedeemedBloc>()
                            .add(StatementStatusInitiated(status: 'spent'));

                        Navigator.pushNamed(
                          context,
                          RedeemPage.routeName,
                        );
                        context
                            .read<RedeemBloc>()
                            .add(FetchRedeemList(offerType: 'promo_code'));
                      },
                      child: ProfileStatsCard(
                        imagePath: 'assets/reward.png',
                        label: 'Reward Points',
                        value: state.taskerProfile?.points.toString() ?? '0',
                      ),
                    ),
                    BlocBuilder<WalletBloc, WalletState>(
                        builder: (context, walletState) {
                      switch (state.theStates) {
                        case TheStates.success:
                          return ProfileStatsCard(
                            imagePath: 'assets/wallet.png',
                            label: 'Account Balance',
                            value:
                                '${walletState.walletModel.isNotEmpty ? Decimal.parse(context.read<WalletBloc>().state.walletModel.first.availableBalance.toString()) : '0'}',
                          );
                        default:
                          return CardLoading(height: 200);
                      }
                    }),
                  ],
                ),
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
                BlocBuilder<KycBloc, KycState>(
                  builder: (context, state) {
                    return Visibility(
                        visible: state.kycModel != null
                            ? state.kycModel!.isKycVerified!
                                ? false
                                : true
                            : true,
                        child: ProfileKycVerifySection());
                  },
                ),
                AccountListTileSection(
                  onTap: () {
                    context
                                .read<UserSuspendBloc>()
                                .state
                                .userAccountSuspension
                                ?.isSuspended ==
                            true
                        ? showDialog(
                            context: context,
                            builder: (context) => AccountSuspendCustomToast(
                              heading: 'ACCOUNT SUSPENDED',
                              content: 'User is suspended',
                            ),
                          )
                        : Navigator.pushNamed(
                            context, ChatListingPage.routeName);
                  },
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                  ),
                  label: 'My Chats',
                  trailingWidget: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state.theStates == TheStates.success) {
                      return Visibility(
                        visible: state.userLoginRes?.hasProfile ?? false,
                        child: AccountListTileSection(
                          onTap: () => conditionalCheckNavigation(
                              context, context.read<KycBloc>().state),
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
                      context,
                      SavedPage.routeName,
                    );
                  },
                  icon: const Icon(
                    Icons.bookmark_border,color: kColorPink,
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
                  label: 'Support Ticket',
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
                      MyTransactionsPage.routeName,
                    );
                  },
                  icon: const Icon(
                    Icons.book_online_sharp,
                  ),
                  label: 'Transactions History',
                  trailingWidget: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
                AccountListTileSection(
                  onTap: () {
                    // setState(
                    //   () {
                    //     context.read<ThemeBloc>().add(
                    //           ThemeChangeChanged(isDark: isDark ?? false),
                    //         );
                    //     // isDark = !isDark;
                    //     checkAppMode();
                    //   },
                    // );
                  },
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                  ),
                  label: 'Dark Mode',
                  // trailingWidget: SizedBox(),
                  trailingWidget: SizedBox(
                    height: 30,
                    width: 40,
                    child: CupertinoSwitch(
                      applyTheme: true,
                      activeColor: kColorSecondary,
                      trackColor: Colors.grey.shade300,
                      value: isDark ?? false,
                      onChanged: (value) {
                        setState(
                          () {
                            context.read<ThemeBloc>().add(
                                  ThemeChangeChanged(isDark: value),
                                );
                            // isDark = !value;
                            checkAppMode();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CardLoading(
              height: 200,
            ),
          );
        },
      ),
    );
  }
}
