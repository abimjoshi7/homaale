import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/home/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesHeroLoadSuccess) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: kPadding20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories', style: kPurpleText19),
                  Expanded(
                    child: GridView.builder(

                      itemCount: state.heroCategory.result?.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) =>
                          CategoriesIcons(
                            // color: categoriesColorList[index],
                            color: kColorPrimary,
                            data: state.heroCategory.result?[index]?.category?.name ?? '',
                            child: state.heroCategory.result?[index]?.category?.icon as Icon? ??
                                const Icon(Icons.circle, color: kColorPrimary,),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
