import 'package:cipher/features/feedback/data/models/feedback_post_model.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';

class FeedbackPostState extends Equatable {
  final TheStates? theState;
  final FeedbackPostModel? feedbackPostModel;

  const FeedbackPostState({
    this.theState,
    this.feedbackPostModel,
  });

  FeedbackPostState copyWith({
    TheStates? theState,
    FeedbackPostModel? feedbackPostModel,
  }) {
    return FeedbackPostState(
      theState: theState ?? this.theState,
      feedbackPostModel: feedbackPostModel ?? this.feedbackPostModel,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      feedbackPostModel,
    ];
  }
}
