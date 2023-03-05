part of 'task_bloc.dart';

class TaskState extends Equatable {
  final TheStates? theState;
  final PostTaskRes? postTaskRes;
  final MyTaskRes? myTaskRes;
  final AllTaskList? allTaskList;
  final TaskModel? taskModel;
  const TaskState({
    this.theState = TheStates.initial,
    this.postTaskRes,
    this.myTaskRes,
    this.allTaskList,
    this.taskModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      theState,
      postTaskRes,
      myTaskRes,
      allTaskList,
      taskModel,
    ];
  }

  TaskState copyWith({
    TheStates? theState,
    PostTaskRes? postTaskRes,
    MyTaskRes? myTaskRes,
    AllTaskList? allTaskList,
    TaskModel? taskModel,
  }) {
    return TaskState(
      theState: theState ?? this.theState,
      postTaskRes: postTaskRes ?? this.postTaskRes,
      myTaskRes: myTaskRes ?? this.myTaskRes,
      allTaskList: allTaskList ?? this.allTaskList,
      taskModel: taskModel ?? this.taskModel,
    );
  }
}
