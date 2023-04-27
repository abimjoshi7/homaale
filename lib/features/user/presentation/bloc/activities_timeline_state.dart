import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import '../../data/models/user_activities_timeline.dart';

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
