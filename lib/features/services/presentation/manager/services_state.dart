part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();
}

class ServicesInitial extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesLoadSuccess extends ServicesState {
  final List<ServiceList> list;

  const ServicesLoadSuccess(this.list);
  @override
  List<Object> get props => [list];
}

class ServicesLoadFailure extends ServicesState {
  @override
  List<Object> get props => [];
}
