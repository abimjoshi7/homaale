part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();
}

class ServicesLoadInitiated extends ServicesEvent{
  final int categoryId;

  const ServicesLoadInitiated(this.categoryId);
  @override
  List<Object?> get props => [categoryId];
}
