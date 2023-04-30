part of 'tasker_bloc.dart';

abstract class TaskerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskerFetched extends TaskerEvent {}

class SetInitial extends TaskerEvent {}
