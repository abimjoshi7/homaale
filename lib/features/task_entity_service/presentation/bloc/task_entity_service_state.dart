// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_entity_service_bloc.dart';

class TaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final TaskEntityService? taskEntityService;
  const TaskEntityServiceState({
    this.theStates,
    this.taskEntityService,
  });

  TaskEntityServiceState copyWith({
    TheStates? theStates,
    TaskEntityService? taskEntityService,
  }) {
    return TaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      taskEntityService: taskEntityService ?? this.taskEntityService,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        taskEntityService,
      ];
}
