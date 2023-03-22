part of 'task_entity_service_bloc.dart';

class TaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final TaskEntityService? taskEntityService;
  final ApplicantModel? applicantModel;

  const TaskEntityServiceState({
    this.theStates,
    this.taskEntityService,
    this.applicantModel,
  });

  TaskEntityServiceState copyWith({
    TheStates? theStates,
    TaskEntityService? taskEntityService,
    ApplicantModel? applicantModel,
  }) {
    return TaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      taskEntityService: taskEntityService ?? this.taskEntityService,
      applicantModel: applicantModel ?? this.applicantModel,
    );
  }

  @override
  List<Object?> get props => [theStates, taskEntityService, applicantModel];
}
