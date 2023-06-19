part of 'task_bloc.dart';

class TaskState extends Equatable {
  final TheStates theState;
  final MyTaskRes? myTaskRes;
  final es.TaskEntityServiceModel taskEntityServiceModel;
  final List<TaskEntityService>? taskEntityServices;
  final TaskEntityService? taskModel;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  final TaskApplyCountModel? taskApplyCountModel;
  final ApplicantModel? applicantModel;
  final bool applyTaskFail;
  final bool applyTaskSuccess;
  final bool? approveSuccess;
  final bool? approveFail;
  final bool? rejectSuccess;
  final bool? rejectFail;
  final bool? isDateSort;
  final bool? isBudgetSort;
  final bool? isFilter;
  final bool isNegotiationStatusChanged;
  final List<ServiceList>? serviceList;
  final bool? servicesLoaded;
  final bool isLastPage;

  const TaskState({
    this.theState = TheStates.initial,
    this.myTaskRes,
    this.taskEntityServiceModel = const TaskEntityServiceModel(),
    this.taskEntityServices,
    this.taskModel,
    this.selfCreatedTaskServiceModel,
    this.taskApplyCountModel,
    this.applicantModel,
    this.applyTaskFail = false,
    this.applyTaskSuccess = false,
    this.approveSuccess = false,
    this.approveFail = false,
    this.rejectSuccess = false,
    this.rejectFail = false,
    this.isDateSort = false,
    this.isBudgetSort = false,
    this.isFilter = false,
    this.isNegotiationStatusChanged = false,
    this.serviceList,
    this.servicesLoaded = false,
    this.isLastPage = false,
  });

  @override
  List<Object?> get props {
    return [
      theState,
      myTaskRes,
      taskEntityServiceModel,
      taskEntityServices,
      taskModel,
      selfCreatedTaskServiceModel,
      taskApplyCountModel,
      applicantModel,
      applyTaskFail,
      applyTaskSuccess,
      approveSuccess,
      approveFail,
      rejectSuccess,
      rejectFail,
      isDateSort,
      isBudgetSort,
      isFilter,
      isNegotiationStatusChanged,
      serviceList,
      servicesLoaded,
      isLastPage,
    ];
  }

  TaskState copyWith({
    TheStates? theState,
    MyTaskRes? myTaskRes,
    es.TaskEntityServiceModel? taskEntityServiceModel,
    List<TaskEntityService>? taskEntityServices,
    TaskEntityService? taskModel,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
    TaskApplyCountModel? taskApplyCountModel,
    ApplicantModel? applicantModel,
    bool? applyTaskFail,
    bool? applyTaskSuccess,
    bool? approveSuccess,
    bool? approveFail,
    bool? rejectSuccess,
    bool? rejectFail,
    bool? isDateSort,
    bool? isBudgetSort,
    bool? isFilter,
    bool? isNegotiationStatusChanged,
    List<ServiceList>? serviceList,
    bool? servicesLoaded,
    bool? isLastPage,
  }) {
    return TaskState(
      theState: theState ?? this.theState,
      myTaskRes: myTaskRes ?? this.myTaskRes,
      taskEntityServiceModel:
          taskEntityServiceModel ?? this.taskEntityServiceModel,
      taskEntityServices: taskEntityServices ?? this.taskEntityServices,
      taskModel: taskModel ?? this.taskModel,
      selfCreatedTaskServiceModel:
          selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
      taskApplyCountModel: taskApplyCountModel ?? this.taskApplyCountModel,
      applicantModel: applicantModel ?? this.applicantModel,
      applyTaskFail: applyTaskFail ?? this.applyTaskFail,
      applyTaskSuccess: applyTaskSuccess ?? this.applyTaskSuccess,
      approveSuccess: approveSuccess ?? this.approveSuccess,
      approveFail: approveFail ?? this.approveFail,
      rejectSuccess: rejectSuccess ?? this.rejectSuccess,
      rejectFail: rejectFail ?? this.rejectFail,
      isDateSort: isDateSort ?? this.isDateSort,
      isBudgetSort: isBudgetSort ?? this.isBudgetSort,
      isFilter: isFilter ?? this.isFilter,
      isNegotiationStatusChanged:
          isNegotiationStatusChanged ?? this.isNegotiationStatusChanged,
      serviceList: serviceList ?? this.serviceList,
      servicesLoaded: servicesLoaded ?? this.servicesLoaded,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}
