import 'dart:async';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';

class KycRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>?> createKyc(CreateKycReq createKycReq) async {
    try {
      final x = await _dio.postFormData(
        map: createKycReq.toJson(),
        url: "tasker/kyc/",
        token: CacheHelper.accessToken,
      );
      if (x != null) {
        return x as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> editKycProfile(
      Map<String,dynamic> editKycReq) async {
    try {
      final x = await _dio.patchDataWithCredential(
        url: "tasker/my-kyc/",
        token: CacheHelper.accessToken,
        data: editKycReq,
      );
      if (x != null) {
        return x as Map<String, dynamic>;
      }
      return null;
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

  Future<Map<dynamic, dynamic>> addKyc(
    AddKycReq addKycReq,
  ) async {
    try {
      final x = await _dio.postFormData(
        map: addKycReq.toJson(),
        url: 'tasker/kyc-document/',
        token: CacheHelper.accessToken,
      );
      return x as Map<dynamic, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getKyc() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/my-kyc/',
        token: CacheHelper.accessToken,
      );
      if (x != null) {
        return x as Map<String, dynamic>;
      }
      return null;
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

  Future<List<dynamic>> getKycDocument() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/kyc-document/',
        token: CacheHelper.accessToken,
      );
      return x as List<dynamic>;
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
