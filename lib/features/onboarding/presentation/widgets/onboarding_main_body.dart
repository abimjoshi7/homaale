import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';

class OnboardingMainBody extends StatelessWidget {
  const OnboardingMainBody({
    super.key,
    required this.mainImage,
    required this.headingText,
    required this.bodyText,
    required this.selectedIndex,
    required this.onNextButtonPressed,
  });

  final String mainImage;
  final String headingText;
  final String bodyText;
  final int selectedIndex;
  final OnNextButtonPressed onNextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
              mainImage,
            ),
          ),
          // kHeight50,
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.306,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.maximize,
                    size: 60,
                    color: Color(0xffCED4DA),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headingText,
                          style: kPurpleText19,
                        ),
                        kHeight10,
                        Text(
                          bodyText,
                          style: kBodyText1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                4,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                    width: selectedIndex == index
                                        ? MediaQuery.of(context).size.width *
                                            0.02
                                        : MediaQuery.of(context).size.height *
                                            0.01,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? kColorPrimary
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.29,
                            ),
                            if (selectedIndex == 3)
                               Text(
                                'Continue to Login',
                                style: Theme.of(context).textTheme.headlineSmall,
                              )
                            else
                              const SizedBox(),
                            GestureDetector(
                              onTap: () =>
                                  onNextButtonPressed(Navigator.of(context)),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kColorPrimary,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
