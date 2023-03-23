part of 'task_entity_service_bloc.dart';

class TaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final TaskEntityService? taskEntityService;
  final ApplicantModel? applicantModel;
  final bool? approveSuccess;
  final bool? approveFail;

  final TaskEntityServiceRes? taskEntityServiceRes;
  final bool? isLoaded;
  final bool? isCreated;
  const TaskEntityServiceState({
    this.theStates = TheStates.initial,
    this.taskEntityService,
    this.applicantModel,
    this.approveSuccess = false,
    this.approveFail = false,
    this.taskEntityServiceRes,
    this.isLoaded = false,
    this.isCreated = false,
  });

  TaskEntityServiceState copyWith({
    TheStates? theStates,
    TaskEntityService? taskEntityService,
    ApplicantModel? applicantModel,
    bool? approveSuccess,
    bool? approveFail,
    TaskEntityServiceRes? taskEntityServiceRes,
    bool? isLoaded,
    bool? isCreated,
  }) {
    return TaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      taskEntityService: taskEntityService ?? this.taskEntityService,
      applicantModel: applicantModel ?? this.applicantModel,
      approveSuccess: approveSuccess ?? this.approveSuccess,
      approveFail: approveFail ?? this.approveFail,
      taskEntityServiceRes: taskEntityServiceRes ?? this.taskEntityServiceRes,
      isLoaded: isLoaded ?? this.isLoaded,
      isCreated: isCreated ?? this.isCreated,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      taskEntityService,
      taskEntityServiceRes,
      isLoaded,
      isCreated,
      applicantModel,
      approveSuccess,
      approveFail,
    ];
  }
}
