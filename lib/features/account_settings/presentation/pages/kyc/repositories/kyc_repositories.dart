import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/get_kyc_res.dart';

class KycRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> createKyc(CreateKycReq createKycReq) async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await _dio.postDataWithCredential(
        data: createKycReq.toJson(),
        url: 'tasker/kyc/',
        token: token ?? tokenP!,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addKyc(
    AddKycReq addKycReq,
  ) async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await _dio.postFormData(
        map: addKycReq.toJson(),
        url: 'tasker/kyc-document/',
        token: token ?? tokenP!,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getKyc() async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await _dio.getDatawithCredential(
        url: 'tasker/kyc-document/',
        token: token ?? tokenP!,
      );
      return List<Map<String, dynamic>>.from(x as Iterable);
    } catch (e) {
      rethrow;
    }
  }
}
