// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_portfolio_cubit.dart';

abstract class TaskerPortfolioState extends Equatable {
  const TaskerPortfolioState();
}

class TaskerPortfolioInitial extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerPortfolioSuccess extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerPortfolioFailure extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerGetPortfolioSuccess extends TaskerPortfolioState {
  final Portfolio taskerPortfolioRes;
  const TaskerGetPortfolioSuccess({
    required this.taskerPortfolioRes,
  });
  @override
  List<Object?> get props => [taskerPortfolioRes];
}

class TaskerGetPortfolioFailure extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}
