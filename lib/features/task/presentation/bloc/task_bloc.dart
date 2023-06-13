import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart'
    as es;
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:cipher/features/task/data/models/apply_task_req.dart';
import 'package:cipher/features/task/data/models/my_task_res.dart';
import 'package:cipher/features/task/data/models/task_apply_count_model.dart';
import 'package:cipher/features/task/data/repositories/task_repositories.dart';
import 'package:cipher/features/task_entity_service/data/models/req/applicant_model.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';

part 'task_event.dart';
part 'task_state.dart';

const kThrottleDuration = Duration(
  milliseconds: 100,
);

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskEntityServiceRepository _repo;
  final repo = TaskRepositories();
  final bookingRepo = BookingRepositories();
  final serviceRepo = ServicesRepositories();
  final tesRepo = TaskEntityServiceRepository();

  TaskBloc(this._repo) : super(const TaskState()) {
    on<AllTaskLoadInitiated>(
      transformer: throttleDroppable(kThrottleDuration),
      (event, emit) async {
        if (!event.newFetch && state.isLastPage) return;
        try {
          if (event.newFetch)
            emit(
              state.copyWith(
                theState: TheStates.initial,
              ),
            );
          if (state.theState == TheStates.initial) {
            var taskEntityServiceModel = await _repo.getTaskEntityServices(
              isTask: true,
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
            );
            emit(
              state.copyWith(
                theState: TheStates.success,
                taskEntityServiceModel: taskEntityServiceModel,
                taskEntityServices: taskEntityServiceModel.result,
                isLastPage: taskEntityServiceModel.next == null,
              ),
            );
          } else {
            var taskEntityServiceModel = await _repo.getTaskEntityServices(
              page: state.taskEntityServiceModel.current! + 1,
              isTask: true,
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
            );
            if (taskEntityServiceModel.next == null) {
              emit(
                state.copyWith(
                  isLastPage: true,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  theState: TheStates.success,
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
          await tesRepo.getSingleTaskEntityService(event.id).then(
            (singleTask) async {
              await repo
                  .singleTaskAppliedCount(id: event.id)
                  .then((count) async {
                if (CacheHelper.isLoggedIn) {
                  // if (state.taskModel?.createdBy?.id == event.userId) {
                  await tesRepo.getApplicants(event.id).then((applicants) {
                    emit(
                      state.copyWith(
                        theState: TheStates.success,
                        taskModel: singleTask,
                        taskApplyCountModel:
                            TaskApplyCountModel.fromJson(count),
                        applicantModel: applicants,
                      ),
                    );
                  });
                } else {
                  emit(
                    state.copyWith(
                      theState: TheStates.success,
                      taskModel: singleTask,
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
              applyTaskSuccess: false,
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
                    serviceList:
                        value.map((e) => ServiceList.fromJson(e)).toList()
                          ..sort((a, b) => a.title!.compareTo(b.title!)),
                  ),
                ),
              );
        } catch (e) {
          log("Service List load error: $e");
          emit(
            state.copyWith(
              servicesLoaded: false,
            ),
          );
        }
      },
    );

    on<ResetFilterSort>(
      (event, emit) async {
        emit(
          state.copyWith(
            servicesLoaded: false,
            isFilter: false,
            isBudgetSort: false,
            isDateSort: false,
          ),
        );
      },
    );
  }
}
