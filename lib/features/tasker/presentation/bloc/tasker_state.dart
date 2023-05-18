part of 'tasker_bloc.dart';

enum TaskerStatus { initial, success, failure }

class TaskerState extends Equatable {
  const TaskerState({
    this.status = TaskerStatus.initial,
    this.tasker = const <Tasker>[],
    this.hasReachedMax = false,
    this.taskerListRes = const TaskerListRes(),
    this.taskerReviewsResponse = const TaskerReviewResponse(),
    this.singleTasker = const Tasker(),
    this.service = const TaskEntityServiceModel(),
    this.task = const TaskEntityServiceModel(),
  });

  final TaskerStatus status;
  final List<Tasker> tasker;
  final bool hasReachedMax;
  final TaskerListRes taskerListRes;
  final TaskerReviewResponse taskerReviewsResponse;
  final Tasker singleTasker;
  final TaskEntityServiceModel service;
  final TaskEntityServiceModel task;

  TaskerState copyWith({
    TaskerStatus? status,
    List<Tasker>? tasker,
    bool? hasReachedMax,
    TaskerListRes? taskerListRes,
    TaskerReviewResponse? taskerReviewsResponse,
    Tasker? singleTasker,
    TaskEntityServiceModel? service,
    TaskEntityServiceModel? task,
  }) {
    return TaskerState(
      status: status ?? this.status,
      tasker: tasker ?? this.tasker,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      taskerListRes: taskerListRes ?? this.taskerListRes,
      taskerReviewsResponse:
          taskerReviewsResponse ?? this.taskerReviewsResponse,
      singleTasker: singleTasker ?? this.singleTasker,
      service: service ?? this.service,
      task: task ?? this.task,
    );
  }

  @override
  String toString() {
    return '''TaskerState { status: $status, hasReachedMax: $hasReachedMax, tasker: ${tasker.length}  }''';
  }

  @override
  List<Object> get props {
    return [
      status,
      tasker,
      hasReachedMax,
      taskerListRes,
      taskerReviewsResponse,
      singleTasker,
      service,
      task,
    ];
  }
}
