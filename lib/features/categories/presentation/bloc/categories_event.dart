// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class CategoriesLoadInitiated extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}


class CategoriesTopLoadInitiated extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}

class TaskSubCategoryLoaded extends CategoriesEvent {
  final int categoryId;
  final String categoryName;
  TaskSubCategoryLoaded({
    required this.categoryId,
    required this.categoryName,
  });
  @override
  List<Object?> get props => [
        categoryId,
      ];
}
