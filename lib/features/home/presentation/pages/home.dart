import 'package:cipher/features/home/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeaderSection(),
            const HeaderBannerSection(),
            const DealOfTheDaySection(),
            const CategoriesSection(),
            const PopularServicesSection(),
            Image.asset(
              'assets/banners/Sliding Banner.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
