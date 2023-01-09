// ignore_for_file: lines_longer_than_80_chars

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
  bool isMerchant = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How would you like to sign up?',
          style: kPurpleText16,
        ),
        kHeight20,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Column(
                      children: [
                        kHeight10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff5C6096),
                              ),
                              child: Image.asset('assets/Saly-26.png'),
                            ),
                            kWidth10,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text.rich(
                                    TextSpan(
                                      text: 'I am a ',
                                      style: kPurpleText16,
                                      children: [
                                        TextSpan(
                                          text: 'Client',
                                          style: TextStyle(
                                            color: Color(
                                              0xff5C6096,
                                            ),
                                          ),
                                        ),
                                        TextSpan(text: ' hiring for services'),
                                      ],
                                    ),
                                  ),
                                  kHeight10,
                                  Text(
                                    'I am looking forward to hire professional individual and get my work done as quick as possible.',
                                    style: kHelper13,
                                  ),
                                ],
                              ),
                            ),
                            kHeight15,
                            CustomRadio(
                              isSelected: isClient,
                              onTap: () => setState(
                                () {
                                  isClient = !isClient;
                                  isTasker = !isClient;
                                  isMerchant = !isClient;
                                },
                              ),
                            )
                          ],
                        ),
                        kHeight15,
                      ],
                    ),
                  ),
                ),
              ),
              kHeight50,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 105,
                    width: double.infinity,
                    child: Column(
                      children: [
                        kHeight10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff297796),
                              ),
                              child: Image.asset('assets/Saly-27.png'),
                            ),
                            kWidth10,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text.rich(
                                    TextSpan(
                                      text: 'I am a ',
                                      style: kPurpleText16,
                                      children: [
                                        TextSpan(
                                          text: 'Tasker',
                                          style: TextStyle(
                                            color: Color(
                                              0xff297796,
                                            ),
                                          ),
                                        ),
                                        TextSpan(text: ' looking for work'),
                                      ],
                                    ),
                                  ),
                                  kHeight10,
                                  Text(
                                    'I am a hardworking person focusing on uplifting my careers to next heights.',
                                    style: kHelper13,
                                  ),
                                ],
                              ),
                            ),
                            kHeight15,
                            CustomRadio(
                              isSelected: isTasker,
                              onTap: () => setState(
                                () {
                                  isTasker = !isTasker;
                                  isClient = !isTasker;
                                  isMerchant = !isTasker;
                                },
                              ),
                            )
                          ],
                        ),
                        kHeight15,
                      ],
                    ),
                  ),
                ),
              ),
              kHeight50,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 105,
                    width: double.infinity,
                    child: Column(
                      children: [
                        kHeight10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffAB533F),
                              ),
                              child: Image.asset('assets/MERCH 2asd.png'),
                            ),
                            kWidth10,
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text.rich(
                                    TextSpan(
                                      text: 'I am a ',
                                      style: kPurpleText16,
                                      children: [
                                        TextSpan(
                                          text: 'Merchant',
                                          style: TextStyle(
                                            color: Color(
                                              0xff5C6096,
                                            ),
                                          ),
                                        ),
                                        TextSpan(text: ' looking for Tasker'),
                                      ],
                                    ),
                                  ),
                                  kHeight10,
                                  Text(
                                    'I am a merchant looking for taskers who are willing to work in my behalf.',
                                    style: kHelper13,
                                  ),
                                ],
                              ),
                            ),
                            kHeight15,
                            CustomRadio(
                              isSelected: isMerchant,
                              onTap: () => setState(
                                () {
                                  isMerchant = !isMerchant;
                                  isTasker = !isMerchant;
                                  isClient = !isMerchant;
                                },
                              ),
                            )
                          ],
                        ),
                        kHeight15,
                      ],
                    ),
                  ),
                ),
              ),
              kHeight20,
            ],
          ),
        ),

        // Card(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: SizedBox(
        //       height: MediaQueryHelper.theHeight(context) * 0.22,
        //       width: double.infinity,
        //       child: Column(
        //         children: [
        //           kHeight10,
        //           Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               const SizedBox.shrink(),
        //               Container(
        //                 height: 80,
        //                 width: 80,
        //                 decoration: const BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   color: Color(0xff297796),
        //                 ),
        //                 child: Image.asset('assets/Saly-27.png'),
        //               ),
        //               CustomRadio(
        //                 isSelected: isTasker,
        //                 onTap: () => setState(
        //                   () {
        //                     isClient = !isClient;
        //                     isTasker = !isClient;
        //                   },
        //                 ),
        //               )
        //             ],
        //           ),
        //           kHeight15,
        //           const Text.rich(
        //             TextSpan(
        //               text: 'I am a ',
        //               style: kPurpleText16,
        //               children: [
        //                 TextSpan(
        //                   text: 'Tasker',
        //                   style: TextStyle(
        //                     color: Color(
        //                       0xff297796,
        //                     ),
        //                   ),
        //                 ),
        //                 TextSpan(text: ' looking for work'),
        //               ],
        //             ),
        //           ),
        //           kHeight10,
        //           const Text(
        //             'I am a hardworking person who seeks oppurtunity in every task focusing on uplifting my careers to next heights.',
        //             style: kHelper1,
        //             textAlign: TextAlign.center,
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
