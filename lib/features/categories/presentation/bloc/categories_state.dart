part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final TheStates? theStates;
  final List<Category>? categoryList;
  final List<TopCategory>? topCategory;
  final HeroCategory? heroCategory;
  final TaskSubCategoryModel? taskSubCategoryModel;
  final String? categoryName;
  CategoriesState({
    this.theStates = TheStates.initial,
    this.categoryList,
    this.topCategory,
    this.heroCategory,
    this.taskSubCategoryModel,
    this.categoryName,
  });

  CategoriesState copyWith({
    TheStates? theStates,
    List<Category>? categoryList,
    List<TopCategory>? topCategory,
    HeroCategory? heroCategory,
    TaskSubCategoryModel? taskSubCategoryModel,
    String? categoryName,
  }) {
    return CategoriesState(
      theStates: theStates ?? this.theStates,
      categoryList: categoryList ?? this.categoryList,
      topCategory: topCategory ?? this.topCategory,
      heroCategory: heroCategory ?? this.heroCategory,
      taskSubCategoryModel: taskSubCategoryModel ?? this.taskSubCategoryModel,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      categoryList,
      topCategory,
      heroCategory,
      taskSubCategoryModel,
      categoryName,
    ];
  }
}
