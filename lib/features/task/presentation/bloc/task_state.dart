part of 'task_bloc.dart';

class TaskState extends Equatable {
  final TheStates? theState;
  final PostTaskRes? postTaskRes;
  final MyTaskRes? myTaskRes;
  final AllTaskList? allTaskList;
  final EntityServiceModel? tasksList;
  final TaskModel? taskModel;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  const TaskState({
    this.theState = TheStates.initial,
    this.postTaskRes,
    this.myTaskRes,
    this.allTaskList,
    this.tasksList,
    this.taskModel,
    this.selfCreatedTaskServiceModel,
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
    ];
  }

  TaskState copyWith({
    TheStates? theState,
    PostTaskRes? postTaskRes,
    MyTaskRes? myTaskRes,
    AllTaskList? allTaskList,
    EntityServiceModel? tasksList,
    TaskModel? taskModel,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
  }) {
    return TaskState(
      theState: theState ?? this.theState,
      postTaskRes: postTaskRes ?? this.postTaskRes,
      myTaskRes: myTaskRes ?? this.myTaskRes,
      allTaskList: allTaskList ?? this.allTaskList,
      tasksList: tasksList ?? this.tasksList,
      taskModel: taskModel ?? this.taskModel,
      selfCreatedTaskServiceModel:
          selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
    );
  }
}
