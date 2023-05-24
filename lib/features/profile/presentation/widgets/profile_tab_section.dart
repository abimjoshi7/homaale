import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class ProfileTabSection extends StatelessWidget {
  const ProfileTabSection({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: kColorSecondary,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      controller: tabController,
      tabs: const [
        Tab(
          text: 'About',
        ),
        Tab(
          text: 'Services',
        ),
        Tab(
          text: 'Tasks',
        ),
        Tab(
          text: 'Documents',
        ),
        Tab(
          text: 'Activities',
        ),
        Tab(
          text: 'Rewards',
        ),
        // Tab(
        //   text: 'My Offers',
        // ),
        // Tab(
        //   text: 'Reviews',
        // ),
      ],
    );
  }
}
