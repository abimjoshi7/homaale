import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_education_state.dart';

class TaskerEducationCubit extends Cubit<TaskerEducationState> {
  TaskerEducationCubit() : super(TaskerEducationInitial());

  Future<void> addTaskerEducation(
    Education taskerEducationReq,
  ) async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/education/',
        data: taskerEducationReq.toJson(),
        token: CacheHelper.accessToken!,
      );
      if (x['status'] == 'success') emit(TaskerEducationSuccess());
    } catch (e) {
      emit(TaskerEducationFailure());
    }
  }

  Future<void> getTaskerEducation() async {
    try {
      emit(
        TaskerEducationInitial(),
      );

      final x = await DioHelper().getDatawithCredential(
        url: 'tasker/education/',
        token: CacheHelper.accessToken,
      );
      if (x != null) {
        emit(
          TaskerGetEducationSuccess(
            taskerEducationRes: Education.fromJson(x as Map<String, dynamic>),
          ),
        );
      }
    } catch (e) {
      emit(TaskerEducationFailure());
    }
  }
}
