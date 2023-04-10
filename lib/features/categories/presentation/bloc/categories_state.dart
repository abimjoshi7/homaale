part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadSuccess extends CategoriesState {
  final List<Category> categoryList;

  const CategoriesLoadSuccess(this.categoryList);
  @override
  List<Object?> get props => [categoryList];
}

class CategoriesTopLoadSuccess extends CategoriesState {
  final List<TopCategory> topCategory;

  const CategoriesTopLoadSuccess(this.topCategory);
  @override
  List<Object?> get props => [topCategory];
}

class CategoriesLoadFailure extends CategoriesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
