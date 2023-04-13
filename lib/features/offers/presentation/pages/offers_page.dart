import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatefulWidget {
  static const routeName = '/offers-page';
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
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
      appBar: CustomAppBar(appBarTitle: "Offers"),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                TabBar(
                  labelPadding: kPadding10,
                  controller: _tabController,
                  tabs: const [
                    Text('All'),
                    Text('Coupons'),
                    Text('Scratch Cards'),
                    Text('Offers'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
