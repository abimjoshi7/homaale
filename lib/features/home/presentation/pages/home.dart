import 'package:cipher/features/categories/presentation/pages/sections/categories_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  static const routeName = '/home';
  static final notificationKey = GlobalKey();
  static final string = '';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const HomeHeaderSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Column(
                    children: <Widget>[
                      HeaderOfferSection(),
                      // DealsOfTheDaySection(),
                      CategoriesSection(),
                      TrendingServicesSection(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/banners/notable1.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      TasksRecommendationSection(),
                      PopularTaskerSection(),
                      NotableBannerSection(),
                      TasksAndServicesNearbySection(),
                      // const PopularTaskerNearbySection(),
                      // const TaskRecommendationSection(),
                      // PopularTaskNearbySection()
                      // RecentlyLaunchedServicesSection(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
