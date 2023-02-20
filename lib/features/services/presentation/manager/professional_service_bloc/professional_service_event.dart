part of 'professional_service_bloc.dart';

abstract class ProfessionalServiceEvent extends Equatable {
  const ProfessionalServiceEvent();
}

class ProfessionalLoadInitated extends ProfessionalServiceEvent {
  @override
  List<Object?> get props => [];
}
