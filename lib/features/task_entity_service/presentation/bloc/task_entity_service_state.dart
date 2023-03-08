part of 'task_entity_service_bloc.dart';

abstract class TaskEntityServiceState extends Equatable {
  const TaskEntityServiceState();  

  @override
  List<Object> get props => [];
}
class TaskEntityServiceInitial extends TaskEntityServiceState {}
