import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:cipher/features/utilities/data/models/skill_option_model.dart';

class UtilitiesRepositories {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> getInterestList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/cms/task-category/list/',
        token: CacheHelper.accessToken,
      );
      final map = List<Map<String, dynamic>>.from(res as Iterable);
      return map;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CountryModel>> getCountryList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'locale/cms/country/option/',
        token: CacheHelper.accessToken,
      );
      final x = List<CountryModel>.from(
        res
            .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() as Iterable,
      );
      return x;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CityModel>> getCityList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'locale/cms/city/options/',
        token: CacheHelper.accessToken,
      );
      final x = List<CityModel>.from(
        res.map((e) => CityModel.fromJson(e as Map<String, dynamic>)).toList()
            as Iterable,
      );
      return x;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CurrencyModel>> getCurrencyList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'locale/currency/options/',
        token: CacheHelper.accessToken,
      );
      final x = List<CurrencyModel>.from(
        res
            .map((e) => CurrencyModel.fromJson(e as Map<String, dynamic>))
            .toList() as Iterable,
      );
      return x;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LanguageModel>> getlanguageList({
    String? countryCode,
  }) async {
    final x = await _dio.getDatawithCredential(
      url: 'locale/language/options/',
      token: CacheHelper.accessToken,
    );
    return List<LanguageModel>.from(
      x.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>)).toList()
          as Iterable,
    );
  }

  Future<List<SkillOptionModel>> getUserSkillOptionsList() async {
    final x = await _dio.getDatawithCredential(
      url: 'tasker/skill/options/',
      token: CacheHelper.accessToken,
    ) as List;

    return List<SkillOptionModel>.from(
      x
          .map((e) => SkillOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
