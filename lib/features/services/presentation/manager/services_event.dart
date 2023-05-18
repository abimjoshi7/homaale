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
