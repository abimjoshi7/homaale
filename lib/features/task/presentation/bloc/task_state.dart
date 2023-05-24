part of 'task_bloc.dart';

class TaskState extends Equatable {
  final TheStates theState;
  final MyTaskRes? myTaskRes;
  final AllTaskList? allTaskList;
  final es.TaskEntityServiceModel? tasksList;
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
  final List<ServiceList>? serviceList;
  final bool? servicesLoaded;

  const TaskState({
    this.theState = TheStates.initial,
    this.myTaskRes,
    this.allTaskList,
    this.tasksList,
    this.taskModel,
    this.selfCreatedTaskServiceModel,
    this.taskApplyCountModel,
    this.applicantModel,
    this.serviceList,
    this.isFilter = false,
    this.servicesLoaded = false,
    this.applyTaskFail = false,
    this.applyTaskSuccess = false,
    this.approveSuccess = false,
    this.approveFail = false,
    this.rejectSuccess = false,
    this.rejectFail = false,
    this.isDateSort = false,
    this.isBudgetSort = false,
  });

  @override
  List<Object?> get props {
    return [
      theState,
      myTaskRes,
      allTaskList,
      tasksList,
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
      serviceList,
      servicesLoaded,
      isFilter,
    ];
  }

  TaskState copyWith({
    TheStates? theState,
    MyTaskRes? myTaskRes,
    AllTaskList? allTaskList,
    es.TaskEntityServiceModel? tasksList,
    TaskEntityService? taskModel,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
    TaskApplyCountModel? taskApplyCountModel,
    ApplicantModel? applicantModel,
    List<ServiceList>? serviceList,
    bool? applyTaskFail,
    bool? applyTaskSuccess,
    bool? approveSuccess,
    bool? approveFail,
    bool? rejectSuccess,
    bool? rejectFail,
    bool? isDateSort,
    bool? isBudgetSort,
    bool? isFilter,
    bool? servicesLoaded,
  }) {
    return TaskState(
      theState: theState ?? this.theState,
      myTaskRes: myTaskRes ?? this.myTaskRes,
      allTaskList: allTaskList ?? this.allTaskList,
      tasksList: tasksList ?? this.tasksList,
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
      serviceList: serviceList ?? this.serviceList,
      isFilter: isFilter ?? this.isFilter,
      servicesLoaded: servicesLoaded ?? this.servicesLoaded,
    );
  }
}
