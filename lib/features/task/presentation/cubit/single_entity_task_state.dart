// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'single_entity_task_cubit.dart';

abstract class SingleEntityTaskState extends Equatable {
  const SingleEntityTaskState();
}

class SingleEntityTaskInitial extends SingleEntityTaskState {
  @override
  List<Object?> get props => [];
}

class SingleEntityTaskLoadSuccess extends SingleEntityTaskState {
  final TaskModel taskModel;
  const SingleEntityTaskLoadSuccess({
    required this.taskModel,
  });

  @override
  List<Object?> get props => [
        taskModel,
      ];
}

class SingleEntityTaskLoadFailure extends SingleEntityTaskState {
  @override
  List<Object?> get props => [];
}
