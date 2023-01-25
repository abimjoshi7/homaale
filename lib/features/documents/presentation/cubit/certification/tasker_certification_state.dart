// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_certification_cubit.dart';

abstract class TaskerCertificationState extends Equatable {
  const TaskerCertificationState();
}

class TaskerCertificationInitial extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerCertificationSuccess extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerCertificationFailure extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerGetCertificationSuccess extends TaskerCertificationState {
  final List<Certificate> taskerCertificationRes;
  const TaskerGetCertificationSuccess({
    required this.taskerCertificationRes,
  });
  @override
  List<Object?> get props => [taskerCertificationRes];
}

class TaskerGetCertificationFailure extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerAddCertificationSuccess extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerAddCertificationFailure extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerEditCertificationSuccess extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerEditCertificationFailure extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerDeleteCertificationSuccess extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerDeleteCertificationFailure extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}

class TaskerRetrieveCertificationSuccess extends TaskerCertificationState {
  final Certificate taskerCertificationRes;
  const TaskerRetrieveCertificationSuccess({
    required this.taskerCertificationRes,
  });
  @override
  List<Object?> get props => [taskerCertificationRes];
}

class TaskerRetrieveCertificationFailure extends TaskerCertificationState {
  @override
  List<Object?> get props => [];
}
