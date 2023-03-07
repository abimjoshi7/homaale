import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/services/data/models/entity_service.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/features/tasker/data/repositories/tasker_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'tasker_state.dart';

class TaskerCubit extends Cubit<TaskerState> {
  final repo = TaskerRepositories();
  TaskerCubit() : super(const TaskerState());

  Future loadTaskerList() async {
    try {
      emit(state.copyWith(states: TheStates.initial));
      await repo.fetchAllTaskers().then(
            (value) => emit(
              state.copyWith(
                states: TheStates.success,
                taskerListRes: TaskerListRes.fromJson(value),
              ),
            ),
          );
    } catch (e) {
      emit(state.copyWith(states: TheStates.failure));
    }
  }

  Future loadSingleTasker(
    String id,
  ) async {
    try {
      emit(state.copyWith(states: TheStates.initial));

      await repo
          .fetchSingleTasker(
        id: id,
      )
          .then(
        (tasker) async {
          await repo
              .getSingleTaskerTask(
            createdBy: id,
          )
              .then(
            (task) {
              emit(
                state.copyWith(
                  states: TheStates.success,
                  tasker: Tasker.fromJson(tasker),
                  entityService: EntityServiceModel.fromJson(task),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(states: TheStates.failure));
    }
  }
}
