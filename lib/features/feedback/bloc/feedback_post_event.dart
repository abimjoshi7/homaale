import 'package:dependencies/dependencies.dart';

abstract class FeedbackPostEvent extends Equatable {
  const FeedbackPostEvent();
}

class FeedbackPost extends FeedbackPostEvent {
  final String subject;
  final String description;

  const FeedbackPost({
    required this.subject,
    required this.description,
  });
  @override
  List<Object?> get props => [subject, description];
}
