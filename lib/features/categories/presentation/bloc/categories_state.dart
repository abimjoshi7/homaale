part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final TheStates? theStates;
  final List<Category>? categoryList;
  final List<SubCategoryRes>? serviceList;
  final List<TopCategory>? topCategory;
  final HeroCategory? heroCategory;
  final TaskSubCategoryModel? taskSubCategoryModel;
  final String? categoryName;
  final int? serviceId;
  CategoriesState({
    this.theStates = TheStates.initial,
    this.categoryList,
    this.serviceList,
    this.topCategory,
    this.heroCategory,
    this.taskSubCategoryModel,
    this.categoryName,
    this.serviceId,
  });

  CategoriesState copyWith({
    TheStates? theStates,
    List<Category>? categoryList,
    List<SubCategoryRes>? serviceList,
    List<TopCategory>? topCategory,
    HeroCategory? heroCategory,
    TaskSubCategoryModel? taskSubCategoryModel,
    String? categoryName,
    int? serviceId,
  }) {
    return CategoriesState(
      theStates: theStates ?? this.theStates,
      categoryList: categoryList ?? this.categoryList,
      serviceList: serviceList ?? this.serviceList,
      topCategory: topCategory ?? this.topCategory,
      heroCategory: heroCategory ?? this.heroCategory,
      taskSubCategoryModel: taskSubCategoryModel ?? this.taskSubCategoryModel,
      categoryName: categoryName ?? this.categoryName,
      serviceId: serviceId ?? this.serviceId,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      categoryList,
      serviceList,
      topCategory,
      heroCategory,
      taskSubCategoryModel,
      categoryName,
      serviceId,
    ];
  }
}
