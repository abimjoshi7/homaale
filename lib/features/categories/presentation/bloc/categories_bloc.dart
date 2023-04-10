import 'dart:developer';

import 'package:cipher/features/categories/data/models/category.dart';
import 'package:cipher/features/categories/data/models/hero_category.dart';
import 'package:cipher/features/categories/data/models/top_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final respositories = CategoriesRepositories();
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesLoadInitiated>(
      (event, emit) async {
        try {
          await respositories.fetchCategoriesList().then(
                (value) => emit(
                  CategoriesLoadSuccess(
                    value,
                  ),
                ),
              );
        } catch (e) {
          emit(
            CategoriesLoadFailure(),
          );
        }
      },
    );

    on<CategoriesTopLoadInitiated>(
      (event, emit) async {
        try {
          await respositories.fetchTopCategory().then(
            (value) {
              List<TopCategory> tList = [];

              for (var element in value) {
                tList.add(TopCategory.fromJson(element as Map<String, dynamic>));
              }

              log('tList: $tList');

              emit(
                CategoriesTopLoadSuccess(tList),
              );
            },
          );
        } catch (e) {
          log('Category error: ${e.toString()}');
          emit(CategoriesLoadFailure());
        }
      },
    );
  }
}
