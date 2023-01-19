import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/data/repositories/user_data_repositories.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/profile/presentation/pages/about/about_profile.dart';
import 'package:cipher/features/profile/presentation/pages/activites/activities_profile.dart';
import 'package:cipher/features/profile/presentation/pages/documents/documents_profile.dart';
import 'package:cipher/features/profile/presentation/pages/offers/offers_profile.dart';
import 'package:cipher/features/profile/presentation/pages/reviews/reviews_profile.dart';
import 'package:cipher/features/profile/presentation/pages/rewards/rewards_profile.dart';
import 'package:cipher/features/profile/presentation/pages/services/services_profile.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    tabController = TabController(length: user == 'self' ? 7 : 4, vsync: this);
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
              onPressed: () async {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            child: const Text('Profile'),
          ),
          const CustomHorizontalDivider(),
          kHeight20,
          const ProfileHeaderSection(),
          kHeight10,
          ProfileRewardBalanceSection(user: user),
          kHeight10,
          const CustomHorizontalDivider(),
          const ProfileStatsSection(),
          const CustomHorizontalDivider(),
          const ProfileKycVerifySection(),
          ProfileTabSection(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                AboutProfile(),
                ServicesProfile(),
                DocumentsProfile(),
                ActivitiesProfile(),
                RewardsProfile(),
                OffersProfile(),
                ReviewsProfile(),
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
