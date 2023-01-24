// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_education_cubit.dart';

abstract class TaskerEducationState extends Equatable {
  const TaskerEducationState();
}

class TaskerEducationInitial extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerEducationSuccess extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerEducationFailure extends TaskerEducationState {
  @override
  List<Object?> get props => [];
}

class TaskerGetEducationSuccess extends TaskerEducationState {
  final Education taskerEducationRes;
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
