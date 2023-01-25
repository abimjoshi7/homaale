part of 'tasker_education_cubit.dart';

abstract class TaskerEducationState extends Equatable {
  const TaskerEducationState();
}

class TaskerEducationInitial extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerAddEducationSuccess extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerAddEducationFailure extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerEditEducationSuccess extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerEditEducationFailure extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerDeleteEducationSuccess extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerDeleteEducationFailure extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerGetEducationSuccess extends TaskerEducationState {
  final List<Education> taskerEducationRes;
  const TaskerGetEducationSuccess({
    required this.taskerEducationRes,
  });
  @override
  List<Object?> get props => [taskerEducationRes];
}

class TaskerGetEducationFailure extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerRetrieveEducationSuccess extends TaskerEducationState {
  final Education taskerEducationRes;
  const TaskerRetrieveEducationSuccess({
    required this.taskerEducationRes,
  });
  @override
  List<Object?> get props => [taskerEducationRes];
}

class TaskerRetrieveEducationFailure extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}
