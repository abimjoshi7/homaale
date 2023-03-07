import 'package:cipher/features/services/data/models/entity_service.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/features/tasker/data/repositories/tasker_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'tasker_state.dart';

class TaskerCubit extends Cubit<TaskerState> {
  final repo = TaskerRepositories();
  TaskerCubit()
      : super(
          TaskerInitial(),
        );

  Future loadTaskerList() async {
    try {
      emit(
        TaskerInitial(),
      );
      await repo.fetchAllTaskers().then(
            (value) => emit(
              TaskerAllLoadSuccess(
                taskerListRes: TaskerListRes.fromJson(
                  value,
                ),
              ),
            ),
          );
    } catch (e) {
      emit(
        TaskerAllLoadFailure(),
      );
    }
  }

  Future loadSingleTasker(
    String id,
  ) async {
    try {
      emit(
        TaskerInitial(),
      );
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
                TaskerSingleLoadSuccess(
                  tasker: Tasker.fromJson(tasker),
                  entityService: EntityServiceModel.fromJson(task),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      emit(
        TaskerSingleLoadFailure(),
      );
    }
  }
}
