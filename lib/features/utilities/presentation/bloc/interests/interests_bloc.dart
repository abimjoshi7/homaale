import 'package:bloc/bloc.dart';
import 'package:cipher/features/account_settings/data/models/task_category_list_res.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:equatable/equatable.dart';

part 'interests_event.dart';
part 'interests_state.dart';

class InterestsBloc extends Bloc<InterestsEvent, InterestsState> {
  final _repositories = UtilitiesRepositories();
  InterestsBloc() : super(InterestsLoading()) {
    on<InterestLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            InterestsLoading(),
          );

          await _repositories.getInterestList().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  InterestsLoadSuccess(
                    taskCategoryListRes: List<TaskCategoryListRes>.from(
                      value
                          .map((e) => TaskCategoryListRes.fromJson(e))
                          .toList(),
                    ),
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            InterestsLoadFailure(),
          );
        }
      },
    );
  }
}
