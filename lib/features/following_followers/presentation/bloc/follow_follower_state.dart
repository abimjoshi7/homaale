part of 'follow_follower_bloc.dart';

enum FollowFollowerStatus { initial, success, failure }

class FollowFollowerState extends Equatable {
  final FollowFollowerStatus followFollowerStatus;
  final FollowingFollowersResponseDto followersResponseDto;
  final FollowingFollowersResponseDto followingResponseDto;
  final List<Result> followerList;
  final List<Result> followingList;
  final bool followersHasReachedMax;
  final bool followingHasReachedMax;

  FollowFollowerState({
    this.followFollowerStatus = FollowFollowerStatus.initial,
    this.followersResponseDto = const FollowingFollowersResponseDto(),
    this.followingResponseDto = const FollowingFollowersResponseDto(),
    this.followerList = const <Result>[],
    this.followingList = const <Result>[],
    this.followersHasReachedMax = false,
    this.followingHasReachedMax = false,
  });

  FollowFollowerState copyWith({
    FollowFollowerStatus? followFollowerStatus,
    FollowingFollowersResponseDto? followersResponseDto,
    FollowingFollowersResponseDto? followingResponseDto,
    List<Result>? followerList,
    List<Result>? followingList,
    bool? followersHasReachedMax,
    bool? followingHasReachedMax,
  }) {
    return FollowFollowerState(
      followFollowerStatus: followFollowerStatus ?? this.followFollowerStatus,
      followersResponseDto: followersResponseDto ?? this.followersResponseDto,
      followingResponseDto: followingResponseDto ?? this.followingResponseDto,
      followerList: followerList ?? this.followerList,
      followingList: followingList ?? this.followingList,
      followersHasReachedMax: followersHasReachedMax ?? this.followersHasReachedMax,
      followingHasReachedMax: followingHasReachedMax ?? this.followingHasReachedMax,
    );
  }

  @override
  List<Object> get props {
    return [
      followFollowerStatus,
      followersResponseDto,
      followingResponseDto,
      followerList,
      followingList,
      followersHasReachedMax,
      followingHasReachedMax,
    ];
  }
}
