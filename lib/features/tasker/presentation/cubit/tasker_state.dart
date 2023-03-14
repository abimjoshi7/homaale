part of 'tasker_cubit.dart';

class TaskerState extends Equatable {
  final TheStates? states;
  final TaskerListRes? taskerListRes;
  final TaskerReviewResponse? taskerReviewsResponse;
  final Tasker? tasker;
  final EntityServiceModel? service;
  final EntityServiceModel? task;

  const TaskerState({
    this.states = TheStates.initial,
    this.taskerListRes,
    this.taskerReviewsResponse,
    this.tasker,
    this.service,
    this.task,
  });

  TaskerState copyWith({
    TheStates? states,
    TaskerListRes? taskerListRes,
    TaskerReviewResponse? taskerReviewsResponse,
    Tasker? tasker,
    EntityServiceModel? service,
    EntityServiceModel? task,
  }) {
    return TaskerState(
      states: states ?? this.states,
      taskerListRes: taskerListRes ?? this.taskerListRes,
      taskerReviewsResponse:
          taskerReviewsResponse ?? this.taskerReviewsResponse,
      tasker: tasker ?? this.tasker,
      service: service ?? this.service,
      task: task ?? this.task,
    );
  }

  @override
  List<Object?> get props {
    return [
      states,
      taskerListRes,
      taskerReviewsResponse,
      tasker,
      service,
      task,
    ];
  }
}
