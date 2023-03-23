// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final TheStates? theStates;
  final TaskEntityService? taskEntityService;
  final TaskerProfile? taskProfile;
  SearchState({
    this.theStates,
    this.taskEntityService,
    this.taskProfile,
  });

  SearchState copyWith({
    TheStates? theStates,
    TaskEntityService? taskEntityService,
    TaskerProfile? taskProfile,
  }) {
    return SearchState(
      theStates: theStates ?? this.theStates,
      taskEntityService: taskEntityService ?? this.taskEntityService,
      taskProfile: taskProfile ?? this.taskProfile,
    );
  }

  @override
  List<Object?> get props => [theStates, taskEntityService, taskProfile];
}
