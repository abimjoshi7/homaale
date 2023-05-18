import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/api_constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/search/data/models/search_res.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';

class SearchRepository {
  final _dio = DioHelper();
  Future<List<dynamic>?> fetchSearchQueryResults(
      {required String searchQuery}) async {
    try {
      final x = await _dio.getData(
        url: "/search/dashboard/?q=$searchQuery",
      ) as Map<String, dynamic>?;
      if (x != null) {
        final searchList = x['result'] as List;
        return searchList;
      }
      return null;
    } catch (e) {
      log("Search API Failure:" + e.toString());
      rethrow;
    }
  }

  List<SearchResult>? filterSearchResults(List unFilteredList) {
    try {
      List<SearchResult> filteredList = [];
      unFilteredList.map((e) => e as Map<String, dynamic>).forEach((result) {
        if (result["c_type"] == "task.EntityService") {
          final x = TaskEntityService.fromJson(
              result["result"] as Map<String, dynamic>);
          filteredList.add(
            SearchResult.taskEntityServiceResult(x),
          );
        }
        if (result["c_type"] == "tasker.Profile") {
          final TaskerProfile x =
              TaskerProfile.fromJson(result["result"] as Map<String, dynamic>);
          filteredList.add(
            SearchResult.taskerProfileResult(x),
          );
        }
      });
      return filteredList;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<dynamic> getCachedRecentSearchQueries({required String key}) async {
    try {
      final x = await CacheHelper.getCachedString(key);
      if (x != null) {
        final list = jsonDecode(x).cast<String>().toList();
        return list;
      }
      return null;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> cacheRecentSearchQueries(
      {required String key,
      List? recentSearchQueriesList,
      required String searchQuery}) async {
    try {
      if (recentSearchQueriesList == null) {
        recentSearchQueriesList = <String>[];
      }

      if (recentSearchQueriesList.length >= 5) {
        recentSearchQueriesList.removeLast();
      }

      if (!recentSearchQueriesList.contains(searchQuery)) {
        recentSearchQueriesList.add(searchQuery);
      }

      await CacheHelper.setCachedString(
        key,
        jsonEncode(recentSearchQueriesList),
      );

      return null;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> cacheNewRecentSearchQueriesList({
    required String key,
    required List recentSearchQueriesList,
  }) async {
    try {
      await CacheHelper.setCachedString(
        key,
        jsonEncode(recentSearchQueriesList),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> fetchSearchRes(String text) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kSearchPath,
        token: CacheHelper.accessToken,
        query: {
          "q": text,
        },
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Search Error: $e");
      throw Exception("Search Error");
    }
  }

  Future<SearchRes> getSearchResults(String text) async {
    return await fetchSearchRes(text)
        .then(
          (value) => SearchRes.fromJson(
            value,
          ),
        )
        .whenComplete(() => print);
  }
}
