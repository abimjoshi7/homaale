import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:cipher/features/search/repositories/search_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository = SearchRepository();
  final _key = 'kRecentSearchQueriesKey';

  SearchBloc() : super(SearchState()) {
    on<SearchFieldInitialEvent>(
      ((event, emit) async {
        // List<String>? cachedSearchQueriesList =
        //     await _searchRepository.getCachedRecentSearchQueries(
        //   key: _key,
        // );
        emit(
          state.copyWith(
            theStates: TheStates.initial,
            // recentSearchQueriesList: cachedSearchQueriesList,
          ),
        );
      }),
    );
    on<SearchQueryCleared>(
      (event, emit) async {
        try {
          //get cached recent search queries
          var _recentSearchQueriesList =
              await _searchRepository.getCachedRecentSearchQueries(key: _key);
          emit(state.copyWith(
            theStates: TheStates.initial,
            recentSearchQueriesList: _recentSearchQueriesList,
          ));
        } catch (e) {
          log(e.toString());
        }
      },
    );
    on<SearchQueryInitiated>(
      (event, emit) async {
        try {
          final _unFilteredSearchList =
              await _searchRepository.fetchSearchQueryResults(
                  searchQuery: event.searchQuery.toLowerCase());

          if (_unFilteredSearchList != null) {
            final List<SearchResult>? filteredSearchList =
                _searchRepository.filterSearchResults(_unFilteredSearchList);
//get cached recent search queries
            var _searchQueriesList =
                await _searchRepository.getCachedRecentSearchQueries(key: _key);
//cache recent search queries
            await _searchRepository.cacheRecentSearchQueries(
              key: _key,
              searchQuery: event.searchQuery,
              searchQueriesList: _searchQueriesList as List,
            );
            emit(
              state.copyWith(
                theStates: TheStates.success,
                filteredList: filteredSearchList,
              ),
            );
          }
        } catch (e) {
          log("Search Bloc Error:" + e.toString());
          emit(state.copyWith(
            theStates: TheStates.failure,
          ));
        }
      },
    );
  }
}
