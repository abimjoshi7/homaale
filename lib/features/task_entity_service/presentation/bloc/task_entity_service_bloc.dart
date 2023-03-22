import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:cipher/features/task_entity_service/data/models/req/applicant_model.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'task_entity_service_event.dart';
part 'task_entity_service_state.dart';

class TaskEntityServiceBloc extends Bloc<TaskEntityServiceEvent, TaskEntityServiceState> {
  final repo = TaskEntityServiceRepository();
  final servicesRepo = ServicesRepositories();
  TaskEntityServiceBloc() : super(const TaskEntityServiceState()) {
    on<TaskEntityServiceRetrieveInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
            ),
          );
          await repo
              .retrieveSingleTaskEntityService(
            serviceId: event.id,
          )
              .then(
            (value) async {
              await servicesRepo
                  .fetchApplicants(
                    id: event.id,
                  )
                  .then(
                    (applicants) => emit(
                      state.copyWith(
                        theStates: TheStates.success,
                        taskEntityService: TaskEntityService.fromJson(value),
                        applicantModel: ApplicantModel.fromJson(applicants),
                      ),
                    ),
                  );
            },
          );
        } catch (e) {
          print(e);
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
