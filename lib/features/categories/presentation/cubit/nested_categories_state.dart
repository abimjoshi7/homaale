part of 'nested_categories_cubit.dart';

abstract class NestedCategoriesState extends Equatable {
  const NestedCategoriesState();
}

class NestedCategoriesInitial extends NestedCategoriesState {
  @override
  List<Object> get props => [];
}
class NestedCategoriesLoadSuccess extends NestedCategoriesState {
  final List<NestedCategory> nestedCategory;

  const NestedCategoriesLoadSuccess(this.nestedCategory);
  @override
  List<Object> get props => [nestedCategory];
}
class NestedCategoriesLoadFailure extends NestedCategoriesState {
  @override
  List<Object> get props => [];
}
