import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/tasker_education_req.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_education_state.dart';

class TaskerEducationCubit extends Cubit<TaskerEducationState> {
  TaskerEducationCubit() : super(TaskerEducationInitial());

  Future<void> addTaskerEducation(
    TaskerEducationReq taskerEducationReq,
  ) async {
    try {
      emit(
        TaskerEducationInitial(),
      );
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/education/',
        data: taskerEducationReq.toJson(),
        token: token!,
      );
      if (x['status'] == 'success') emit(TaskerEducationSuccess());
    } catch (e) {
      emit(TaskerEducationFailure());
    }
  }
}
