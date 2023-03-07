import 'package:cipher/features/documents/models/tasker_education_req.dart';
import 'package:cipher/features/documents/repositories/document_repositories.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:dependencies/dependencies.dart';

part 'tasker_education_state.dart';

class TaskerEducationCubit extends Cubit<TaskerEducationState> {
  final repositories = DocumentRepositories();
  TaskerEducationCubit() : super(TaskerEducationInitial());

  Future<void> getTaskerEducation() async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      final result = await repositories.fetchEducation();
      final educationList = result['result']
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList();

      if (result.isNotEmpty) {
        emit(
          TaskerGetEducationSuccess(
            taskerEducationRes: List<Education>.from(educationList as Iterable),
          ),
        );
      }
    } catch (e) {
      emit(TaskerGetEducationFailure());
    }
  }

  Future<void> getSingleTaskerEducation(int id) async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      final result = await repositories.retreiveEducation(id);

      if (result.isNotEmpty) {
        emit(
          TaskerRetrieveEducationSuccess(
            taskerEducationRes: Education.fromJson(result),
          ),
        );
      }
    } catch (e) {
      emit(TaskerRetrieveEducationFailure());
    }
  }

  Future<void> addTaskerEducation(
    TaskerEducationReq taskerEducationReq,
  ) async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      final x = await repositories.addEducation(taskerEducationReq);
      if (x['status'] == 'success') emit(TaskerAddEducationSuccess());
      getTaskerEducation();
    } catch (e) {
      emit(TaskerAddEducationFailure());
    }
  }

  Future<void> editTaskerEducation(
    TaskerEducationReq taskerEducationReq,
    int id,
  ) async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      final x = await repositories.editEducation(taskerEducationReq, id);
      if (x['status'] == 'success') emit(TaskerEditEducationSuccess());
      // getTaskerEducation();
    } catch (e) {
      emit(TaskerEditEducationFailure());
      // getTaskerEducation();
    }
  }

  Future<void> deleteTaskerEducation(int id) async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      await repositories
          .deleteEducation(id)
          .whenComplete(
            () => emit(
              TaskerDeleteEducationSuccess(),
            ),
          )
          .then((value) async => getTaskerEducation());
    } catch (e) {
      emit(TaskerDeleteEducationFailure());
    }
  }
}
