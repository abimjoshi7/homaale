// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_experience_cubit.dart';

abstract class TaskerExperienceState extends Equatable {
  const TaskerExperienceState();
}

class TaskerExperienceInitial extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerExperienceSuccess extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerExperienceFailure extends TaskerExperienceState {
  @override
  List<Object?> get props => [];
}

class TaskerGetExperienceSuccess extends TaskerExperienceState {
  final Experience taskerExperienceRes;
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
