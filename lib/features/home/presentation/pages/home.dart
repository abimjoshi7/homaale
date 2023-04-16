import 'package:cipher/features/categories/presentation/pages/sections/categories_section.dart';
import 'package:cipher/features/chat/view/chat_listing.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.88,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const HomeHeaderSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HeaderOfferSection(),
                    // DealsOfTheDaySection(),
                    CategoriesSection(),
                    PopularServicesSection(),
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
                    NotableBannerSection(),
                    SizedBox(height: 120),

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
