part of 'activities_timeline_bloc.dart';

@immutable
abstract class ActivitiesTimelineEvent extends Equatable {
  const ActivitiesTimelineEvent();
}

class ActivitiesLoaded extends ActivitiesTimelineEvent {
  @override
  List<Object?> get props => [];
}
