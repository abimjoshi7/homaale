import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:cipher/features/task_entity_service/data/models/req/applicant_model.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/data/models/res/task_entity_service_res.dart';

import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'task_entity_service_event.dart';
part 'task_entity_service_state.dart';

class TaskEntityServiceBloc extends Bloc<TaskEntityServiceEvent, TaskEntityServiceState> {
  final repo = TaskEntityServiceRepository();
  final servicesRepo = ServicesRepositories();
  final bookingRepo = BookingRepositories();

  TaskEntityServiceBloc() : super(const TaskEntityServiceState()) {
    on<TaskEntityServiceSingleLoaded>(
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
              if (CacheHelper.isLoggedIn) {
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
              } else {
                emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    taskEntityService: TaskEntityService.fromJson(value),
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isLoaded: false,
            ),
          );
        }
      },
    );

    on<TaskEntityServiceCreated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
            ),
          );
          await repo
              .createTaskEntityService(taskEntityServiceReq: event.req)
              .then(
                (value) => emit(
                  state.copyWith(
                      theStates: TheStates.success,
                      isCreated: true,
                      taskEntityServiceRes: TaskEntityServiceRes.fromJson(value)),
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
  }
}
