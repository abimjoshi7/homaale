import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/home/presentation/cubit/home_cubit.dart';
import 'package:cipher/features/home/presentation/pages/categories.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesLoadSuccess) {
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
                      MaterialPageRoute<Widget>(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) => CategoriesIcons(
                      data: state.heroCategory.result![index].category!.name!,
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
