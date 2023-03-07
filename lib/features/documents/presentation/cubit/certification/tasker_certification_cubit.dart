import 'package:cipher/features/documents/models/tasker_certification_req.dart';
import 'package:cipher/features/documents/repositories/document_repositories.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:dependencies/dependencies.dart';

part 'tasker_certification_state.dart';

class TaskerCertificationCubit extends Cubit<TaskerCertificationState> {
  final repositories = DocumentRepositories();
  TaskerCertificationCubit() : super(TaskerCertificationInitial());

  Future<void> addTaskerCertification(
    TaskerCertificateReq taskerCertificationReq,
  ) async {
    try {
      emit(
        TaskerCertificationInitial(),
      );
      final x = await repositories.addCertification(
        taskerCertificationReq,
      );
      if (x['status'] == 'success') emit(TaskerCertificationSuccess());
    } catch (e) {
      emit(TaskerCertificationFailure());
    }
  }

  Future<void> getSingleTaskerCertification(int id) async {
    try {
      emit(
        TaskerCertificationInitial(),
      );

      final result = await repositories.retreiveCertification(id);

      if (result.isNotEmpty) {
        emit(
          TaskerRetrieveCertificationSuccess(
            taskerCertificationRes: Certificate.fromJson(result),
          ),
        );
      }
    } catch (e) {
      emit(TaskerRetrieveCertificationFailure());
    }
  }

  Future<void> getTaskerCertification() async {
    try {
      emit(
        TaskerCertificationInitial(),
      );
      final result = await repositories.fetchCertification();
      final certificationList = result['result']
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList();

      if (result.isNotEmpty) {
        emit(
          TaskerGetCertificationSuccess(
            taskerCertificationRes:
                List<Certificate>.from(certificationList as Iterable),
          ),
        );
      }
    } catch (e) {
      emit(TaskerGetCertificationFailure());
    }
  }

  Future<void> editTaskerCertification(
    TaskerCertificateReq taskerCertificationReq,
    int id,
  ) async {
    try {
      emit(
        TaskerCertificationInitial(),
      );

      final x = await repositories.editCertificate(taskerCertificationReq, id);
      if (x['status'] == 'success') emit(TaskerEditCertificationSuccess());
    } catch (e) {
      emit(TaskerEditCertificationFailure());
    }
  }

  Future<void> deleteTaskerCertification(int id) async {
    try {
      emit(
        TaskerCertificationInitial(),
      );

      await repositories
          .deleteCertificate(id)
          .whenComplete(
            () => emit(
              TaskerDeleteCertificationSuccess(),
            ),
          )
          .then((value) async => getTaskerCertification());
    } catch (e) {
      emit(TaskerDeleteCertificationFailure());
    }
  }
}
