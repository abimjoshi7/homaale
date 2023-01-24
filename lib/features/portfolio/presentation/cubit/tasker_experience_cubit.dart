import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_experience_state.dart';

class TaskerExperienceCubit extends Cubit<TaskerExperienceState> {
  TaskerExperienceCubit() : super(TaskerExperienceInitial());

  // Future<void> addTaskerExperience(
  //   TaskerExperienceReq taskerExperienceReq,
  // ) async {
  //   try {
  //     emit(
  //       TaskerExperienceInitial(),
  //     );
  //     final tokenP = await CacheHelper.getCachedString(CacheHelper.accessTokenP);
  //     final token = await CacheHelper.getCachedString(CacheHelper.accessToken);
  //     final x = await DioHelper().postDataWithCredential(
  //       url: 'tasker/experience/',
  //       data: taskerExperienceReq.toJson(),
  //       token: tokenP ?? token!,
  //     );
  //     if (x['status'] == 'success') emit(TaskerExperienceSuccess());
  //   } catch (e) {
  //     emit(TaskerExperienceFailure());
  //   }
  // }

  Future<void> getTaskerExperience() async {
    try {
      emit(
        TaskerExperienceInitial(),
      );

      final x = await DioHelper().getDatawithCredential(
        url: 'tasker/experience/',
        token: CacheHelper.accessToken,
      );
      if (x != null) {
        emit(
          TaskerGetExperienceSuccess(
            taskerExperienceRes: Experience.fromJson(x as Map<String, dynamic>),
          ),
        );
      }
    } catch (e) {
      emit(TaskerGetExperienceFailure());
    }
  }
}
