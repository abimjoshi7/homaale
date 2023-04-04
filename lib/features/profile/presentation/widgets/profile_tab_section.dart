import 'package:flutter/material.dart';

class ProfileTabSection extends StatelessWidget {
  const ProfileTabSection({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
          text: 'Documents',
        ),
        Tab(
          text: 'Activities',
        ),
        // Tab(
        //   text: 'Rewards',
        // ),
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
