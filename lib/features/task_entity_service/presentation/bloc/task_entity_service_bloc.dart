import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:cipher/features/task_entity_service/data/models/req/applicant_model.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/data/models/res/task_entity_service_res.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';

import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'task_entity_service_event.dart';
part 'task_entity_service_state.dart';

const kThrottleDuration = Duration(
  seconds: 15,
);

class TaskEntityServiceBloc
    extends Bloc<TaskEntityServiceEvent, TaskEntityServiceState> {
  final TaskEntityServiceRepository repo;
  final bookingRepo = BookingRepositories();
  final serviceRepo = ServicesRepositories();

  TaskEntityServiceBloc(this.repo) : super(const TaskEntityServiceState()) {
    on<TaskEntityServiceInitiated>(
      (event, emit) async {
        emit(
          TaskEntityServiceState.initial(),
        );
        try {
          await repo
              .getTaskEntityServices(
                isTask: event.isTask,
                page: event.page ?? 1,
                order: event.order,
                serviceId: event.serviceId,
                city: event.city,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    taskEntityServiceModel: value,
                    // isBudgetSort: event.isBudgetSort,
                    // isDateSort: event.isDateSort,
                  ),
                ),
              );
        } catch (e) {
          log("TES Initiate Bloc Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              // isBudgetSort: false,
              // isDateSort: false,
            ),
          );
        }
      },
    );

    on<TaskEntityServiceSingleLoaded>(
      (event, emit) async {
        try {
          emit(
            TaskEntityServiceState.initial(),
          );
          await repo
              .getSingleTaskEntityService(
            event.id,
          )
              .then(
            (value) async {
              if (CacheHelper.isLoggedIn) {
                await repo
                    .getApplicants(
                      event.id,
                    )
                    .then(
                      (applicants) => emit(
                        state.copyWith(
                          theStates: TheStates.success,
                          taskEntityService: value,
                          applicantModel: applicants,
                        ),
                      ),
                    );
              } else {
                emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    taskEntityService: value,
                  ),
                );
              }
            },
          );
        } catch (e) {
          log('exasd' + e.toString());
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              // isLoaded: false,
            ),
          );
        }
      },
    );

    on<MyTESLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repo
              .getMyTaskEntityService(
                event.isTask,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    selfCreatedTaskService: value,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(theStates: TheStates.failure),
          );
        }
      },
    );

    on<TaskEntityServiceCreated>(
      transformer: throttleDroppable(
        kThrottleDuration,
      ),
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repo
              .postTaskEntityService(event.req)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    isCreated: true,
                    taskEntityServiceRes: value,
                  ),
                ),
              )
              .whenComplete(
                () => emit(
                  state.copyWith(
                    isCreated: false,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isCreated: false,
            ),
          );
        }
      },
    );

    on<TaskEntityServiceEdited>((event, emit) async {
      try {
        await repo
            .editTaskEntityService(
              event.id ?? "",
              event.taskEntityServiceReq ?? TaskEntityServiceReq(),
            )
            .whenComplete(
              () => emit(
                state.copyWith(
                  isEdited: true,
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(
            isEdited: false,
          ),
        );
        rethrow;
      }
    });

    on<TaskEntityServiceDeleted>((event, emit) async {
      try {
        await repo
            .deleteTaskEntityService(
              event.id,
            )
            .whenComplete(
              () => emit(
                state.copyWith(
                  isDeleted: true,
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(
            isDeleted: false,
          ),
        );
        rethrow;
      }
    });

    on<TaskEntityServiceApprovePeople>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theStates: TheStates.initial),
          );
          await bookingRepo.approveBooking(event.approveReq).then(
            (value) {
              log('$value');
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  approveSuccess: true,
                  approveFail: false,
                ),
              );
            },
          );
        } catch (e) {
          print(e);
          emit(state.copyWith(theStates: TheStates.success, approveFail: true));
        }
      },
    );

    on<ResetApproveSuccessStatus>(
      (event, emit) {
        emit(state.copyWith(
          theStates: TheStates.success,
          approveSuccess: false,
        ));
      },
    );
    on<ResetApproveFailureStatus>(
      (event, emit) {
        emit(state.copyWith(
          theStates: TheStates.success,
          approveFail: false,
        ));
      },
    );

    on<TaskRejectPeople>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theStates: TheStates.initial),
          );
          await bookingRepo.rejectBooking(event.rejectReq).then(
            (value) {
              log('$value');
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  rejectSuccess: true,
                  rejectFail: false,
                ),
              );
            },
          );
        } catch (e) {
          print(e);
          emit(state.copyWith(theStates: TheStates.success, rejectFail: true));
        }
      },
    );

    on<ResetRejectSuccessStatus>(
      (event, emit) {
        emit(state.copyWith(
          theStates: TheStates.success,
          rejectSuccess: false,
        ));
      },
    );
    on<ResetRejectFailureStatus>(
      (event, emit) {
        emit(state.copyWith(
          theStates: TheStates.success,
          rejectFail: false,
        ));
      },
    );

    on<FetchServicesList>(
      (event, emit) async {
        try {
          await serviceRepo.fetchServiceCategoryList().then(
                (value) => emit(
                  state.copyWith(
                    serviceLoaded: true,
                    serviceList:
                        value.map((e) => ServiceList.fromJson(e)).toList()
                          ..sort((a, b) => a.title!.compareTo(b.title!)),
                  ),
                ),
              );
        } catch (e) {
          log("Service List load error: $e");
          emit(state.copyWith(serviceLoaded: false));
        }
      },
    );

    on<ResetFilterSort>(
      (event, emit) async {
        emit(state.copyWith(
          serviceLoaded: false,
          isFilter: false,
          isBudgetSort: false,
          isDateSort: false,
        ));
      },
    );
  }
}
