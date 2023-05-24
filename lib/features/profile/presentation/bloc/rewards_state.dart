part of 'rewards_bloc.dart';

enum RewardsStatus { initial, loading, success, failure }

class RewardsState extends Equatable {
  final RewardsStatus rewardsStatus;
  final bool hasReachedMax;
  final RewardsResponseDto rewardsResponseDto;
  final List<Rewards> rewardsList;

  RewardsState({
    this.rewardsStatus = RewardsStatus.initial,
    this.hasReachedMax = false,
    this.rewardsResponseDto = const RewardsResponseDto(),
    this.rewardsList = const <Rewards>[],
  });

  @override
  List<Object> get props => [rewardsStatus, hasReachedMax, rewardsResponseDto, rewardsList];

  RewardsState copyWith({
    RewardsStatus? rewardsStatus,
    bool? hasReachedMax,
    RewardsResponseDto? rewardsResponseDto,
    List<Rewards>? rewardsList,
  }) {
    return RewardsState(
      rewardsStatus: rewardsStatus ?? this.rewardsStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      rewardsResponseDto: rewardsResponseDto ?? this.rewardsResponseDto,
      rewardsList: rewardsList ?? this.rewardsList,
    );
  }
}
