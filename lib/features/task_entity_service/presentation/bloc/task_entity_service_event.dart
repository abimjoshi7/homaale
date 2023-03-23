part of 'task_entity_service_bloc.dart';

abstract class TaskEntityServiceEvent extends Equatable {
  const TaskEntityServiceEvent();
}

class TaskEntityServiceSingleLoaded extends TaskEntityServiceEvent {
  final String id;
  const TaskEntityServiceSingleLoaded({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}

class TaskEntityServiceApprovePeople extends TaskEntityServiceEvent {
  final ApproveReq approveReq;

  const TaskEntityServiceApprovePeople({required this.approveReq});

  @override
  List<Object?> get props => [approveReq];
}

class ResetApproveSuccessStatus extends TaskEntityServiceEvent {
  const ResetApproveSuccessStatus();

  @override
  List<Object?> get props => [];
}

class ResetApproveFailureStatus extends TaskEntityServiceEvent {
  const ResetApproveFailureStatus();

  @override
  List<Object?> get props => [];
}
