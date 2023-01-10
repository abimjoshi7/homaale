import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/kyc_req.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_state.dart';

class KycCubit extends Cubit<KycState> {
  KycCubit() : super(KycInitial());

  Future<dynamic> initialKyc(Map<String, dynamic> map) async {
    final accessP = await CacheHelper.getCachedString(kAccessTokenP);
    final access = await CacheHelper.getCachedString(kAccessToken);
    final x = await DioHelper().postDataWithCredential(
      data: map,
      url: 'tasker/kyc/',
      token: accessP ?? access!,
    );
    return x;
  }

  Future<void> addKyc(KycReq kycReq) async {
    final accessP = await CacheHelper.getCachedString(kAccessTokenP);
    final access = await CacheHelper.getCachedString(kAccessToken);
    final x = await DioHelper().postDataWithCredential(
      data: kycReq.toJson(),
      url: 'tasker/kyc-document/',
      token: accessP ?? access!,
    );
    print(x);
  }
}
