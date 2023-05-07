import 'package:cipher/features/feedback/bloc/feedback_post_state.dart';
import 'package:cipher/features/feedback/data/repository/feedback_repository.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';
import '../data/models/feedback_post_model.dart';
import 'feedback_post_event.dart';

class FeedbackPostBloc extends Bloc<FeedbackPostEvent, FeedbackPostState> {
  final repositories = FeedbackRepository();

  FeedbackPostBloc() : super(FeedbackPostState()) {
    on<FeedbackPost>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.PostFeedback(event.subject, event.description).then(
          (value) => emit(
            state.copyWith(
              theState: TheStates.success,
              feedbackPostModel: FeedbackPostModel.fromJson(value),
            ),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
  }
}
