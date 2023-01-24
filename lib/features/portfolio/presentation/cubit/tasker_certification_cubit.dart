import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/networking/models/request/tasker_certification_req.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_certification_state.dart';

class TaskerCertificationCubit extends Cubit<TaskerCertificationState> {
  TaskerCertificationCubit() : super(TaskerCertificationInitial());

  Future<void> addTaskerCertification(
    TaskerCertificationReq taskerCertificationReq,
  ) async {
    try {
      emit(
        TaskerCertificationInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/certification/',
        data: taskerCertificationReq.toJson(),
        token: tokenP ?? token!,
      );
      if (x['status'] == 'success') emit(TaskerCertificationSuccess());
    } catch (e) {
      emit(TaskerCertificationFailure());
    }
  }

  Future<void> getTaskerCertification() async {
    try {
      emit(
        TaskerCertificationInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().getDatawithCredential(
        url: 'tasker/certification/',
        token: tokenP ?? token,
      );
      if (x != null) {
        emit(
          TaskerGetCertificationSuccess(
            taskerCertificationRes:
                Certificate.fromJson(x as Map<String, dynamic>),
          ),
        );
      }
    } catch (e) {
      emit(TaskerCertificationFailure());
    }
  }
}
