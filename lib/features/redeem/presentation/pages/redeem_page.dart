import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/redeem/statement/presentation/pages/statement_section.dart';
import 'package:cipher/features/redeem/presentation/pages/widgets/redeem_points_card.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../profile/presentation/widgets/profile_stats_card.dart';

class RedeemPage extends StatefulWidget {
  static const routeName = '/redeem';

  const RedeemPage({Key? key}) : super(key: key);

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var spent = (context.read<UserBloc>().state.taskerProfile!.points! -
        context.read<UserBloc>().state.taskerProfile!.remainingPoints!);
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Redeem',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Points',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileStatsCard(
                height: 80,
                width: 130,
                imagePath: 'assets/reward.png',
                label: 'Current Points',
                value: context
                        .read<UserBloc>()
                        .state
                        .taskerProfile
                        ?.remainingPoints
                        .toString() ??
                    "", // '445',
                assetsColor: Colors.orange,
              ),
              ProfileStatsCard(
                height: 80,
                width: 130,
                imagePath: 'assets/reward.png',
                label: 'Total Earned',
                value: context
                        .read<UserBloc>()
                        .state
                        .taskerProfile
                        ?.points
                        .toString() ??
                    "",
                assetsColor: Colors.green,
              ),
              ProfileStatsCard(
                height: 80,
                width: 130,
                imagePath: 'assets/reward.png',
                label: 'Total Spent',
                value: spent.toString(),
                assetsColor: Colors.red,
              ),
            ],
          ),
          addVerticalSpace(20),
          TabBar(
              indicatorColor: kColorSecondary,
              labelPadding: kPadding10,
              controller: tabController,
              tabs: [
                Text('Redeem'),
                Text('Statement'),
              ]),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                RedeemPointsCard(),
                StatementSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
