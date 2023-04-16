// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class TheCategoriesDropdown extends StatelessWidget {
  const TheCategoriesDropdown({
    Key? key,
    required this.categoriesBloc,
    this.onChanged,
    this.hintText,
  }) : super(key: key);
  final CategoriesBloc categoriesBloc;
  final Function(String?)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      bloc: categoriesBloc,
      builder: (context, state) {
        Widget displayDropdown() {
          if (state.theStates == TheStates.loading)
            return SizedBox(
              height: 50,
              child: LinearProgressIndicator(
                color: kColorSecondary,
                backgroundColor: Colors.transparent,
              ),
            );
          return CustomDropDownField<String?>(
            list: List.generate(
              state.categoryList?.length ?? 0,
              (index) => state.categoryList?[index].name,
            ),
            hintText: state.categoryName ?? 'Choose a category',
            onChanged: onChanged,
          );
        }

        return Column(
          children: [
            CustomFormField(
              label: 'Category',
              isRequired: true,
              child: displayDropdown(),
            ),
            Visibility(
              visible:
                  categoriesBloc.state.taskSubCategoryModel?.result?.length !=
                      0,
              child: CustomFormField(
                label: 'Select service type',
                isRequired: true,
                child: CustomDropDownField(
                  list: List.generate(
                    state.taskSubCategoryModel?.result?.length ?? 0,
                    (index) => state.taskSubCategoryModel?.result?[index].name,
                  ),
                  hintText: 'Choose a service',
                  onChanged: (value) {},
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
