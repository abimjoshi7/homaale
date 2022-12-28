import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PreferencesSignUp extends StatefulWidget {
  const PreferencesSignUp({super.key});

  @override
  State<PreferencesSignUp> createState() => _PreferencesSignUpState();
}

class _PreferencesSignUpState extends State<PreferencesSignUp> {
  bool isTasker = false;
  bool isClient = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How would you like to sign up?",
          style: kText16,
        ),
        kHeight20,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQueryHelper.theHeight(context) * 0.22,
              width: double.infinity,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff5C6096),
                        ),
                        child: Image.asset("assets/Saly-26.png"),
                      ),
                      CustomRadio(
                        isSelected: isClient,
                        onTap: () => setState(
                          () {
                            print(isClient);
                            isClient = !isClient;
                            isTasker = !isClient;
                          },
                        ),
                      )
                    ],
                  ),
                  kHeight15,
                  const Text.rich(
                    TextSpan(
                      text: "I am a ",
                      style: kText16,
                      children: [
                        TextSpan(
                          text: "Client",
                          style: TextStyle(
                            color: Color(
                              0xff5C6096,
                            ),
                          ),
                        ),
                        TextSpan(text: " hiring for services"),
                      ],
                    ),
                  ),
                  kHeight10,
                  const Text(
                    "I am looking forward to hire professional individual and get my work done as quick as possible.",
                    style: kHelper1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
        kHeight20,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQueryHelper.theHeight(context) * 0.22,
              width: double.infinity,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff297796),
                        ),
                        child: Image.asset("assets/Saly-27.png"),
                      ),
                      CustomRadio(
                        isSelected: isTasker,
                        onTap: () => setState(
                          () {
                            print(isClient);
                            isClient = !isClient;
                            isTasker = !isClient;
                          },
                        ),
                      )
                    ],
                  ),
                  kHeight15,
                  const Text.rich(
                    TextSpan(
                      text: "I am a ",
                      style: kText16,
                      children: [
                        TextSpan(
                          text: "Tasker",
                          style: TextStyle(
                            color: Color(
                              0xff297796,
                            ),
                          ),
                        ),
                        TextSpan(text: " looking for work"),
                      ],
                    ),
                  ),
                  kHeight10,
                  const Text(
                    "I am a hardworking person who seeks oppurtunity in every task focusing on uplifting my careers to next heights.",
                    style: kHelper1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
