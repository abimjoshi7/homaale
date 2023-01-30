import 'package:cipher/core/app/bloc/theme_bloc.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/kyc_details_organizaton.dart';
import 'package:cipher/features/account_settings/presentation/pages/pages.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});
  static const routeName = '/account-profile';

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          String profilePicUrl() {
            if (state is UserLoadSuccess) {
              return state.user.profileImage.toString();
            } else {
              return 'https://www.seekpng.com/ima/u2q8u2w7e6y3a9a9/';
            }
          }

          Widget displayUserInfo() {
            if (state is UserLoadSuccess) {
              return AccountUserInfoSection(
                name:
                    '${state.user.user!.firstName!} ${state.user.user!.lastName!}',
                isVerified: state.user.isProfileVerified!,
                designation:
                    state.user.designation?.toString() ?? 'Homaale User',
                credentialId: state.user.user?.phone ?? state.user.user!.email!,
              );
            } else {
              return const AccountUserInfoSection(
                name: 'FirstName LastName',
                isVerified: true,
                designation: 'Individual | Homaale User',
                credentialId: 'firstlast@gmail.com',
              );
            }
          }

          Widget displayReward() {
            if (state is UserLoadSuccess) {
              return ProfileStatsCard(
                imagePath: 'assets/reward.png',
                label: 'Reward Points',
                value: state.user.points.toString(),
              );
            } else {
              return const ProfileStatsCard(
                imagePath: 'assets/reward.png',
                label: 'Reward Points',
                value: '000',
              );
            }
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                kHeight50,
                CustomHeader(
                  leadingWidget: const SizedBox.shrink(),
                  trailingWidget: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
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
                const Divider(),
                Stack(
                  children: [
                    SizedBox(
                      height: 160,
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
                                  profilePicUrl(),
                                ),
                              ),
                            ),
                            width: 100,
                            height: 100,
                          ),
                          kWidth20,
                          displayUserInfo(),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    displayReward(),
                    const ProfileStatsCard(
                      imagePath: 'assets/wallet.png',
                      label: 'Account Balance',
                      value: 'Rs. 1,00,000.00',
                    ),
                  ],
                ),
                kHeight10,
                CustomElevatedButton(
                  callback: () {
                    Navigator.pushNamed(context, Profile.routeName);
                  },
                  label: 'View Profile',
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      KycDetailsOrganization.routeName,
                    );
                  },
                  child: const ProfileKycVerifySection(),
                ),
                AccountListTileSection(
                  onTap: () async {
                    Navigator.pushNamed(
                      context,
                      KycDetailsOrganization.routeName,
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.idCard,
                    color: Color(0xff495057),
                  ),
                  label: 'KYC',
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
                AccountListTileSection(
                  onTap: () {},
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
                  onTap: () {},
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
        },
      ),
    );
  }
}
