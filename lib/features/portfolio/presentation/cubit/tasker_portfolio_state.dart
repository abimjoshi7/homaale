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
