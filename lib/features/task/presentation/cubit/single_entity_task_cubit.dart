import 'package:bloc/bloc.dart';
import 'package:cipher/features/task/data/models/task_model.dart';
import 'package:cipher/features/task/data/repositories/task_repositories.dart';
import 'package:equatable/equatable.dart';

part 'single_entity_task_state.dart';

class SingleEntityTaskCubit extends Cubit<SingleEntityTaskState> {
  final repo = TaskRepositories();
  SingleEntityTaskCubit() : super(SingleEntityTaskInitial());

  Future fetchSingleEntityTask(
    String id,
  ) async {
    try {
      await repo.fetchSingleTask(id: id).then(
        (value) {
          TaskModel.fromJson(
            value as Map<String, dynamic>,
          );
          emit(
            SingleEntityTaskLoadSuccess(
              taskModel: TaskModel.fromJson(
                value,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        SingleEntityTaskLoadFailure(),
      );
    }
  }
}
