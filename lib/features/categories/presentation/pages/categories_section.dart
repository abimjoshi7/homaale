import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/categories/presentation/pages/categories_page.dart';
import 'package:cipher/features/home/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            padding: kPadding10,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeading(
                    labelName: 'Categories',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CategoriesPage.routeName,
                      );
                    },
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                          data: state.hero.result?[index]?.category?.name ?? '',
                          color: randomColorGenerator(),
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
