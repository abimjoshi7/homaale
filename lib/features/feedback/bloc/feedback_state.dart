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

// class FeedbackState extends Equatable {
//   final TheStates? theStates;
//   final Feedback? feedback;
//   const FeedbackState({
//     this.theStates = TheStates.initial,
//     this.feedback,
//   });
//
//   FeedbackState copyWith({
//     TheStates? theStates,
//     Feedback? feedback,
//   }) {
//     return FeedbackState(
//       theStates: theStates ?? this.theStates,
//       feedback: feedback ?? this.feedback,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         theStates,
//         feedback,
//       ];
// }
