part of 'task_entity_service_bloc.dart';

abstract class TaskEntityServiceEvent extends Equatable {
  const TaskEntityServiceEvent();
}

class TaskEntityServiceRetrieveInitiated extends TaskEntityServiceEvent {
  final String id;
  const TaskEntityServiceRetrieveInitiated({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
