// ignore_for_file: lines_longer_than_80_chars

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/onboarding/presentation/widgets/onboarding_main_body.dart';
import 'package:cipher/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int selectedIndex = 0;
  final pageController = PageController();

  final List<Widget> widgetList = const [
    OnboardingMainBody(
      selectedIndex: 0,
      mainImage:
          'assets/casual-life-3d-young-woman-working-on-laptop-and-holding-head.png',
      headingText: 'Welcome to Homaale',
      bodyText:
          'Get connected to variety of services and collaborate with reliable people.',
    ),
    OnboardingMainBody(
      selectedIndex: 1,
      mainImage: 'assets/Group 48099185.png',
      headingText: 'Define your requirements',
      bodyText:
          'Post or apply for the tasks and be assured with our secured gateway.',
    ),
    OnboardingMainBody(
      selectedIndex: 2,
      mainImage: 'assets/Casual life 3D - 580.png',
      headingText: 'Get the task completed',
      bodyText: 'Voila! Your task is done.',
    ),
    OnboardingMainBody(
      selectedIndex: 3,
      mainImage: 'assets/casual-life-3d-piggy-bank-with-coins-1 3.png',
      headingText: 'Secure payments',
      bodyText: 'Get secure payment transactions & get bonus rewards.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: widgetList.length,
        onPageChanged: (value) => setState(
          () {
            selectedIndex = value;
          },
        ),
        itemBuilder: (context, index) => Container(
          // height: MediaQueryHelper.theHeight(context),
          // width: MediaQueryHelper.theWidth(context),
          color: const Color(0xff5c6096),
          child: Column(
            children: [
              kHeight50,
              const CustomHeader(
                leadingWidget: SizedBox.shrink(),
                trailingWidget: SizedBox.shrink(),
              ),
              Image.asset('assets/homaale_logo_title_light.png'),
              kHeight50,
              widgetList[selectedIndex],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
