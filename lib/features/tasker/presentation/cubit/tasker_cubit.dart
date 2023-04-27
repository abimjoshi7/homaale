import 'dart:developer';

import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/features/tasker/data/models/tasker_review_response.dart';
import 'package:cipher/features/tasker/data/repositories/tasker_repositories.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:dependencies/dependencies.dart';

class TaskerCubit extends Cubit<TaskerState> {
  final repo = TaskerRepositories();
  TaskerCubit() : super(const TaskerState());

  Future loadTaskerList({int? page}) async {
    try {
      emit(state.copyWith(status: TaskerStatus.initial));
      await repo.fetchAllTaskers(page: page ?? 1).then(
        (value) {
          final taskerListRes = TaskerListRes.fromJson(value);
          emit(
            state.copyWith(
              status: TaskerStatus.success,
              taskerListRes: taskerListRes,
            ),
          );
        },
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }

  Future loadSingleTasker(String id) async {
    try {
      emit(state.copyWith(status: TaskerStatus.initial));

      await repo.fetchSingleTasker(id: id).then(
        (tasker) {
          emit(
            state.copyWith(
              status: TaskerStatus.success,
              singleTasker: Tasker.fromJson(tasker),
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }

  Future loadSingleTaskerServices(String id) async {
    try {
      emit(state.copyWith(status: TaskerStatus.initial));
      await repo.getSingleTaskerService(createdBy: id).then(
        (service) {
          emit(
            state.copyWith(
              status: TaskerStatus.success,
              service: EntityServiceModel.fromJson(service),
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }

  Future loadSingleTaskerTask(String id) async {
    try {
      emit(state.copyWith(status: TaskerStatus.initial));
      await repo.getSingleTaskerTask(createdBy: id).then(
        (task) {
          emit(
            state.copyWith(
              status: TaskerStatus.success,
              task: EntityServiceModel.fromJson(task),
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }

  Future loadSingleTaskerReviews(String id) async {
    try {
      emit(state.copyWith(status: TaskerStatus.initial));
      await repo.getSingleTaskerReviews(userId: id).then(
        (reviews) {
          final taskerReviewResponse = TaskerReviewResponse.fromJson(reviews);
          emit(
            state.copyWith(
              status: TaskerStatus.success,
              taskerReviewsResponse: taskerReviewResponse,
            ),
          );
        },
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }

  Future handleFollowUnFollow({required String id, required bool follow, bool? fromAllPage}) async {
    try {
      await repo.handleFollowUnFollow(id: id, follow: follow).then((val) {
        if (val['status'] == 'success') {
          loadSingleTasker(id);
          loadSingleTaskerServices(id);
          loadSingleTaskerTask(id);
          loadSingleTaskerReviews(id);
          loadTaskerList(page: 1);
        }
      });
    } catch (e) {
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }
}
