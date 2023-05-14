import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';

import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/chat/view/chat_listing.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/saved/presentation/pages/saved_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../../user/presentation/bloc/activities_timeline_bloc.dart';
import '../../../../user/presentation/bloc/activities_timeline_event.dart';
import '../../../../user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';

class AccountView extends StatefulWidget {
  static const routeName = '/account';
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
                BlocProvider(
                  create: (context) => WalletBloc(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileStatsCard(
                        imagePath: 'assets/reward.png',
                        label: 'Reward Points',
                        value: state.taskerProfile?.points.toString() ?? '0',
                      ),
                      BlocBuilder<WalletBloc, WalletState>(
                        builder: (context, walletState) {
                          return ProfileStatsCard(
                            imagePath: 'assets/wallet.png',
                            label: 'Account Balance',
                            value: walletState.walletModel.length == 0
                                ? 'Rs. 0'
                                : "Rs. ${walletState.walletModel.first.availableBalance.toString()}",
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
                      context
                          .read<ActivitiesTimelineBloc>()
                          .add(ActivitiesLoaded());

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
                      KycDetails.routeName,
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
                    Icons.bookmark_border,
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
