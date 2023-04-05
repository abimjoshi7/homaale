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

class EntityServiceInitiated extends ServicesEvent {
  final int? page;
  final List<String>? order;
  final bool? isDateSort;
  final bool? isBudgetSort;
  final String? serviceId;

  const EntityServiceInitiated({
    this.page,
    this.order,
    this.isDateSort,
    this.isBudgetSort,
    this.serviceId,
  });
  @override
  List<Object?> get props => [
        page,
        order,
        isDateSort,
        isBudgetSort,
        serviceId,
      ];
}

class ProfessionalServicesLoaded extends ServicesEvent {
  final int? pageNumber;
  ProfessionalServicesLoaded({
    this.pageNumber,
  });
  @override
  List<Object?> get props => [
        pageNumber,
      ];
}
