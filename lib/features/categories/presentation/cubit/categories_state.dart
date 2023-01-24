// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesSuccess extends CategoriesState {
  final List<HeroCategory> taskCategoryList;
  const CategoriesSuccess({
    required this.taskCategoryList,
  });
  @override
  List<Object?> get props => [taskCategoryList];
}

class CategoriesFailure extends CategoriesState {
  @override
  List<Object?> get props => [];
}
