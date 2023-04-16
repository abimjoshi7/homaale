import 'package:cipher/features/categories/presentation/pages/sections/categories_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key,});
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
                child: Column(
                  children: const <Widget>[
                    HeaderOfferSection(),
                    // DealsOfTheDaySection(),
                    CategoriesSection(),
                    PopularServicesSection(),
                    TasksRecommendationSection(),
                    PopularTaskerSection(),
                    NotableBannerSection(),
                    SizedBox(height: 120,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //   ),
                    //   child: Image.asset(
                    //     'assets/banners/Sliding Banner.png',
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),
                    // RecentlyLaunchedServicesSection(),
                    // TasksAndServicesNearbySection(),
                    // const PopularTaskerNearbySection(),
                    // const TaskRecommendationSection(),
                    // PopularTaskNearbySection()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
