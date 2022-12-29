import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/home/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> map = {
    //   'color': Color(0xffffb200),
    // 	'name' : 'Beauty',
    // 	'icon'
    // };

    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Categories',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categoriesNameList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) => CategoriesIcons(
                color: categoriesColorList[index],
                data: categoriesNameList[index],
                child: Image.asset(
                  categoriesAssetPath[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
