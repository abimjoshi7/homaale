part of 'interests_bloc.dart';

abstract class InterestsState extends Equatable {
  const InterestsState();
}

class InterestsLoading extends InterestsState {
  @override
  List<Object?> get props => [];
}

class InterestsLoadSuccess extends InterestsState {
  final List<TaskCategoryListRes> taskCategoryListRes;
  const InterestsLoadSuccess({
    required this.taskCategoryListRes,
  });
  @override
  List<Object?> get props => [taskCategoryListRes];
}

class InterestsLoadFailure extends InterestsState {
  @override
  List<Object?> get props => [];
}
