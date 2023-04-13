// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/categories/data/models/task_sub_category_model.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/category.dart';
import 'package:cipher/features/categories/data/models/hero_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepositories repositories;
  CategoriesBloc(
    this.repositories,
  ) : super(CategoriesState()) {
    on<CategoriesLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.fetchCategoriesList().then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    categoryList: value
                      ..sort(
                        (a, b) => a.name.compareTo(
                          b.name,
                        ),
                      ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              categoryList: null,
            ),
          );
        }
      },
    );

    on<CategoriesHeroLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.fetchHeroCategory().then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    heroCategory: HeroCategory.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              heroCategory: null,
            ),
          );
        }
      },
    );

    on<TaskSubCategoryLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.fetchTaskSubCategory(event.categoryId).then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    taskSubCategoryModel: TaskSubCategoryModel.fromJson(
                      value,
                    ),
                    categoryName: event.categoryName,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              taskSubCategoryModel: null,
            ),
          );
        }
      },
    );
  }
}
