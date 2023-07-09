// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasker_bloc.dart';

abstract class TaskerEvent extends Equatable {}

class TaskerFetched extends TaskerEvent {
  final String? searchQuery;
  final bool newFetch;
  TaskerFetched({
    this.searchQuery,
    this.newFetch = false,
  });

  @override
  List<Object?> get props => [searchQuery, newFetch];
}

class SetInitial extends TaskerEvent {
  @override
  List<Object?> get props => [];
}
