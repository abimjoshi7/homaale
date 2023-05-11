import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:dependencies/dependencies.dart';

part 'deactivate_state.dart';

class DeactivateCubit extends Cubit<DeactivateState> {
  DeactivateCubit() : super(DeactivateInitial());

  Future<void> initiateDeactivate({required String reason}) async {
    await DioHelper().postDataWithCredential(
      data: {reason},
      url: 'user/deactivate/',
      token: CacheHelper.accessToken,
    );
  }
}
