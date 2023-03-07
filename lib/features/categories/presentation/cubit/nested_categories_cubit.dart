import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'nested_categories_state.dart';

class NestedCategoriesCubit extends Cubit<NestedCategoriesState> {
  final repositories = CategoriesRepositories();
  NestedCategoriesCubit()
      : super(
          NestedCategoriesInitial(),
        );

  Future getNestedCategory() async {
    try {
      await CategoriesRepositories().fetchNestedCategory().then(
            (value) => emit(
              NestedCategoriesLoadSuccess(
                value
                    .map(
                      (e) => NestedCategory.fromJson(e),
                    )
                    .toList(),
              ),
            ),
          );
    } catch (e) {
      emit(
        NestedCategoriesLoadFailure(),
      );
    }
  }
}
