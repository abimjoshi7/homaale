import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/categories/presentation/pages/categories_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/pages/home.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  static final catKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(CategoriesTopLoadInitiated());
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.theStates == TheStates.initial) {
          return const Center(
            child: CardLoading(
              height: 100,
            ),
          );
        } else if (state.theStates == TheStates.success &&
            state.topCategory != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 190,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(8),
                  CommonShowCase(
                    position: TooltipPosition.bottom,
                    showKey: catKey,
                    showCaseTitle: 'See All ',
                    showCaseDec: 'See All Categories from here.',
                    child: SectionHeading(
                      labelName: 'Categories',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CategoriesPage.routeName,
                        );
                      },
                    ),
                  ),
                  addVerticalSpace(8),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.topCategory?.length,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context
                              .read<NestedCategoriesCubit>()
                              .getNestedCategory();
                          Navigator.pushNamed(
                            context,
                            CategoriesPage.routeName,
                            arguments: {
                              'id': state.topCategory?[index].id,
                              'category': state.topCategory?[index].category,
                            },
                          );
                        },
                        child: CategoriesIcons(
                          data: state.topCategory?[index].category ?? '',
                          color: randomColorGenerator(),
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: SvgPicture.string(
                              state.topCategory?[index].icon?.toString() ??
                                  kErrorSvg,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
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
