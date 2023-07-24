part of 'follow_follower_bloc.dart';

abstract class FollowFollowerEvent extends Equatable {
  const FollowFollowerEvent();

  @override
  List<Object> get props => [];
}

class FetchFollowerEvent extends FollowFollowerEvent {}

class FetchFollowingEvent extends FollowFollowerEvent {}

class HandleUnfollowEvent extends FollowFollowerEvent {
  final String id;

  HandleUnfollowEvent(this.id);
}
