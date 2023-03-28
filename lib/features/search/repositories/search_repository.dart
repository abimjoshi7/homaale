import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
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
          log('filter test: ' + x.toString());
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
        log('x ko val' + x);
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
      List? searchQueriesList,
      required String searchQuery}) async {
    try {
      if (searchQueriesList == null) {
        searchQueriesList = <String>[];
      }

      if (searchQueriesList.length >= 5) {
        searchQueriesList.removeLast();
      }
      if (!searchQueriesList.contains(searchQuery)) {
        searchQueriesList.add(searchQuery);
      }
      await CacheHelper.setCachedString(
        key,
        jsonEncode(searchQueriesList),
      );
      log('cache stored successfully!');

      return null;
    } catch (e) {
      log(e.toString());
    }
  }
}
