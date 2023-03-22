part of 'task_entity_service_bloc.dart';

class TaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final TaskEntityService? taskEntityService;
  final ApplicantModel? applicantModel;
  final bool? approveSuccess;
  final bool? approveFail;

  const TaskEntityServiceState({
    this.theStates,
    this.taskEntityService,
    this.applicantModel,
    this.approveSuccess = false,
    this.approveFail = false,
  });

  TaskEntityServiceState copyWith({
    TheStates? theStates,
    TaskEntityService? taskEntityService,
    ApplicantModel? applicantModel,
    bool? approveSuccess,
    bool? approveFail,
  }) {
    return TaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      taskEntityService: taskEntityService ?? this.taskEntityService,
      applicantModel: applicantModel ?? this.applicantModel,
      approveSuccess: approveSuccess ?? this.approveSuccess,
      approveFail: approveFail ?? this.approveFail,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      taskEntityService,
      applicantModel,
      approveSuccess,
      approveFail,
    ];
  }
}
