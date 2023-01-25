// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_portfolio_cubit.dart';

abstract class TaskerPortfolioState extends Equatable {
  const TaskerPortfolioState();
}

class TaskerPortfolioInitial extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerAddPortfolioSuccess extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerAddPortfolioFailure extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerGetPortfolioSuccess extends TaskerPortfolioState {
  final List<Portfolio> taskerPortfolioRes;
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

class TaskerEditPortfolioSuccess extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerEditPortfolioFailure extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerDeletePortfolioSuccess extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerDeletePortfolioFailure extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}

class TaskerRetrievePortfolioSuccess extends TaskerPortfolioState {
  final Portfolio taskerPortfolioRes;
  const TaskerRetrievePortfolioSuccess({
    required this.taskerPortfolioRes,
  });
  @override
  List<Object?> get props => [taskerPortfolioRes];
}

class TaskerRetrievePortfolioFailure extends TaskerPortfolioState {
  @override
  List<Object?> get props => [];
}
