// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
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

class MyTaskLoadInitiated extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class AllTaskListLoadInitiated extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class SingleTaskLoadInititated extends TaskEvent {
  final String id;
  const SingleTaskLoadInititated({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}
