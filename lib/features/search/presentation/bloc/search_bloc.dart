import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:cipher/features/search/repositories/search_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/widgets.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository = SearchRepository();
  final _key = 'kRecentSearchQueriesKey';

  SearchBloc() : super(SearchState()) {
    on<SearchFieldInitialEvent>(
      ((event, emit) async {
        //get cached recent search queries
        var _recentSearchQueriesList = await _searchRepository
            .getCachedRecentSearchQueries(key: _key) as List?;
        if (_recentSearchQueriesList == null) {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
              recentSearchQueriesList: [],
            ),
          );
        } else {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
              recentSearchQueriesList: _recentSearchQueriesList,
            ),
          );
        }
      }),
    );
    on<SearchQueryCleared>(
      (event, emit) async {
        try {
          //get cached recent search queries
          var _recentSearchQueriesList =
              await _searchRepository.getCachedRecentSearchQueries(key: _key);
          if (_recentSearchQueriesList == null) {
            emit(
              state.copyWith(
                theStates: TheStates.initial,
                recentSearchQueriesList: [],
              ),
            );
          } else {
            emit(
              state.copyWith(
                theStates: TheStates.initial,
                recentSearchQueriesList: _recentSearchQueriesList as List,
              ),
            );
          }
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
            var _recentSearchQueriesList = await _searchRepository
                .getCachedRecentSearchQueries(key: _key) as List?;
            // if (_recentSearchQueriesList == null) {
            //   _recentSearchQueriesList = [];
            // }
            //cache recent search queries
            await _searchRepository.cacheRecentSearchQueries(
              key: _key,
              searchQuery: event.searchQuery,
              recentSearchQueriesList: _recentSearchQueriesList,
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
    on<RecentSearchQueryCleared>((event, emit) async {
      try {
        //cache recent search queries
        await _searchRepository.cacheNewRecentSearchQueriesList(
          key: _key,
          recentSearchQueriesList: List.empty(),
        );
        var _recentSearchQueriesList = await _searchRepository
            .getCachedRecentSearchQueries(key: _key) as List?;
        emit(state.copyWith(
          theStates: TheStates.initial,
          recentSearchQueriesList: _recentSearchQueriesList,
        ));
      } catch (e) {
        log(e.toString());
        emit(
          state.copyWith(
            theStates: TheStates.failure,
          ),
        );
      }
    });
    on<RecentSearchQueryIndexCleared>((event, emit) async {
      try {
        //get cached recent search queries
        var _recentSearchQueriesList = await _searchRepository
            .getCachedRecentSearchQueries(key: _key) as List;

        _recentSearchQueriesList.removeAt(event.index);
        //cache recent search queries
        await _searchRepository.cacheNewRecentSearchQueriesList(
          key: _key,
          recentSearchQueriesList: _recentSearchQueriesList,
        );
        emit(
          state.copyWith(
            theStates: TheStates.initial,
            recentSearchQueriesList: _recentSearchQueriesList,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(
          state.copyWith(
            theStates: TheStates.failure,
          ),
        );
      }
    });
    on<RecentSearchQueryIndexSelected>((event, emit) {
      event.searchFieldController.value.copyWith(
        text: event.cachedSearchQuery,
      );
			
      emit(
        state.copyWith(
          theStates: TheStates.success,
        ),
      );
    });
  }
}
