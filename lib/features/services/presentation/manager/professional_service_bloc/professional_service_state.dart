// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'professional_service_bloc.dart';

abstract class ProfessionalServiceState extends Equatable {
  const ProfessionalServiceState();
}

class ProfessionalServiceInitial extends ProfessionalServiceState {
  @override
  List<Object?> get props => [];
}

class ProfessionalServiceLoadSuccess extends ProfessionalServiceState {
  final ProfessionalServiceModel model;
  const ProfessionalServiceLoadSuccess({
    required this.model,
  });
  @override
  List<Object?> get props => [
        model,
      ];
}

class ProfessionalServiceLoadFailure extends ProfessionalServiceState {
  @override
  List<Object?> get props => [];
}
