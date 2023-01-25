import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';

class KycRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> createKyc(CreateKycReq createKycReq) async {
    try {
      final x = await _dio.postDataWithCredential(
        data: createKycReq.toJson(),
        url: 'tasker/kyc/',
        token: CacheHelper.accessToken,
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
      final x = await _dio.postFormData(
        map: addKycReq.toJson(),
        url: 'tasker/kyc-document/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getKyc() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/kyc-document/',
        token: CacheHelper.accessToken,
      );
      return List<Map<String, dynamic>>.from(x as Iterable);
    } catch (e) {
      rethrow;
    }
  }
}
