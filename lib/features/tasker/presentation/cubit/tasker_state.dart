part of 'tasker_cubit.dart';

abstract class TaskerState extends Equatable {
  const TaskerState();
}

class TaskerInitial extends TaskerState {
  @override
  List<Object?> get props => [];
}

class TaskerAllLoadSuccess extends TaskerState {
  final TaskerListRes taskerListRes;
  const TaskerAllLoadSuccess({
    required this.taskerListRes,
  });
  @override
  List<Object?> get props => [
        taskerListRes,
      ];
}

class TaskerAllLoadFailure extends TaskerState {
  @override
  List<Object?> get props => [];
}

class TaskerSingleLoadSuccess extends TaskerState {
  final Tasker tasker;
  const TaskerSingleLoadSuccess({
    required this.tasker,
  });
  @override
  List<Object?> get props => [
        tasker,
      ];
}

class TaskerSingleLoadFailure extends TaskerState {
  @override
  List<Object?> get props => [];
}
