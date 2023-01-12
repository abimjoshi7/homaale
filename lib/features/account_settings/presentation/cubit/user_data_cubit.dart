import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/tasker_profile_create_req.dart';
import 'package:cipher/networking/models/response/tasker_profile_retrieve_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  Future<void> getTaskerUserData() async {
    try {
      emit(
        UserDataInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);

      final x = await DioHelper().getDatawithCredential(
        url: 'tasker/profile/',
        token: tokenP ?? token,
      );

      if (x != null) {
        emit(
          UserDataLoadSuccess(
            userData:
                TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>),
          ),
        );
      }
    } catch (e) {
      emit(
        UserDataLoadFailure(),
      );
    }
  }

  Future<void> postTaskerUserData(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      emit(
        UserDataInitial(),
      );

      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        data: taskerProfileCreateReq.toJson(),
        url: 'tasker/my-profile/',
        token: tokenP ?? token!,
      );
      if (x != null) {
        emit(
          UserDataCreateSuccess(),
        );
      }
    } catch (e) {
      emit(
        UserDataCreateFailure(),
      );
    }
  }

  Future<void> editTaskerUserData(
    Map<String, dynamic> map,
  ) async {
    try {
      emit(
        UserDataInitial(),
      );

      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().patchDataWithCredential(
        data: map,
        url: 'tasker/my-profile/',
        token: tokenP ?? token!,
      );
      if (x != null) {
        emit(
          UserDataEditSuccess(),
        );
      }
    } catch (e) {
      emit(
        UserDataEditFailure(),
      );
    }
  }
}
