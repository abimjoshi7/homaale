import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/categories/presentation/pages/categories_page.dart';
import 'package:cipher/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  static const routeName = '/categories';


  @override
  Widget build(BuildContext context) {
  final color = [kColorGrey, kColorSecondary];
    return BlocConsumer<HeroCategoryCubit, HeroCategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HeroCategoryInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HeroCategoryLoadSuccess) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: kPadding20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Categories', style: kPurpleText19),
                  Expanded(
                    child: Padding(
                      padding: kPadding20,
                      child: GridView.builder(
                        itemCount: state.hero.result?.length,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              CategoriesPage.routeName,
                            );
                          },
                          child: CategoriesIcons(
                            // color: categoriesColorList[index],
                            color: color[index],
                            data:
                                state.hero.result?[index]?.category?.name ?? '',
                            child: state.hero.result?[index]?.category?.icon
                                    as Icon? ??
                                Icon(
                                  Icons.circle,
                                  color: color[index],
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
