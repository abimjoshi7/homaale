part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class MyServiceTaskLoadInitiated extends TaskEvent {
  final bool isTask;
  const MyServiceTaskLoadInitiated({
    required this.isTask,
  });
  @override
  List<Object?> get props => [
        isTask,
      ];
}

class SingleEntityTaskLoadInitiated extends TaskEvent {
  final String id;
  const SingleEntityTaskLoadInitiated({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}

class AllTaskLoadInitiated extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class TaskAddInitiated extends TaskEvent {
  final PostTaskReq req;
  const TaskAddInitiated({
    required this.req,
  });
  @override
  List<Object?> get props => [
        req,
      ];
}

class SelectedTask extends TaskEvent {
  final es.EntityService? entityService;
  const SelectedTask({
    this.entityService,
  });
  @override
  List<Object?> get props => [
        entityService,
      ];
}

class TaskBook extends TaskEvent {
  final ApplyTaskReq req;
  const TaskBook({
    required this.req,
  });
  @override
  List<Object?> get props => [
        req,
      ];
}

class TaskBookInitiated extends TaskEvent {
  const TaskBookInitiated();
  @override
  List<Object?> get props => [];
}
