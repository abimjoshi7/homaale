part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadSuccess extends CategoriesState{
  final List<Category> categoryList;

  const CategoriesLoadSuccess(this.categoryList);
  @override
  List<Object?> get props => [categoryList];
}

class CategoriesHeroLoadSuccess extends CategoriesState{
  final HeroCategory heroCategory;

  const CategoriesHeroLoadSuccess(this.heroCategory);
  @override
  List<Object?> get props => [heroCategory];
}

class CategoriesLoadFailure extends CategoriesState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
