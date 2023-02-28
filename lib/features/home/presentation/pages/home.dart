// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/categories/presentation/pages/categories_section.dart';
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
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HomeHeaderSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    HeaderOfferSection(),
                    DealsOfTheDaySection(),
                    CategoriesSection(),
                    PopularServicesSection(),
                    TasksSuggestionSection(),
                    PopularTaskerSection(),
                    NotableBannerSection(),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //   ),
                    //   child: Image.asset(
                    //     'assets/banners/Sliding Banner.png',
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),
                    RecentlyLaunchedServicesSection(),
                    TasksAndServicesNearbySection(),
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
