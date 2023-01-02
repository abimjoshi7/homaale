// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HomeHeaderSection(),
            const HeaderBannerSection(),
            const DealOfTheDaySection(),
            const CategoriesSection(),
            const PopularServicesSection(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Image.asset(
                'assets/banners/Sliding Banner.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const ProfessionalServicesSection(),
            const VerifiedServicesSection(),
            const PopularServicesNearbySection(),
            const PopularInCity(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Image.asset(
                'assets/banners/banner.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const TasksSuggestionSection(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Homaale Notable Quality',
                style: kText16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                'assets/banners/notable.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const PopularTaskerNearbySection(),
            const TaskRecommendationSection(),
            const FeaturedServicesSection(),
            const PopularTaskerSection(),
            const PopularTaskNearbySection()
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
