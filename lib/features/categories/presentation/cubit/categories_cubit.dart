import 'package:cipher/features/categories/data/models/hero_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final repositories = CategoriesRepositories();
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> fetchAllCategories() async {
    try {
      emit(
        CategoriesInitial(),
      );
      final x = await repositories.fetchHeroCategory();
      // emit(
      //   CategoriesSuccess(
      //     taskCategoryList: x,
      //   ),
      // );
    } catch (e) {
      emit(
        CategoriesFailure(),
      );
      rethrow;
    }
  }
}
