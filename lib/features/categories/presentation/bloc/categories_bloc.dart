import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cipher/features/categories/data/models/category.dart';
import 'package:cipher/features/categories/data/models/hero_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:equatable/equatable.dart';

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

    on<CategoriesHeroLoadInitiated>(
      (event, emit) async {
        try {
          await respositories.fetchHeroCategory().then(
                (value) => emit(
                  CategoriesHeroLoadSuccess(
                    HeroCategory.fromJson(value),
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
  }
}
