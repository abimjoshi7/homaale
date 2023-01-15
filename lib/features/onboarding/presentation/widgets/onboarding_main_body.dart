import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class OnboardingMainBody extends StatelessWidget {
  const OnboardingMainBody({
    super.key,
    required this.mainImage,
    required this.headingText,
    required this.bodyText,
    required this.selectedIndex,
    // required this.onTap,
  });

  final String mainImage;
  final String headingText;
  final String bodyText;
  final int selectedIndex;
  // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: MediaQueryHelper.theHeight(context) * 0.4,
            child: Image.asset(mainImage),
          ),
          kHeight50,
          Expanded(
            child: Container(
              height: MediaQueryHelper.theHeight(context),
              width: MediaQueryHelper.theWidth(context),
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
                    padding: const EdgeInsets.all(20),
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
                        kHeight50,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                4,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    height: 10,
                                    width: selectedIndex == index ? 20 : 10,
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
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SignInPage.routeName,
                                  (route) => false,
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kColorPrimary,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 30,
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
