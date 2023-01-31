import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PreferencesAddSkill extends StatefulWidget {
  const PreferencesAddSkill({super.key});

  @override
  State<PreferencesAddSkill> createState() => _PreferencesAddSkillState();
}

class _PreferencesAddSkillState extends State<PreferencesAddSkill> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> skillAssetList = [
    'assets/skills/cleaning.png',
    'assets/skills/laundry.png',
    'assets/skills/vacuuming.png',
    'assets/skills/kitchen_helper.png',
    'assets/skills/farming.png',
    'assets/skills/gardening.png',
    'assets/party.png',
    'assets/skills/pest_control.png',
    'assets/courier.png',
  ];

  List<String> skillList = [
    'Cleaning',
    'Laundry',
    'Vacuuming',
    'Kitchen Helper',
    'Farming',
    'Gardening',
    'Party Planner',
    'Pest Control',
    'Delivery',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add your skills',
            style: kPurpleText16,
          ),
          kHeight10,
          const Text(
            'Select maximum 2 categories to get started',
            style: kHelper13,
          ),
          kHeight50,
          Expanded(
            child: GridView.builder(
              itemCount: skillAssetList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 7,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(
                  () {
                    isSelected[index] = !isSelected[index];
                  },
                ),
                child: Card(
                  child: ColoredBox(
                    color: isSelected[index] == false
                        ? Colors.transparent
                        : const Color(0xffFFCA6A),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          skillAssetList[index],
                        ),
                        kHeight10,
                        Text(
                          skillList[index],
                          style: kPurpleText16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
