// import 'package:cipher/core/constants/enums.dart';
// import 'package:cipher/features/feedback/bloc/feedback_state.dart';
// import 'package:dependencies/dependencies.dart';
//
// import '../data/models/feedback.dart';
// import '../data/repository/feedback_repository.dart';
// import 'feedback_event.dart';
//
// class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
//   final respositories = FeedbackRepository();
//   FeedbackBloc()
//       : super(
//           const FeedbackState(),
//         ) {
//     on<FeedbackLoaded>(
//       (event, emit) async {
//         try {
//           emit(
//             state.copyWith(
//               theStates: TheStates.loading,
//             ),
//           );
//           await respositories.fetchFeedback().then(
//             (value) {
//               emit(
//                 state.copyWith(
//                   theStates: TheStates.success,
//                   feedback: Feedback.fromJson(
//                     value,
//                   ),
//                 ),
//               );
//             },
//           );
//         } catch (e) {
//           emit(
//             state.copyWith(
//               theStates: TheStates.failure,
//             ),
//           );
//         }
//       },
//     );
//   }
// }
//


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
