import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xffFF8F00),
  Color(0xffAA00DE),
  Color(0xff4CAF50),
  Color(0xffFFC107),
  Color(0xff101EE1),
  Color(0xffD9226F),
  Color(0xff62A2DD),
  Color(0xff9977D9),
];

final categoriesNameList = <String>[
  'Beauty',
  'Fitness',
  'Household',
  'Party Planner',
  'Courier Service',
  'Maintenance',
  'Classes',
  'Health & Care',
  'Creative Arts and Design',
  'Science',
  'Sports',
  'Tourism',
  'Media',
  'Logistics',
  'Utilities',
  'Marketing',
];

final categoriesAssetPath = <String>[
  'assets/categories/self_care.png',
  'assets/categories/fitness_center.png',
  'assets/categories/cleaning_services.png',
  'assets/categories/celebration.png',
  'assets/categories/airport_shuttle.png',
  'assets/categories/engineering.png',
  'assets/categories/school.png',
  'assets/categories/medication_liquid.png',
  'assets/categories/airport_shuttle.png',
  'assets/categories/engineering.png',
  'assets/categories/school.png',
  'assets/categories/medication_liquid.png',
  'assets/categories/airport_shuttle.png',
  'assets/categories/engineering.png',
  'assets/categories/school.png',
  'assets/categories/medication_liquid.png',
];

List<String> bottomNavItemImagePath = [
  'assets/bottomNavigationItems/home.png',
  'assets/bottomNavigationItems/2.png',
  'assets/bottomNavigationItems/3.png',
  'assets/bottomNavigationItems/1.png',
  'assets/bottomNavigationItems/4.png',
];

List<String> bottomNavItemName = [
  'Home',
  'Search',
  'Add',
  'Bookings',
  'Account',
];

List<String> weekNames = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
];

List<Widget> notableBannerList = [
  Padding(
    padding: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/banners/notable1.png',
      fit: BoxFit.fill,
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/banners/notable2.png',
      fit: BoxFit.fill,
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/banners/notable3.png',
      fit: BoxFit.fill,
    ),
  ),
];

List<Widget> offerBanner = [
  SizedBox(
    width: double.infinity,
    child: Image.asset(
      'assets/banners/1.png',
      fit: BoxFit.fitWidth,
    ),
  ),
  SizedBox(
    width: double.infinity,
    child: Image.asset(
      'assets/banners/2.png',
      fit: BoxFit.fitWidth,
    ),
  ),
];
