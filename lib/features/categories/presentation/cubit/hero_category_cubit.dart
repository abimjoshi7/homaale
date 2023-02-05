import 'package:bloc/bloc.dart';
import 'package:cipher/features/categories/data/models/hero_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:equatable/equatable.dart';

part 'hero_category_state.dart';

class HeroCategoryCubit extends Cubit<HeroCategoryState> {
  final repositories = CategoriesRepositories();
  HeroCategoryCubit() : super(HeroCategoryInitial());

  Future getHeroCategory() async {
    try {
      await repositories.fetchHeroCategory().then(
            (value) => emit(
              HeroCategoryLoadSuccess(
                HeroCategory.fromJson(value),
              ),
            ),
          );
    } catch (e) {
      emit(
        HeroCategoryLoadFailure(),
      );
    }
  }
}
