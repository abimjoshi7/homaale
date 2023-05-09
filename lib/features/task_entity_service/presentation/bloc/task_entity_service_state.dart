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
  final bool? isEdited;
  final bool? isDeleted;
  final bool? rejectSuccess;
  final bool? rejectFail;
  const TaskEntityServiceState({
    this.theStates,
    this.taskEntityService,
    this.applicantModel,
    this.approveSuccess,
    this.approveFail,
    this.taskEntityServiceRes,
    this.isLoaded,
    this.isCreated,
    this.isEdited,
    this.isDeleted,
    this.rejectSuccess,
    this.rejectFail,
  });

  const TaskEntityServiceState.init({
    this.theStates = TheStates.initial,
    this.taskEntityService = null,
    this.applicantModel = null,
    this.approveSuccess = false,
    this.approveFail = false,
    this.taskEntityServiceRes = null,
    this.isLoaded = false,
    this.isEdited = false,
    this.isDeleted = false,
    this.isCreated = false,
    this.rejectSuccess = false,
    this.rejectFail = false,
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
    bool? isEdited,
    bool? isDeleted,
    bool? rejectSuccess,
    bool? rejectFail,
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
      isEdited: isEdited ?? this.isEdited,
      isDeleted: isDeleted ?? this.isDeleted,
      rejectSuccess: rejectSuccess ?? this.rejectSuccess,
      rejectFail: rejectFail ?? this.rejectFail,
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
      taskEntityServiceRes,
      isLoaded,
      isCreated,
      isEdited,
      isDeleted,
      rejectSuccess,
      rejectFail,
    ];
  }
}
