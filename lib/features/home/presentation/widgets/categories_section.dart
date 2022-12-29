import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/home/presentation/pages/categories.dart';
import 'package:cipher/features/home/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionHeading(
            labelName: 'Categories',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Categories(),
                ),
              );
            },
          ),
          SizedBox(
            height: 230,
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) => CategoriesIcons(
                data: categoriesNameList[index],
                color: categoriesColorList[index],
                child: Image.asset(
                  categoriesAssetPath[index],
                ),
              ),
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
