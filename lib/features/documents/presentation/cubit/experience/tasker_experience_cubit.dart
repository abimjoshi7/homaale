import 'package:cipher/features/documents/models/tasker_experience_req.dart';
import 'package:cipher/features/documents/repositories/document_repositories.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:dependencies/dependencies.dart';

part 'tasker_experience_state.dart';

class TaskerExperienceCubit extends Cubit<TaskerExperienceState> {
  final repositories = DocumentRepositories();
  TaskerExperienceCubit() : super(TaskerExperienceInitial());

  Future<void> addTaskerExperience(
    TaskerExperienceReq taskerExperienceReq,
  ) async {
    try {
      emit(
        TaskerExperienceInitial(),
      );
      final x = await repositories.addExperience(
        taskerExperienceReq,
      );

      if (x['status'] == 'success') emit(TaskerAddExperienceSuccess());
    } catch (e) {
      emit(TaskerAddExperienceFailure());
    }
  }

  Future<void> getSingleTaskerExperience(int id) async {
    try {
      emit(
        TaskerExperienceInitial(),
      );

      final result = await repositories.retreiveExperience(id);

      if (result.isNotEmpty) {
        emit(
          TaskerRetrieveExperienceSuccess(
            taskerExperienceRes: Experience.fromJson(result),
          ),
        );
      }
    } catch (e) {
      emit(TaskerRetrieveExperienceFailure());
    }
  }

  Future<void> getTaskerExperience() async {
    try {
      emit(
        TaskerExperienceInitial(),
      );

      final result = await repositories.fetchExperience();
      final experienceList = result['result']
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList();

      if (result.isNotEmpty) {
        emit(
          TaskerGetExperienceSuccess(
            taskerExperienceRes:
                List<Experience>.from(experienceList as Iterable),
          ),
        );
      }
    } catch (e) {
      emit(TaskerGetExperienceFailure());
    }
  }

  Future<void> editTaskerExperience(
    TaskerExperienceReq taskerExperienceReq,
    int id,
  ) async {
    try {
      emit(
        TaskerExperienceInitial(),
      );

      final x = await repositories.editExperience(taskerExperienceReq, id);
      if (x['status'] == 'success') emit(TaskerEditExperienceSuccess());
      // getTaskerExperience();
    } catch (e) {
      emit(TaskerEditExperienceFailure());
      // getTaskerExperience();
    }
  }

  Future<void> deleteTaskerExperience(int id) async {
    try {
      emit(
        TaskerExperienceInitial(),
      );

      await repositories
          .deleteExperience(id)
          .whenComplete(
            () => emit(
              TaskerDeleteExperienceSuccess(),
            ),
          )
          .then((value) async => getTaskerExperience());
    } catch (e) {
      emit(TaskerDeleteExperienceFailure());
    }
  }
}
