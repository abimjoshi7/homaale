part of 'activities_timeline_bloc.dart';

@immutable
class ActivitiesTimelineState extends Equatable {
  final TheStates? theStates;
  final UserActivitiesTimeline? activitiesTimeline;
  const ActivitiesTimelineState({
    this.theStates = TheStates.initial,
    this.activitiesTimeline,
  });

  ActivitiesTimelineState copyWith({
    TheStates? theStates,
    UserActivitiesTimeline? activitiesTimeline,
  }) {
    return ActivitiesTimelineState(
      theStates: theStates ?? this.theStates,
      activitiesTimeline: activitiesTimeline ?? this.activitiesTimeline,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        activitiesTimeline,
      ];
}
