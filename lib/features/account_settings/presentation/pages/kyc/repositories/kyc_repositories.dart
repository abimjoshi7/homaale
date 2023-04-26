import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';

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

  Future<List> getCountriesList() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: "locale/client/country/options/",
        token: CacheHelper.accessToken,
      );
      return x as List;
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

  Future<Map<String, dynamic>> getKyc() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/my-kyc/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteKyc() async {
    try {
      final x = await _dio.deleteDataWithCredential(
        url: 'tasker/my-kyc/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getKycDocument() async {
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

  Future<List<Map<String, dynamic>>> fetchKycDocType() async {
    try {
      final response = await _dio.getDatawithCredential(
        url: "/task/kyc/document-type/",
        token: CacheHelper.accessToken,
      );
      return List<Map<String, dynamic>>.from(
        response as Iterable,
      );
    } catch (e) {
      rethrow;
    }
  }
}
