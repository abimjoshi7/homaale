import 'package:cipher/features/task/data/models/all_task_list.dart';
import 'package:cipher/features/task/data/models/my_task_res.dart';
import 'package:cipher/features/task/data/models/post_task_req.dart';
import 'package:cipher/features/task/data/models/post_task_res.dart';
import 'package:cipher/features/task/data/repositories/task_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final repo = TaskRepositories();

  TaskBloc()
      : super(
          TaskInitial(),
        ) {
    on<TaskAddInitiated>(
      (event, emit) async {
        try {
          emit(
            TaskInitial(),
          );
          await repo
              .postTask(
                event.req,
              )
              .then(
                (value) => emit(
                  TaskAddSuccess(
                    res: PostTaskRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            TaskAddFailure(),
          );
        }
      },
    );

    on<MyTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            TaskInitial(),
          );
          await repo.fetchMyCreatedTask().then(
                (value) => emit(
                  TaskLoadSuccess(
                    res: MyTaskRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            TaskLoadFailure(),
          );
        }
      },
    );
  }
}
