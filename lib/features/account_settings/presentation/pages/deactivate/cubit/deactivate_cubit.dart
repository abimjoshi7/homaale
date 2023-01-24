import 'package:bloc/bloc.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:equatable/equatable.dart';

part 'deactivate_state.dart';

class DeactivateCubit extends Cubit<DeactivateState> {
  DeactivateCubit() : super(DeactivateInitial());

  Future<void> initiateDeactivate(Map<String, dynamic> map) async {
    await DioHelper()
        .postDataWithCredential(
          data: map,
          url: 'user/deactivate/',
          token: CacheHelper.accessToken,
        )
        .then(
          (value) => print(value),
        );
  }
}
