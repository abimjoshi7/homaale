import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/following_followers/presentation/following_followers_page.dart';
import 'package:cipher/features/profile/presentation/pages/about/about_profile.dart';
import 'package:cipher/features/profile/presentation/pages/activites/activities_profile.dart';
import 'package:cipher/features/profile/presentation/pages/documents/documents_profile.dart';
import 'package:cipher/features/profile/presentation/pages/rewards/rewards_profile.dart';
import 'package:cipher/features/profile/presentation/pages/services/services_profile.dart';
import 'package:cipher/features/profile/presentation/pages/tasks/tasks_profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/label_count.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import '../../../user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;
  final user = 'self';

  @override
  void initState() {
    tabController =
        TabController(length: /* user == 'self' ? 7 : */ 6, vsync: this);
    // context.read<ServicesBloc>().add(
    //       const MyCreatedServiceTaskLoadInitiated(
    //         isTask: true,
    //       ),
    //     );
    // tabController.addListener(() {
    //   setState(() {
    //     selectedIndex = tabController.index;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Profile",
        trailingWidget: SizedBox.shrink(),
      ),
      body: Column(
        children: [
          // const CustomHorizontalDivider(),
          kHeight10,
          const ProfileHeaderSection(),
          kHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  theWidth: MediaQuery.of(context).size.width * 0.45,
                  theHeight: 40,
                  borderRadius: 10,
                  label: 'Edit Profile',
                  callback: () {
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
                            context,
                            EditProfilePage.routeName,
                          );
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state.theStates == TheStates.success) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, FollowingFollowersPage.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildLabelCount(
                                count: state.taskerProfile?.followersCount
                                        ?.toString() ??
                                    '0',
                                label: 'Followers'),
                            addHorizontalSpace(16),
                            BuildLabelCount(
                                count: state.taskerProfile?.followingCount
                                        ?.toString() ??
                                    '0',
                                label: 'Followings'),
                          ],
                        ),
                      );
                    }
                    return SizedBox();
                  },
                )
              ],
            ),
          ),
          // kHeight10,
          // ProfileRewardBalanceSection(user: user),
          kHeight10,
          Divider(height: 0.3),
          const ProfileStatsSection(),
          Divider(height: 0.3),
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
          ProfileTabSection(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                AboutProfile(),
                ServicesProfile(),
                TasksProfile(),
                DocumentsProfile(),
                ActivitiesProfile(),
                RewardsProfile(),
                // OffersProfile(),
                // ReviewsProfile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
