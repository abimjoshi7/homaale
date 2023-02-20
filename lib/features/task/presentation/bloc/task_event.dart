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
