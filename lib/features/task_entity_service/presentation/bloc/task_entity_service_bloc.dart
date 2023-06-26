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
import 'package:cipher/features/task_entity_service/data/models/res/recommended_similar_dto.dart';
import 'package:cipher/features/task_entity_service/data/models/res/task_entity_service_res.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';

import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'task_entity_service_event.dart';
part 'task_entity_service_state.dart';

const kThrottleDuration = Duration(
  milliseconds: 100,
);

class TaskEntityServiceBloc extends Bloc<TaskEntityServiceEvent, TaskEntityServiceState> {
  final TaskEntityServiceRepository repo;
  final bookingRepo = BookingRepositories();
  final serviceRepo = ServicesRepositories();

  TaskEntityServiceBloc(this.repo) : super(const TaskEntityServiceState()) {
    on<TaskEntityServiceInitiated>(
      transformer: throttleDroppable(kThrottleDuration),
      (event, emit) async {
        if (!event.newFetch && state.isLastPage) return;
        try {
          if (event.newFetch) emit(state.copyWith(theStates: TheStates.initial));
          if (state.theStates == TheStates.initial) {
            var orderList = <String>[];
            if (event.budgetSort != null) {
              orderList.add(event.budgetSort.toString());
            }
            if (event.dateSort != null) {
              orderList.add(event.dateSort.toString());
            }

            var taskEntityServiceModel = await repo.getTaskEntityServices(
              isTask: event.isTask,
              page: 1,
              budgetFrom: event.budgetFrom,
              budgetTo: event.budgetTo,
              payableFrom: event.payableFrom,
              payableTo: event.payableTo,
              dateFrom: event.dateFrom,
              dateTo: event.dateTo,
              city: event.city,
              category: event.category,
              query: event.query,
              serviceId: event.serviceId,
              order: orderList,
            );

            emit(
              state.copyWith(
                theStates: TheStates.success,
                taskEntityServiceModel: taskEntityServiceModel,
                taskEntityServices: taskEntityServiceModel.result,
                isLastPage: taskEntityServiceModel.next == null,
              ),
            );
          } else {
            var orderList = <String>[];
            if (event.budgetSort != null) {
              orderList.add(event.budgetSort.toString());
            }
            if (event.dateSort != null) {
              orderList.add(event.dateSort.toString());
            }
            var taskEntityServiceModel = await repo.getTaskEntityServices(
              page: state.taskEntityServiceModel.current! + 1,
              isTask: event.isTask,
              budgetFrom: event.budgetFrom,
              budgetTo: event.budgetTo,
              payableFrom: event.payableFrom,
              payableTo: event.payableTo,
              dateFrom: event.dateFrom,
              dateTo: event.dateTo,
              city: event.city,
              category: event.category,
              query: event.query,
              serviceId: event.serviceId,
              order: orderList,
            );
            if (taskEntityServiceModel.next == null) {
              emit(state.copyWith(isLastPage: true));
            } else {
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  taskEntityServiceModel: taskEntityServiceModel,
                  taskEntityServices: [
                    ...state.taskEntityServices!,
                    ...taskEntityServiceModel.result!,
                  ],
                  isLastPage: false,
                ),
              );
            }
          }
        } catch (e) {
          log("TES Initiate Bloc Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
          );
        }
      },
    );

    on<TaskEntityServiceSingleLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(theStates: TheStates.loading),
        );
        try {
          await repo.getSingleTaskEntityService(event.id).then(
            (value) async {
              if (CacheHelper.isLoggedIn) {
                if (event.isEdit == null) {
                  await repo.getApplicants(event.id).then(
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
          log('Single TES Load Error' + e.toString());
          emit(state.copyWith(theStates: TheStates.failure));
        }
      },
    );

    on<FetchRecommendedSimilar>(
      (event, emit) async {
        try {
          emit(state.copyWith(recommendedSimilarDto: RecommendedSimilarDto()));
          await repo.getRecommendedSimilar(event.id).then(
            (value) {
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  recommendedSimilarDto: value,
                ),
              );
            },
          );
        } catch (e) {
          log('recommendedSimilarDto Error' + e.toString());
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
          emit(state.copyWith(theStates: TheStates.loading));
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
            .then(
          (value) {
            emit(
              state.copyWith(
                theStates: TheStates.success,
                isEdited: value,
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            theStates: TheStates.failure,
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
                    serviceList: value.map((e) => ServiceList.fromJson(e)).toList()
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

    on<ResetTESEditStatus>((event, emit) => emit(state.copyWith(isEdited: false)));
  }
}
