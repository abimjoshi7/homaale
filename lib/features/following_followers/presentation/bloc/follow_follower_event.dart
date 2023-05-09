part of 'follow_follower_bloc.dart';

abstract class FollowFollwerEvent extends Equatable {
  const FollowFollwerEvent();

  @override
  List<Object> get props => [];
}

class FetchFollowerEvent extends FollowFollwerEvent {}

class FetchFollowingEvent extends FollowFollwerEvent {}

class HandleUnfollowEvent extends FollowFollwerEvent {
  final String id;

  HandleUnfollowEvent(this.id);
}
