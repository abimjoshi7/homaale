import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/data/repositories/user_data_repositories.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final repositories = UserDataRepositories();
  UserDataCubit() : super(UserDataInitial());

  Future<void> getTaskerUserData() async {
    try {
      emit(
        UserDataInitial(),
      );

      await repositories.fetchUserData().then(
        (value) {
          if (value.isNotEmpty) {
            emit(
              UserDataLoadSuccess(
                userData: TaskerProfileRetrieveRes.fromJson(value),
              ),
            );
          }
        },
      );
      // final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      // final token = await CacheHelper.getCachedString(kAccessToken);

      // final x = await DioHelper().getDatawithCredential(
      //   url: 'tasker/profile/',
      //   token: tokenP ?? token,
      // );

      // final y = TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);

      // print(y);

      // if (x != null) {
      //   emit(
      //     UserDataLoadSuccess(
      //       userData:
      //           TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>),
      //     ),
      //   );
      // }
    } catch (e) {
      print(e);
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
      final x = await DioHelper().postFormData(
        url: 'tasker/my-profile/',
        token: tokenP ?? token!,
        map: taskerProfileCreateReq.toJson(),
      );
      if (x != null) {
        emit(
          UserDataCreateSuccess(),
        );
        await getTaskerUserData();
      }
    } catch (e) {
      emit(
        UserDataCreateFailure(),
      );
      await getTaskerUserData();
    }
  }

  Future<void> editTaskerUserData(
    Map<String, dynamic> map,
  ) async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().patchDataWithCredential(
        data: map,
        url: 'tasker/profile/',
        token: tokenP ?? token!,
      );
      if (x != null) {
        emit(
          UserDataEditSuccess(),
        );
        await getTaskerUserData();
      }
    } catch (e) {
      emit(
        UserDataEditFailure(),
      );
      await getTaskerUserData();
    }
  }

  Future<void> editProfilePic(Map<String, dynamic> map) async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);
    final x = await DioHelper().patchFormData(
      map: map,
      url: 'tasker/profile/',
      token: tokenP ?? token!,
    );
    if (x != null) {
      emit(
        UserDataEditSuccess(),
      );
    } else {
      emit(
        UserDataEditFailure(),
      );
    }

    await getTaskerUserData();
  }
}
