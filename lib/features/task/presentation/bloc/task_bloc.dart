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

  TaskBloc() : super(const TaskState()) {
    on<TaskAddInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo
              .postTask(
                event.req,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    postTaskRes: PostTaskRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(theState: TheStates.failure),
          );
        }
      },
    );

    on<MyTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo.fetchMyCreatedTask().then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    myTaskRes: MyTaskRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(theState: TheStates.failure),
          );
        }
      },
    );

    on<AllTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo.fetchAllTaskList().then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    allTaskList: AllTaskList.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(theState: TheStates.failure),
          );
        }
      },
    );

    on<SingleEntityTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theState: TheStates.initial,
            ),
          );
          await repo.fetchSingleTask(id: event.id).then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    taskModel: TaskModel.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theState: TheStates.failure,
            ),
          );
        }
      },
    );
  }
}
