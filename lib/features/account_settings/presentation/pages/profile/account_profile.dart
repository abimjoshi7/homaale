import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/screens/pages.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/tax_calculator.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/sandbox/presentation/pages/sandbox_page.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});
  static const routeName = '/account-profile';

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: addHorizontalSpace(45),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CompleteProfilePage.routeName,
                );
              },
            ),
            child: const Text(
              'Account',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
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
                                  height: 100,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileStatsCard(
                            imagePath: 'assets/reward.png',
                            label: 'Reward Points',
                            value:
                                state.taskerProfile?.points.toString() ?? '0',
                          ),
                          const ProfileStatsCard(
                            imagePath: 'assets/wallet.png',
                            label: 'Account Balance',
                            value: 'Rs. 1,00,000.00',
                          ),
                        ],
                      ),
                      kHeight20,
                      CustomElevatedButton(
                        callback: () {
                          Navigator.pushNamed(context, Profile.routeName);
                        },
                        label: 'View Profile',
                      ),
                      kHeight20,
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
                          if (state is SignInSuccess) {
                            return Visibility(
                              visible: state.userLoginRes.hasProfile ?? false,
                              child: AccountListTileSection(
                                onTap: () async {
                                  Navigator.pushNamed(
                                    context,
                                    KycDetails.routeName,
                                  );
                                },
                                icon: const Icon(
                                  Icons.card_membership_rounded,
                                  color: Color(0xff495057),
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
                          Navigator.pushNamed(context, SandboxPage.routeName);
                        },
                        icon: const Icon(
                          Icons.reduce_capacity_sharp,
                          color: Color(0xff495057),
                        ),
                        label: 'Sandbox',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      AccountListTileSection(
                        onTap: () {
                          Navigator.pushNamed(context, SavedPage.routeName);
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xff495057),
                        ),
                        label: 'Saved',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: AccountListTileSection(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              OffersPage.routeName,
                            );
                          },
                          icon: const Icon(
                            Icons.card_giftcard_outlined,
                            color: Color(0xff495057),
                          ),
                          label: 'Offers',
                          trailingWidget: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      ),
                      AccountListTileSection(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Settings.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Color(0xff495057),
                        ),
                        label: 'Settings',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      AccountListTileSection(
                        onTap: () {},
                        icon: const Icon(
                          Icons.dark_mode_outlined,
                          color: Color(0xff495057),
                        ),
                        label: 'Dark Mode',
                        trailingWidget: BlocBuilder<ThemeBloc, ThemeState>(
                          builder: (context, state) {
                            return StatefulBuilder(
                              builder: (context, setState) => Switch(
                                value: isDark,
                                onChanged: (value) => setState(
                                  () {
                                    isDark = !isDark;
                                    context.read<ThemeBloc>().add(
                                          ThemeChangeChanged(),
                                        );
                                  },
                                ),
                              ),
                            );
                          },
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
                          color: Color(0xff495057),
                        ),
                        label: 'Tax Calculator',
                        trailingWidget: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return AccountListTileSection(
                            onTap: () async {
                              context.read<SignInBloc>().add(
                                    SignOutInitiated(),
                                  );
                              await Navigator.pushNamedAndRemoveUntil(
                                context,
                                SignInPage.routeName,
                                (route) => false,
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
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
