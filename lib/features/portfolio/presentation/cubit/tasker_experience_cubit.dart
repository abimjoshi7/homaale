import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/tasker_experience_req.dart';
import 'package:cipher/networking/models/response/tasker_experience_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_experience_state.dart';

class TaskerExperienceCubit extends Cubit<TaskerExperienceState> {
  TaskerExperienceCubit() : super(TaskerExperienceInitial());

  Future<void> addTaskerExperience(
    TaskerExperienceReq taskerExperienceReq,
  ) async {
    try {
      emit(
        TaskerExperienceInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/experience/',
        data: taskerExperienceReq.toJson(),
        token: tokenP ?? token!,
      );
      if (x['status'] == 'success') emit(TaskerExperienceSuccess());
    } catch (e) {
      emit(TaskerExperienceFailure());
    }
  }

  Future<void> getTaskerExperience() async {
    try {
      emit(
        TaskerExperienceInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().getDatawithCredential(
        url: 'tasker/experience/',
        token: tokenP ?? token,
      );
      if (x != null) {
        emit(
          TaskerGetExperienceSuccess(
            taskerExperienceRes:
                TaskerExperienceRes.fromJson(x as Map<String, dynamic>),
          ),
        );
      }
    } catch (e) {
      emit(TaskerGetExperienceFailure());
    }
  }
}
