part of 'interests_bloc.dart';

abstract class InterestsEvent extends Equatable {
  const InterestsEvent();
}

class InterestLoadInitiated extends InterestsEvent {
  @override
  List<Object?> get props => [];
}
