import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/preference/presentation/pages/preference_sign_up.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});
  static const routeName = '/preference';

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  int selectedIndex = 0;
  final widgets = [
    const PreferencesSignUp(),
    const PreferencesJoinAs(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    kWidth15,
                    const Text('My Preferences', style: kTabBarTitle),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: const [
                      Text(
                        'Skip',
                        style: kSkipHelper,
                      ),
                      kWidth10,
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Color(0xff868E96),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    width: selectedIndex == 0
                        ? MediaQueryHelper.theWidth(context) * 0.21
                        : 0,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xff3D3F7D),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xffE9ECEF),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: widgets[selectedIndex],
              ),
            ),
            CustomElevatedButton(
              callback: () {
                setState(() {
                  selectedIndex++;
                });
              },
              label: 'Next',
            ),
            kHeight50,
          ],
        ),
      ),
    );
  }
}

class PreferencesJoinAs extends StatefulWidget {
  const PreferencesJoinAs({super.key});

  @override
  State<PreferencesJoinAs> createState() => _PreferencesJoinAsState();
}

class _PreferencesJoinAsState extends State<PreferencesJoinAs> {
  bool isIndividual = true;
  bool isOrganization = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'You want to join as',
          style: kText16,
        ),
        kHeight20,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQueryHelper.theHeight(context) * 0.05,
              width: double.infinity,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/z.png'),
                          kWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Individual'),
                              Text(
                                'You’re starting as an alone warrior',
                                style: kHelper1,
                              )
                            ],
                          )
                        ],
                      ),
                      CustomRadio(
                        isSelected: isIndividual,
                        onTap: () => setState(
                          () {
                            isIndividual = !isIndividual;
                            isOrganization = !isIndividual;
                          },
                        ),
                      )
                    ],
                  ),
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
              height: MediaQueryHelper.theHeight(context) * 0.05,
              width: double.infinity,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/x.png'),
                          kWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Organization'),
                              Text(
                                'We’re starting as an group of individual ',
                                style: kHelper1,
                              )
                            ],
                          )
                        ],
                      ),
                      CustomRadio(
                        isSelected: isOrganization,
                        onTap: () => setState(
                          () {
                            isIndividual = !isIndividual;
                            isOrganization = !isIndividual;
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        kHeight20,
      ],
    );
  }
}
