import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/features/following_followers/data/models/following_followers_response_dto.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/features/following_followers/data/repositories/follow_follower_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'follow_follower_event.dart';
part 'follow_follower_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class FollowFollowerBloc extends Bloc<FollowFollwerEvent, FollowFollowerState> {
  final FollowFollowersRepositroy followFollowersRepositroy;

  FollowFollowerBloc({required this.followFollowersRepositroy}) : super(FollowFollowerState()) {
    on<FetchFollowerEvent>(
      transformer: throttleDroppable(throttleDuration),
      (event, emit) async {
        if (state.followersHasReachedMax) return;
        try {
          if (state.followFollowerStatus == FollowFollowerStatus.initial) {
            final follower = await followFollowersRepositroy.fetchFollowFollowing(true);

            final followerList = follower.result;
            return emit(state.copyWith(
              followFollowerStatus: FollowFollowerStatus.success,
              followersResponseDto: follower,
              followerList: followerList,
              followersHasReachedMax: followerList!.length > 10 ? false : true,
            ));
          }

          if (state.followersResponseDto.current != state.followersResponseDto.totalPages) {
            final follower =
                await followFollowersRepositroy.fetchFollowFollowing(true, state.followersResponseDto.current! + 1);
            emit(follower.result!.isEmpty
                ? state.copyWith(followersHasReachedMax: true)
                : state.copyWith(
                    followFollowerStatus: FollowFollowerStatus.success,
                    followersResponseDto: follower,
                    followerList: List.of(state.followerList)..addAll(follower.result!),
                    followersHasReachedMax: false,
                  ));
          } else {
            emit(state.copyWith(followersHasReachedMax: true));
          }
        } catch (_) {
          emit(state.copyWith(followFollowerStatus: FollowFollowerStatus.failure));
        }
      },
    );

    on<FetchFollowingEvent>(
      transformer: throttleDroppable(throttleDuration),
      (event, emit) async {
        if (state.followingHasReachedMax) return;
        try {
          if (state.followFollowerStatus == FollowFollowerStatus.initial) {
            final following = await followFollowersRepositroy.fetchFollowFollowing(false);

            final followingList = following.result;
            return emit(state.copyWith(
              followFollowerStatus: FollowFollowerStatus.success,
              followingResponseDto: following,
              followingList: followingList,
              followingHasReachedMax: followingList!.length > 10 ? false : true,
            ));
          }

          if (state.followingResponseDto.current != state.followingResponseDto.totalPages) {
            final following =
                await followFollowersRepositroy.fetchFollowFollowing(false, state.followingResponseDto.current! + 1);
            emit(following.result!.isEmpty
                ? state.copyWith(followingHasReachedMax: true)
                : state.copyWith(
                    followFollowerStatus: FollowFollowerStatus.success,
                    followingResponseDto: following,
                    followingList: List.of(state.followingList)..addAll(following.result!),
                    followingHasReachedMax: false,
                  ));
          } else {
            emit(state.copyWith(followingHasReachedMax: true));
          }
        } catch (_) {
          emit(state.copyWith(followFollowerStatus: FollowFollowerStatus.failure));
        }
      },
    );

    on<HandleUnfollowEvent>((event, emit) async {
      try {
        emit(state.copyWith(followFollowerStatus: FollowFollowerStatus.initial));
        final result = await followFollowersRepositroy.handleFollowUnFollow(id: event.id, follow: false);
        if (result['status'] == 'success') {
          add(FetchFollowingEvent());
        }
      } catch (e) {
        log('unfollow error : $e');
        emit(state.copyWith(followFollowerStatus: FollowFollowerStatus.failure));
      }
    });
  }
}
