part of 'rewards_bloc.dart';

abstract class RewardsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchRewardsEvent extends RewardsEvent {}
