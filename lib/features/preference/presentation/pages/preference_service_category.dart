import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PreferencesServiceCategory extends StatefulWidget {
  const PreferencesServiceCategory({super.key});

  static const List<String> serviceList = [
    'Household',
    'Beauty',
    'Fitness',
    'Courier Service',
    'Party Planner',
    'Classes',
    // 'Health & Care',
    // 'Maintenance',
  ];

  static const List<String> serviceAssetList = [
    'assets/home.png',
    'assets/beauty.png',
    'assets/fitness.png',
    'assets/courier.png',
    'assets/party.png',
    'assets/class.png',
  ];

  @override
  State<PreferencesServiceCategory> createState() =>
      _PreferencesServiceCategoryState();
}

class _PreferencesServiceCategoryState
    extends State<PreferencesServiceCategory> {
  List<bool> isSelected = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose your Service Category',
            style: kPurpleText16,
          ),
          kHeight10,
          const Text(
            'Select at least 2 categories to get started',
            style: kHelper13,
          ),
          kHeight50,
          Expanded(
            child: GridView.builder(
              itemCount: PreferencesServiceCategory.serviceList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.8,
                crossAxisSpacing: 15,
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
                          PreferencesServiceCategory.serviceAssetList[index],
                        ),
                        kHeight10,
                        Text(
                          PreferencesServiceCategory.serviceList[index],
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
