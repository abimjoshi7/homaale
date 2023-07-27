// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasker_portfolio_cubit.dart';

class TaskerPortfolioState extends Equatable {
  final TheStates states;
  final List<Portfolio> taskerPortfolioList;
  final Portfolio taskerPortfolio;
  final bool isAdded;
  final bool isEdited;
  final bool isDeleted;

  const TaskerPortfolioState({
    this.states = TheStates.initial,
    this.taskerPortfolioList = const [],
    this.taskerPortfolio = const Portfolio(),
    this.isAdded = false,
    this.isEdited = false,
    this.isDeleted = false,
  });

  @override
  List<Object> get props {
    return [
      states,
      taskerPortfolioList,
      taskerPortfolio,
      isAdded,
      isEdited,
      isDeleted,
    ];
  }

  TaskerPortfolioState copyWith({
    TheStates? states,
    List<Portfolio>? taskerPortfolioList,
    Portfolio? taskerPortfolio,
    bool? isAdded,
    bool? isEdited,
    bool? isDeleted,
  }) {
    return TaskerPortfolioState(
      states: states ?? this.states,
      taskerPortfolioList: taskerPortfolioList ?? this.taskerPortfolioList,
      taskerPortfolio: taskerPortfolio ?? this.taskerPortfolio,
      isAdded: isAdded ?? this.isAdded,
      isEdited: isEdited ?? this.isEdited,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
