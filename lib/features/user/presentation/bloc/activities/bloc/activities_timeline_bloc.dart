import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/data/models/user_activities_timeline.dart';
import 'package:cipher/features/user/data/repositories/user_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'activities_timeline_event.dart';
part 'activities_timeline_state.dart';

class ActivitiesTimelineBloc
    extends Bloc<ActivitiesTimelineEvent, ActivitiesTimelineState> {
  final respositories = UserRepositories();

  ActivitiesTimelineBloc() : super(const ActivitiesTimelineState()) {
    on<ActivitiesLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await respositories.userActivitiesTimeline().then(
            (value) {
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  activitiesTimeline: UserActivitiesTimeline.fromJson(
                    value,
                  ),
                ),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
          );
        }
      },
    );
  }
}
