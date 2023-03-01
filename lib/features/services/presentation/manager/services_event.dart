part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();
}

class ServicesLoadInitiated extends ServicesEvent {
  final int? categoryId;

  const ServicesLoadInitiated({this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}

class MyCreatedServicesLoadInitiated extends ServicesEvent {
  const MyCreatedServicesLoadInitiated();
  @override
  List<Object?> get props => [];
}

class ServicesAddInitiated extends ServicesEvent {
  final AddServiceReq addServiceReq;

  const ServicesAddInitiated(this.addServiceReq);
  @override
  List<Object?> get props => [addServiceReq];
}
