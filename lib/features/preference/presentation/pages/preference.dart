import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/preference/presentation/pages/preference_add_skills.dart';
import 'package:cipher/features/preference/presentation/pages/preference_join_as.dart';
import 'package:cipher/features/preference/presentation/pages/preference_service_category.dart';
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
    const PreferencesServiceCategory(),
    const PreferencesAddSkill(),
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
                        ? 100
                        : selectedIndex == 1
                            ? 200
                            : selectedIndex == 2
                                ? 300
                                : selectedIndex == 3
                                    ? 400
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
                setState(
                  () {
                    while (selectedIndex < 3) {
                      selectedIndex++;
                      break;
                    }
                  },
                );
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
