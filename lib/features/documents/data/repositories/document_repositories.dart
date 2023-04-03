import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/documents/data/models/tasker_certification_req.dart';
import 'package:cipher/features/documents/data/models/tasker_education_req.dart';
import 'package:cipher/features/documents/data/models/tasker_experience_req.dart';
import 'package:cipher/features/documents/data/models/tasker_portfolio_req.dart';

class DocumentRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> retreivePortfolio(int id) async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/portfolio/$id/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchPortfolio({int pageNumber = 1}) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final x = await _dio.getData(
          url: 'tasker/portfolio/',
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      } else {
        final x = await _dio.getDatawithCredential(
          url: 'tasker/portfolio/',
          token: CacheHelper.accessToken,
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addPortfolio(
    TaskerPortfolioReq taskerPortfolioReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        url: 'tasker/portfolio/',
        data: taskerPortfolioReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> editPortfolio(
    TaskerPortfolioReq taskerPortfolioReq,
    int id,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        url: 'tasker/portfolio/$id/',
        data: taskerPortfolioReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<void> deletePortfolio(
    int id,
  ) async {
    try {
      await _dio.deleteDataWithCredential(
        id: id,
        url: 'tasker/portfolio/',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> retreiveExperience(int id) async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/experience/$id/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchExperience({int pageNumber = 1}) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final x = await _dio.getData(
          url: 'tasker/experience/',
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      } else {
        final x = await _dio.getDatawithCredential(
          url: 'tasker/experience/',
          token: CacheHelper.accessToken,
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addExperience(
    TaskerExperienceReq taskerExperienceReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        url: 'tasker/experience/',
        data: taskerExperienceReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> editExperience(
    TaskerExperienceReq taskerExperienceReq,
    int id,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        url: 'tasker/experience/$id/',
        data: taskerExperienceReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<void> deleteExperience(
    int id,
  ) async {
    try {
      await _dio.deleteDataWithCredential(
        id: id,
        url: 'tasker/experience/',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchEducation({int pageNumber = 1}) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final x = await _dio.getData(
          url: 'tasker/education/',
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      } else {
        final x = await _dio.getDatawithCredential(
          url: 'tasker/education/',
          token: CacheHelper.accessToken,
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> retreiveEducation(int id) async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/education/$id/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addEducation(
    TaskerEducationReq taskerEducationReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        url: 'tasker/education/',
        data: taskerEducationReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> editEducation(
    TaskerEducationReq taskerEducationReq,
    int id,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        url: 'tasker/education/$id/',
        data: taskerEducationReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<void> deleteEducation(
    int id,
  ) async {
    try {
      await _dio.deleteDataWithCredential(
        id: id,
        url: 'tasker/education/',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> retreiveCertification(int id) async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/certification/$id/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchCertification({int pageNumber = 1}) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final x = await _dio.getData(
          url: 'tasker/certification/',
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      } else {
        final x = await _dio.getDatawithCredential(
          url: 'tasker/certification/',
          token: CacheHelper.accessToken,
          query: {
            'page': pageNumber,
          },
        );
        return x as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addCertification(
    TaskerCertificateReq taskerCertificationReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        url: 'tasker/certification/',
        data: taskerCertificationReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> editCertificate(
    TaskerCertificateReq taskerCertificateReq,
    int id,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        url: 'tasker/certification/$id/',
        data: taskerCertificateReq.toJson(),
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<void> deleteCertificate(
    int id,
  ) async {
    try {
      await _dio.deleteDataWithCredential(
        id: id,
        url: 'tasker/certification/',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
