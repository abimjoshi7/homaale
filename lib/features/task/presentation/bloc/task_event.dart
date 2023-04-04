// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final int? page;
  final String? order;
  final bool? isDateSort;
  final bool? isBudgetSort;

  const AllTaskLoadInitiated({
    this.page,
    this.order,
    this.isDateSort,
    this.isBudgetSort,
  });
  @override
  List<Object?> get props => [
        page,
        order,
        isDateSort,
        isBudgetSort,
      ];
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

class TaskApprovePeople extends TaskEvent {
  final ApproveReq approveReq;

  const TaskApprovePeople({required this.approveReq});

  @override
  List<Object?> get props => [approveReq];
}

class TaskRejectPeople extends TaskEvent {
  final RejectReq rejectReq;

  const TaskRejectPeople({required this.rejectReq});

  @override
  List<Object?> get props => [rejectReq];
}

class ResetRejectSuccessStatus extends TaskEvent {
  const ResetRejectSuccessStatus();

  @override
  List<Object?> get props => [];
}

class ResetRejectFailureStatus extends TaskEvent {
  const ResetRejectFailureStatus();

  @override
  List<Object?> get props => [];
}

class ResetApproveSuccessStatus extends TaskEvent {
  const ResetApproveSuccessStatus();

  @override
  List<Object?> get props => [];
}

class ResetApproveFailureStatus extends TaskEvent {
  const ResetApproveFailureStatus();

  @override
  List<Object?> get props => [];
}

class TaskBookInitiated extends TaskEvent {
  const TaskBookInitiated();
  @override
  List<Object?> get props => [];
}
