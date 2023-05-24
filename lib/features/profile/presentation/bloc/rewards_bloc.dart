import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/features/profile/data/models/rewards_response_dto.dart';
import 'package:cipher/features/profile/data/repositories/rewards_repositories.dart';
import 'package:dependencies/dependencies.dart';
import 'package:stream_transform/stream_transform.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final repo = RewardsRepositores();

  RewardsBloc() : super(RewardsState()) {
    on<FetchRewardsEvent>((event, emit) async {
      if (state.hasReachedMax) return;
      try {
        if (state.rewardsStatus == RewardsStatus.initial) {
          final reward = await repo.fetchMyRewards();

          final rewardsList = reward.result;
          return emit(state.copyWith(
            rewardsStatus: RewardsStatus.success,
            rewardsResponseDto: reward,
            rewardsList: rewardsList,
            hasReachedMax: state.rewardsResponseDto.current == state.rewardsResponseDto.totalPages,
          ));
        }

        if (state.rewardsResponseDto.current != state.rewardsResponseDto.totalPages) {
          final reward = await repo.fetchMyRewards(state.rewardsResponseDto.current! + 1);
          emit(reward.result!.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  rewardsStatus: RewardsStatus.success,
                  rewardsResponseDto: reward,
                  rewardsList: List.of(state.rewardsList)..addAll(reward.result!),
                  hasReachedMax: false,
                ));
        } else {
          emit(state.copyWith(hasReachedMax: true));
        }
      } catch (_) {
        emit(state.copyWith(rewardsStatus: RewardsStatus.failure));
      }
    }, transformer: throttleDroppable(throttleDuration));
  }
}
