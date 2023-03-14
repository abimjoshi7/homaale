// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class MyCreatedServiceTaskLoadInitiated extends ServicesEvent {
  final bool isTask;
  const MyCreatedServiceTaskLoadInitiated({
    required this.isTask,
  });
  @override
  List<Object?> get props => [
        isTask,
      ];
}

class ServicesAddInitiated extends ServicesEvent {
  final AddServiceReq addServiceReq;

  const ServicesAddInitiated(this.addServiceReq);
  @override
  List<Object?> get props => [addServiceReq];
}
