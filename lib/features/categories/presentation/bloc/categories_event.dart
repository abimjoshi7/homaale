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
