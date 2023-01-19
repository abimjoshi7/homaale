import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/get_kyc_res.dart';

class KycRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> createKyc(CreateKycReq createKycReq) async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);
    final x = await _dio.postDataWithCredential(
      data: createKycReq.toJson(),
      url: 'tasker/kyc/',
      token: token ?? tokenP!,
    );
    return x as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> addKyc(
    AddKycReq addKycReq,
  ) async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);
    final x = await _dio.postFormData(
      map: addKycReq.toJson(),
      url: 'tasker/kyc-document/',
      token: token ?? tokenP!,
    );
    return x as Map<String, dynamic>;
  }

  Future<List<GetKycRes>> getKyc() async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);
    final x = await _dio.getDatawithCredential(
      url: 'tasker/kyc-document/',
      token: token ?? tokenP!,
    );
    final y =
        x.map((e) => GetKycRes.fromJson(e as Map<String, dynamic>)).toList();
    return List.from(y as List);
  }
}
