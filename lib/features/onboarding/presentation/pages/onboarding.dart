// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/onboarding/presentation/widgets/onboarding_main_body.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:cipher/widgets/custom_header.dart';
import 'package:dependencies/dependencies.dart';
import 'package:cipher/core/constants/animation_duration_constants.dart';
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
  late List<Widget> widgetList;

  void changeSelectedIndex() {
    if (selectedIndex == widgetList.length - 1) {
      selectedIndex = 0;
    } else {
      selectedIndex++;
    }
    pageController.animateToPage(
      selectedIndex,
      duration: kOnboardingAnimationDuration,
      curve: Curves.ease,
    );
  }

  Future<void> setOnboardingScreenViewState(NavigatorState navigator) async {
    await CacheHelper.setCachedString(
      "onBoardingScreenState",
      "1",
    );
    navigator.pushNamedAndRemoveUntil(
      SignInPage.routeName,
      (route) => false,
    );
    log("Onboarding Screen State Status: Cached");
  }

  @override
  void initState() {
    super.initState();
    widgetList = [
      OnboardingMainBody(
        selectedIndex: 0,
        mainImage:
            'assets/casual-life-3d-young-woman-working-on-laptop-and-holding-head.png',
        headingText: 'Welcome to Homaale',
        bodyText:
            'Get connected to variety of services and collaborate with reliable people.',
        onNextButtonPressed: changeSelectedIndex,
      ),
      OnboardingMainBody(
        selectedIndex: 1,
        mainImage: 'assets/Group 48099185.png',
        headingText: 'Define your requirements',
        bodyText: 'Set your requirements and post or apply for the tasks.',
        onNextButtonPressed: changeSelectedIndex,
      ),
      OnboardingMainBody(
        selectedIndex: 2,
        mainImage: 'assets/casual-life-3d-piggy-bank-with-coins-1 3.png',
        headingText: 'Secure payments',
        bodyText:
            'Choose from our reliable payment methods and get reward points.',
        onNextButtonPressed: changeSelectedIndex,
      ),
      OnboardingMainBody(
        selectedIndex: 3,
        mainImage: 'assets/Casual life 3D - 580.png',
        headingText: 'Get the task completed',
        bodyText: 'Voila! Your task is done.',
        onNextButtonPressed: changeSelectedIndex,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: (selectedIndex > 0)
            ? IconButton(
                onPressed: () => pageController.previousPage(
                  duration: kOnboardingAnimationDuration,
                  curve: Curves.ease,
                ),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: kColorGrey,
                ),
                iconSize: 30,
              )
            : kHeight5,
        actions: [
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () =>
                    setOnboardingScreenViewState(Navigator.of(context)),
                child: SizedBox(
                  child: Text(
                    'Skip',
                    style: kText20.copyWith(color: kColorGrey),
                  ),
                ),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kColorGrey,
                ),
                iconSize: 30,
              )
            ],
          )
        ],
        backgroundColor: kColorPrimaryAccent,
        elevation: 0,
      ),
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          controller: pageController,
          itemCount: widgetList.length,
          onPageChanged: (value) => setState(
            () => selectedIndex = value,
          ),
          itemBuilder: (context, index) => ColoredBox(
            color: const Color(0xff5c6096),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const CustomHeader(
                  leadingWidget: SizedBox.shrink(),
                  trailingWidget: SizedBox.shrink(),
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return Image.asset('assets/homaale_logo_title_light.png');
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                widgetList[selectedIndex],
              ],
            ),
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
