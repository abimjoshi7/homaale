import 'package:dependencies/dependencies.dart';

abstract class ActivitiesTimelineEvent extends Equatable {
  const ActivitiesTimelineEvent();
}

class ActivitiesLoaded extends ActivitiesTimelineEvent {
  @override
  List<Object?> get props => [];
}
