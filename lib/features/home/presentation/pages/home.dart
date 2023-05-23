import 'package:cipher/features/categories/presentation/pages/sections/categories_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });
  static const routeName = '/home';
  static final notificationKey = GlobalKey();

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
                    bottom: 16,
                  ),
                  child: Column(
                    children: <Widget>[
                      HeaderOfferSection(),
                      // DealsOfTheDaySection(),
                      CategoriesSection(),
                      TrendingServicesSection(),
                      TasksRecommendationSection(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/banners/notable1.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      PopularTaskerSection(),
                      SizedBox(height: 10),
                      NotableBannerSection(),
                      // RecentlyLaunchedServicesSection(),
                      TasksAndServicesNearbySection(),
                      // SizedBox(height: 120),
                      // const PopularTaskerNearbySection(),
                      // const TaskRecommendationSection(),
                      // PopularTaskNearbySection()
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
