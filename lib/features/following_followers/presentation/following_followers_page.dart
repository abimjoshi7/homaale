import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/following_followers/presentation/follower_section.dart';
import 'package:cipher/features/following_followers/presentation/following_section.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FollowingFollowersPage extends StatefulWidget {
  static const routeName = '/following-follwers-page';
  const FollowingFollowersPage({super.key});

  @override
  State<FollowingFollowersPage> createState() => _FollowingFollowersPageState();
}

class _FollowingFollowersPageState extends State<FollowingFollowersPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: '',trailingWidget: SizedBox()
      ),
      body: Column(
        children: [
          TabBar(
            indicatorColor: kColorSecondary,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: kPadding10,
            controller: _tabController,
            tabs: [
              Text(
                'Following',
              ),
              Text(
                'Followers',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FollowingSection(),
                FollowerSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
