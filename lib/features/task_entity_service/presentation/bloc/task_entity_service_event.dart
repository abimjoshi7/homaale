// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_entity_service_bloc.dart';

abstract class TaskEntityServiceEvent extends Equatable {
  const TaskEntityServiceEvent();
}

class TaskEntityServiceInitiated extends TaskEntityServiceEvent {
  final bool? isTask;
  final int? page;
  final List<String>? order;
  final String? dateSort;
  final String? budgetSort;
  final String? serviceId;
  final String? city;
  final bool? isFilter;
  final String? budgetFrom;
  final String? budgetTo;
  final String? payableFrom;
  final String? payableTo;
  final String? dateFrom;
  final String? dateTo;
  final String? category;
  final String? query;
  final bool newFetch;

  const TaskEntityServiceInitiated({
    this.isTask,
    this.page,
    this.order,
    this.dateSort,
    this.budgetSort,
    this.serviceId,
    this.city,
    this.isFilter,
    this.budgetFrom,
    this.budgetTo,
    this.payableFrom,
    this.payableTo,
    this.dateFrom,
    this.dateTo,
    this.category,
    this.query,
    this.newFetch = false,
  });

  @override
  List<Object?> get props => [
        isTask,
        page,
        order,
        dateSort,
        budgetSort,
        serviceId,
        isFilter,
        city,
        budgetFrom,
        budgetTo,
        payableFrom,
        payableTo,
        dateFrom,
        dateTo,
        category,
        query,
        newFetch,
      ];
}

class MyTESLoadInitiated extends TaskEntityServiceEvent {
  final bool isTask;
  MyTESLoadInitiated({
    required this.isTask,
  });

  @override
  List<Object?> get props => [
        isTask,
      ];
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

class TaskEntityServiceEdited extends TaskEntityServiceEvent {
  final String? id;
  final TaskEntityServiceReq? taskEntityServiceReq;
  const TaskEntityServiceEdited({
    this.id,
    this.taskEntityServiceReq,
  });
  @override
  List<Object?> get props => [
        id,
        taskEntityServiceReq,
      ];
}

class TaskEntityServiceDeleted extends TaskEntityServiceEvent {
  final String id;
  const TaskEntityServiceDeleted({
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

class FetchServicesList extends TaskEntityServiceEvent {
  @override
  List<Object?> get props => [];
}

class ResetFilterSort extends TaskEntityServiceEvent {
  @override
  List<Object?> get props => [];
}

class ResetTESEditStatus extends TaskEntityServiceEvent {
  @override
  List<Object?> get props => [];
}

class FetchRecommendedSimilar extends TaskEntityServiceEvent {
  final String id;
  const FetchRecommendedSimilar({required this.id});
  @override
  List<Object?> get props => [id];
}
