import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/tasker_experience_req.dart';
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
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/experience/',
        data: taskerExperienceReq.toJson(),
        token: token!,
      );
      if (x['status'] == 'success') emit(TaskerExperienceSuccess());
    } catch (e) {
      emit(TaskerExperienceFailure());
    }
  }
}
