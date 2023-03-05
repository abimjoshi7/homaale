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
  final EntityServiceModel entityService;

  const TaskerSingleLoadSuccess({
    required this.tasker,
    required this.entityService,
  });
  @override
  List<Object?> get props => [
        tasker,
        entityService,
      ];
}

class TaskerSingleLoadFailure extends TaskerState {
  @override
  List<Object?> get props => [];
}
