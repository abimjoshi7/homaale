import 'package:dependencies/dependencies.dart';
import '../data/models/feedback.dart';

abstract class FeedbackState extends Equatable {
  const FeedbackState();
}

class FeedbackLoading extends FeedbackState {
  @override
  List<Object?> get props => [];
}

class FeedbackLoadSuccess extends FeedbackState {
  final List<Feedback> list;
  const FeedbackLoadSuccess({
    required this.list,
  });
  @override
  List<Object?> get props => [list];
}

class feedbackLoadFailure extends FeedbackState {
  @override
  List<Object?> get props => [];
}
