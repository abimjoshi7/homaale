// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
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
  final List<String>? order;
  final bool? isDateSort;
  final bool? isBudgetSort;
  final String? serviceId;
  final String? city;
  final bool? isFilter;

  const AllTaskLoadInitiated({
    this.page,
    this.order,
    this.isDateSort,
    this.isBudgetSort,
    this.serviceId,
    this.city,
    this.isFilter,
  });
  @override
  List<Object?> get props => [
        page,
        order,
        isDateSort,
        isBudgetSort,
        serviceId,
        city,
        isFilter,
      ];
}

class SelectedTask extends TaskEvent {
  final TaskEntityService? entityService;
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

class ResetFilterSort extends TaskEvent {
  @override
  // TODO: implement props
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

class FetchServicesList extends TaskEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
