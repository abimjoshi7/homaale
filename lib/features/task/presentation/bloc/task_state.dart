part of 'task_bloc.dart';

class TaskState extends Equatable {
  final TheStates? theState;
  final PostTaskRes? postTaskRes;
  final MyTaskRes? myTaskRes;
  final AllTaskList? allTaskList;
  final es.EntityServiceModel? tasksList;
  final SingleTaskEntityService? taskModel;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  final TaskApplyCountModel? taskApplyCountModel;
  final ApplicantModel? applicantModel;
  final bool applyTaskFail;
  final bool applyTaskSuccess;
  final bool? approveSuccess;
  final bool? approveFail;
  final bool? rejectSuccess;
  final bool? rejectFail;

  const TaskState({
    this.theState = TheStates.initial,
    this.postTaskRes,
    this.myTaskRes,
    this.allTaskList,
    this.tasksList,
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
  });

  @override
  List<Object?> get props {
    return [
      theState,
      postTaskRes,
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
    ];
  }

  TaskState copyWith({
    TheStates? theState,
    PostTaskRes? postTaskRes,
    MyTaskRes? myTaskRes,
    AllTaskList? allTaskList,
    es.EntityServiceModel? tasksList,
    SingleTaskEntityService? taskModel,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
    TaskApplyCountModel? taskApplyCountModel,
    ApplicantModel? applicantModel,
    bool? applyTaskFail,
    bool? applyTaskSuccess,
    bool? approveSuccess,
    bool? approveFail,
    bool? rejectSuccess,
    bool? rejectFail,
  }) {
    return TaskState(
      theState: theState ?? this.theState,
      postTaskRes: postTaskRes ?? this.postTaskRes,
      myTaskRes: myTaskRes ?? this.myTaskRes,
      allTaskList: allTaskList ?? this.allTaskList,
      tasksList: tasksList ?? this.tasksList,
      taskModel: taskModel ?? this.taskModel,
      selfCreatedTaskServiceModel: selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
      taskApplyCountModel: taskApplyCountModel ?? this.taskApplyCountModel,
      applicantModel: applicantModel ?? this.applicantModel,
      applyTaskFail: applyTaskFail ?? this.applyTaskFail,
      applyTaskSuccess: applyTaskSuccess ?? this.applyTaskSuccess,
      approveSuccess: approveSuccess ?? this.approveSuccess,
      approveFail: approveFail ?? this.approveFail,
      rejectSuccess: rejectSuccess ?? this.rejectSuccess,
      rejectFail: rejectFail ?? this.rejectFail,
    );
  }
}
