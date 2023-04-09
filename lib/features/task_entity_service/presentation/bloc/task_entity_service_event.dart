// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class TaskEntityServiceCreated extends TaskEntityServiceEvent {
  final TaskEntityServiceReq req;
  TaskEntityServiceCreated({
    required this.req,
  });

  @override
  List<Object?> get props => [
        req,
      ];
}

class TaskRejectPeople extends TaskEntityServiceEvent {
  final RejectReq rejectReq;

  const TaskRejectPeople({required this.rejectReq});

  @override
  List<Object?> get props => [rejectReq];
}

class ResetRejectSuccessStatus extends TaskEntityServiceEvent {
  const ResetRejectSuccessStatus();

  @override
  List<Object?> get props => [];
}

class ResetRejectFailureStatus extends TaskEntityServiceEvent {
  const ResetRejectFailureStatus();

  @override
  List<Object?> get props => [];
}
