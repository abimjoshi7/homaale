import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/categories/presentation/pages/categories_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HeroCategoryCubit, HeroCategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HeroCategoryInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HeroCategoryLoadSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(8),
                  SectionHeading(
                    labelName: 'Categories',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CategoriesPage.routeName,
                      );
                    },
                  ),
                  addVerticalSpace(8),
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.hero.result?.length,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CategoriesPage.routeName,
                          );
                        },
                        child: CategoriesIcons(
                          data: state.hero.result?[index]?.category?.name ?? '',
                          color: randomColorGenerator(),
                          child: SvgPicture.network(
                            state.hero.result?[index]?.category?.icon
                                    .toString() ??
                                "",
                          ),
                          // const Icon(Icons.add_circle),
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
