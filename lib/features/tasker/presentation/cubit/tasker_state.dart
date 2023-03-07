part of 'tasker_cubit.dart';

// abstract class TaskerState extends Equatable {
//   const TaskerState();
// }

// class TaskerInitial extends TaskerState {
//   @override
//   List<Object?> get props => [];
// }

// class TaskerAllLoadSuccess extends TaskerState {
//   final TaskerListRes taskerListRes;
//   const TaskerAllLoadSuccess({
//     required this.taskerListRes,
//   });
//   @override
//   List<Object?> get props => [
//         taskerListRes,
//       ];
// }

// class TaskerAllLoadFailure extends TaskerState {
//   @override
//   List<Object?> get props => [];
// }

// class TaskerSingleLoadSuccess extends TaskerState {
//   final Tasker tasker;
//   final EntityServiceModel entityService;

//   const TaskerSingleLoadSuccess({
//     required this.tasker,
//     required this.entityService,
//   });
//   @override
//   List<Object?> get props => [
//         tasker,
//         entityService,
//       ];
// }

// class TaskerSingleLoadFailure extends TaskerState {
//   @override
//   List<Object?> get props => [];
// }

class TaskerState extends Equatable {
  final TheStates? states;
  final TaskerListRes? taskerListRes;
  final TaskerReviewResponse? taskerReviewsResponse;
  final Tasker? tasker;
  final EntityServiceModel? entityService;

  const TaskerState({
    this.states = TheStates.initial,
    this.taskerListRes,
    this.taskerReviewsResponse,
    this.tasker,
    this.entityService,
  });

  TaskerState copyWith({
    TheStates? states,
    TaskerListRes? taskerListRes,
    TaskerReviewResponse? taskerReviewsResponse,
    Tasker? tasker,
    EntityServiceModel? entityService,
  }) {
    return TaskerState(
      states: states ?? this.states,
      taskerListRes: taskerListRes ?? this.taskerListRes,
      taskerReviewsResponse:
          taskerReviewsResponse ?? this.taskerReviewsResponse,
      tasker: tasker ?? this.tasker,
      entityService: entityService ?? this.entityService,
    );
  }

  @override
  List<Object?> get props {
    return [
      states,
      taskerListRes,
      taskerReviewsResponse,
      tasker,
      entityService,
    ];
  }
}
