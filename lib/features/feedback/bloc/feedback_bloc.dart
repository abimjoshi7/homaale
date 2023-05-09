
import 'package:dependencies/dependencies.dart';

import '../data/repository/feedback_repository.dart';
import 'feedback_event.dart';
import 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final respositories = FeedbackRepository();
  FeedbackBloc() : super(FeedbackLoading()) {
    on<FeedbackLoaded>(
          (event, emit) async {
        try {
          emit(
            FeedbackLoading(),
          );

          await respositories.fetchFeedback().then(
                (value) {
              if (value.isNotEmpty) {
                emit(
                  FeedbackLoadSuccess(
                    list: value,
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            feedbackLoadFailure(),
          );
        }
      },
    );
  }
}
