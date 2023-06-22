import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/security_question/data/models/req/security_question_req.dart';

class SecurityRepository {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> fetchSecurityQuestion() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'tasker/cms/security-question/',
        token: CacheHelper.accessToken,
      );
      final map = List<Map<String, dynamic>>.from(res as Iterable);
      return map;
    }
    // try {
    //   final res = await _dio.getDatawithCredential(
    //     url: 'tasker/cms/security-question/',
    //     token: CacheHelper.accessToken,
    //   );
    //   final response= res as Map<String,dynamic>;
    //   final se= SecurityQuestionReq.fromJson(response);
    //   return se;
    // }
    catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addAnswer(
      int? id ,String answer ,
      ) async {
    try {
      final response = await _dio.postDataWithCredential(
        data: {
          'question':id,
          'answer':answer,
        },
        url: 'tasker/security-answer/',
        token: CacheHelper.accessToken,
      );
      return response as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
