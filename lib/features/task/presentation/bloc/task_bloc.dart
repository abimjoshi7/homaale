import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart' as es;
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:cipher/features/task/data/models/all_task_list.dart';
import 'package:cipher/features/task/data/models/apply_task_req.dart';
import 'package:cipher/features/task/data/models/my_task_res.dart';
import 'package:cipher/features/task/data/models/post_task_req.dart';
import 'package:cipher/features/task/data/models/post_task_res.dart';
import 'package:cipher/features/task/data/models/single_task_entity_service.dart';
import 'package:cipher/features/task/data/models/task_apply_count_model.dart';
import 'package:cipher/features/task/data/repositories/task_repositories.dart';
import 'package:cipher/features/task_entity_service/data/models/req/applicant_model.dart';
import 'package:dependencies/dependencies.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final repo = TaskRepositories();
  final bookingRepo = BookingRepositories();
  final serviceRepo = ServicesRepositories();

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

    on<MyServiceTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo
              .fetchMyCreatedEntityServiceTask(
                isTask: event.isTask,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                      theState: TheStates.success, selfCreatedTaskServiceModel: SelfCreatedTaskService.fromJson(value)),
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
          await repo
              .fetchAllTaskList(page: event.page ?? 1, order: event.order, serviceId: event.serviceId, city: event.city)
              .then(
            (value) {
              final allTaskList = es.EntityServiceModel.fromJson(value);

              emit(
                state.copyWith(
                  theState: TheStates.success,
                  tasksList: allTaskList,
                  isFilter: event.isFilter,
                  isBudgetSort: event.isBudgetSort,
                  isDateSort: event.isDateSort,
                ),
              );
            },
          );
        } catch (e) {
          log("All Task List Fetch Parse error: $e");
          emit(
            state.copyWith(
              theState: TheStates.failure,
              isFilter: false,
              isBudgetSort: false,
              isDateSort: false,
            ),
          );
        }
      },
    );

    on<SingleEntityTaskLoadInitiated>(
      (event, emit) async {
        emit(state.copyWith(theState: TheStates.initial));
        try {
          await repo.fetchSingleTask(id: event.id).then(
            (singleTask) async {
              await repo.singleTaskAppliedCount(id: event.id).then((count) async {
                if (CacheHelper.isLoggedIn) {
                  await repo.fetchApplicants(id: event.id).then((applicants) {
                    emit(
                      state.copyWith(
                        theState: TheStates.success,
                        taskModel: SingleTaskEntityService.fromJson(
                          singleTask,
                        ),
                        taskApplyCountModel: TaskApplyCountModel.fromJson(count),
                        applicantModel: ApplicantModel.fromJson(applicants),
                      ),
                    );
                  });
                } else {
                  emit(
                    state.copyWith(
                      theState: TheStates.success,
                      taskModel: SingleTaskEntityService.fromJson(
                        singleTask,
                      ),
                      taskApplyCountModel: TaskApplyCountModel.fromJson(count),
                    ),
                  );
                }
              });
            },
          );
        } catch (e) {
          emit(state.copyWith(theState: TheStates.failure));
        }
      },
    );

    on<TaskBookInitiated>(
      (event, emit) async {
        emit(
          state.copyWith(applyTaskFail: false, applyTaskSuccess: false),
        );
      },
    );

    on<TaskBook>(
      (event, emit) async {
        try {
          await repo.bookTask(event.req).then(
            (value) {
              emit(
                state.copyWith(
                  applyTaskFail: false,
                  applyTaskSuccess: true,
                ),
              );
            },
          );
        } catch (e) {
          log(e.toString());
          emit(
            state.copyWith(
              applyTaskFail: true,
            ),
          );
        }
      },
    );

    on<TaskApprovePeople>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await bookingRepo.approveBooking(event.approveReq).then(
            (value) {
              log('$value');
              emit(
                state.copyWith(
                  theState: TheStates.success,
                  approveSuccess: true,
                  approveFail: false,
                ),
              );
            },
          );
        } catch (e) {
          print(e);
          emit(state.copyWith(theState: TheStates.success, approveFail: true));
        }
      },
    );

    on<TaskRejectPeople>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await bookingRepo.rejectBooking(event.rejectReq).then(
            (value) {
              log('$value');
              emit(
                state.copyWith(
                  theState: TheStates.success,
                  rejectSuccess: true,
                  rejectFail: false,
                ),
              );
            },
          );
        } catch (e) {
          print(e);
          emit(state.copyWith(theState: TheStates.success, rejectFail: true));
        }
      },
    );

    on<ResetRejectSuccessStatus>(
      (event, emit) {
        emit(state.copyWith(
          theState: TheStates.success,
          rejectSuccess: false,
        ));
      },
    );
    on<ResetRejectFailureStatus>(
      (event, emit) {
        emit(state.copyWith(
          theState: TheStates.success,
          rejectFail: false,
        ));
      },
    );

    on<ResetApproveSuccessStatus>(
      (event, emit) {
        emit(state.copyWith(
          theState: TheStates.success,
          approveSuccess: false,
        ));
      },
    );
    on<ResetApproveFailureStatus>(
      (event, emit) {
        emit(state.copyWith(
          theState: TheStates.success,
          approveFail: false,
        ));
      },
    );

    on<FetchServicesList>(
      (event, emit) async {
        try {
          await serviceRepo.fetchServiceCategoryList().then(
                (value) => emit(
                  state.copyWith(
                    servicesLoaded: true,
                    serviceList: value.map((e) => ServiceList.fromJson(e)).toList()
                      ..sort((a, b) => a.title!.compareTo(b.title!)),
                  ),
                ),
              );
        } catch (e) {
          log("Service List load error: $e");
          emit(state.copyWith(servicesLoaded: false));
        }
      },
    );

    on<ResetFilterSort>(
      (event, emit) async {
        emit(state.copyWith(
          servicesLoaded: false,
          isFilter: false,
          isBudgetSort: false,
          isDateSort: false,
        ));
      },
    );
  }
}
