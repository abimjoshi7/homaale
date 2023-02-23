// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskAddSuccess extends TaskState {
  final PostTaskRes res;
  const TaskAddSuccess({
    required this.res,
  });
  @override
  List<Object?> get props => [
        res,
      ];
}

class TaskAddFailure extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskLoadSuccess extends TaskState {
  final MyTaskRes res;
  const TaskLoadSuccess({
    required this.res,
  });
  @override
  List<Object?> get props => [
        res,
      ];
}

class TaskLoadFailure extends TaskState {
  @override
  List<Object?> get props => [];
}
