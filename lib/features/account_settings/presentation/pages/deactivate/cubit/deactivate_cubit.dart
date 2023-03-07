import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:dependencies/dependencies.dart';

part 'deactivate_state.dart';

class DeactivateCubit extends Cubit<DeactivateState> {
  DeactivateCubit() : super(DeactivateInitial());

  Future<void> initiateDeactivate(Map<String, dynamic> map) async {
    await DioHelper().postDataWithCredential(
      data: map,
      url: 'user/deactivate/',
      token: CacheHelper.accessToken,
    );
  }
}
