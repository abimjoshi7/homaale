import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/profile/presentation/pages/about/about_profile.dart';
import 'package:cipher/features/profile/presentation/pages/activites/activities_profile.dart';
import 'package:cipher/features/profile/presentation/pages/documents/documents_profile.dart';
import 'package:cipher/features/profile/presentation/pages/services/services_profile.dart';
import 'package:cipher/features/profile/presentation/pages/tasks/tasks_profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
        TabController(length: /* user == 'self' ? 7 : */ 5, vsync: this);
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
      appBar: CustomAppBar(appBarTitle: "Profile"),
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Root.routeName,
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  SearchPage.routeName,
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            child: const Text('Profile'),
          ),
          const CustomHorizontalDivider(),
          kHeight10,
          const ProfileHeaderSection(),
          ProfileRewardBalanceSection(user: user),
          const ProfileStatsSection(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                KycDetails.routeName,
              );
            },
            child: const ProfileKycVerifySection(),
          ),
          ProfileTabSection(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                AboutProfile(),
                ServicesProfile(),
                TasksProfile(),
                DocumentsProfile(),
                ActivitiesProfile(),
                // RewardsProfile(),
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
