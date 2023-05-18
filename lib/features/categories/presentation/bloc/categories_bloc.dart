// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/features/categories/data/models/sub_category_res.dart'
    hide Category;
import 'package:cipher/features/categories/data/models/task_sub_category_model.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';

import 'package:cipher/features/categories/data/models/category.dart';
import 'package:cipher/features/categories/data/models/hero_category.dart';
import 'package:cipher/features/categories/data/models/top_category.dart';
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

    on<TaskSubCategoryLoaded>((event, emit) async {
      try {
        await repositories.getService(event.categoryId).then(
              (value) => emit(
                state.copyWith(
                  theStates: TheStates.success,
                  serviceList: value,
                  categoryName: event.categoryName,
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(
            serviceList: [],
          ),
        );
      }
    });

    on<CategoriesTopLoadInitiated>(
      (event, emit) async {
        try {
          await repositories.fetchTopCategory().then(
            (value) {
              List<TopCategory> tList = [];

              for (var element in value) {
                tList.add(
                  TopCategory.fromJson(
                    element as Map<String, dynamic>,
                  ),
                );
              }

              emit(
                state.copyWith(
                  topCategory: tList,
                  theStates: TheStates.success,
                ),
              );
            },
          );
        } catch (e) {
          log('Category error: ${e.toString()}');
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
          );
        }
      },
    );

    on<CategoriesChanged>(
      (event, emit) {
        try {
          emit(
            state.copyWith(
              serviceList: [],
            ),
          );
          for (final element in state.categoryList ?? []) {
            if (event.name == element.name) {
              add(
                TaskSubCategoryLoaded(
                  categoryId: element.id as int,
                  categoryName: element.name as String,
                ),
              );
            }
          }
        } catch (e) {
          throw Exception("Categories change failed");
        }
      },
    );

    on<SubCategoriesChanged>(
      (event, emit) {
        for (final element in state.serviceList ?? []) {
          if (event.name == element.redeemCount) {
            emit(
              state.copyWith(
                serviceId: element.id as String,
              ),
            );
          }
        }
      },
    );
  }
}
