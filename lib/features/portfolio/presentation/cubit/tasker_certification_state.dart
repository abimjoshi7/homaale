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
  final TaskerCertificationRes taskerCertificationRes;
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
