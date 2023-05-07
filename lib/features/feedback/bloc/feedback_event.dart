import 'package:dependencies/dependencies.dart';

abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();
}

class FeedbackLoaded extends FeedbackEvent {
  @override
  List<Object?> get props => [];
}
