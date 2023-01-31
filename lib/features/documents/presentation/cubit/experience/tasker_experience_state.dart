// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_experience_cubit.dart';

abstract class TaskerExperienceState extends Equatable {
  const TaskerExperienceState();
}

class TaskerExperienceInitial extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerAddExperienceSuccess extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerAddExperienceFailure extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerGetExperienceSuccess extends TaskerExperienceState {
  final List<Experience> taskerExperienceRes;
  const TaskerGetExperienceSuccess({
    required this.taskerExperienceRes,
  });
  @override
  List<Object?> get props => [taskerExperienceRes];
}

class TaskerGetExperienceFailure extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerRetrieveExperienceSuccess extends TaskerExperienceState {
  final Experience taskerExperienceRes;
  const TaskerRetrieveExperienceSuccess({
    required this.taskerExperienceRes,
  });
  @override
  List<Object?> get props => [taskerExperienceRes];
}

class TaskerRetrieveExperienceFailure extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerEditExperienceSuccess extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerEditExperienceFailure extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerDeleteExperienceSuccess extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerDeleteExperienceFailure extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}
