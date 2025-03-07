// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/features/search/data/models/search_res.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:cipher/features/search/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  final _key = 'kRecentSearchQueriesKey';

  SearchBloc(
    this._searchRepository,
  ) : super(SearchState()) {
    on<SearchFieldInitialEvent>(
      ((event, emit) async {
        try {
          //get cached recent search queries
          var _recentSearchQueriesList = await _searchRepository
              .getCachedRecentSearchQueries(key: _key) as List<String>;

          emit(
            state.copyWith(
              theStates: TheStates.initial,
              recentSearchQueriesList: _recentSearchQueriesList,
            ),
          );
        } catch (e) {
          log(e.toString());
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
                recentSearchQueriesList:
                    _recentSearchQueriesList as List<String>,
              ),
            );
          }
        } catch (e) {
          log(e.toString());
        }
      },
    );
    on<SearchQueryInitiated>(_onSearchQueryInitiated);
    // on<SearchQueryInitiated>(
    //   (event, emit) async {
    //     try {
    //       final _unFilteredSearchList =
    //           await _searchRepository.fetchSearchQueryResults(
    //               searchQuery: event.searchQuery.toLowerCase());

    //       if (_unFilteredSearchList != null) {
    //         final List<SearchResult>? filteredSearchList =
    //             _searchRepository.filterSearchResults(_unFilteredSearchList);
    //         //get cached recent search queries
    //         var _recentSearchQueriesList = await _searchRepository
    //             .getCachedRecentSearchQueries(key: _key) as List?;

    //         //cache recent search queries
    //         await _searchRepository.cacheRecentSearchQueries(
    //           key: _key,
    //           searchQuery: event.searchQuery,
    //           recentSearchQueriesList: _recentSearchQueriesList,
    //         );
    //         emit(
    //           state.copyWith(
    //             theStates: TheStates.success,
    //             filteredList: filteredSearchList,
    //           ),
    //         );
    //       }
    //     } catch (e) {
    //       log("Search Bloc Error:" + e.toString());
    //       emit(state.copyWith(
    //         theStates: TheStates.failure,
    //       ));
    //     }
    //   },
    // );
    on<RecentSearchQueryCleared>((event, emit) async {
      try {
        //cache recent search queries
        await _searchRepository.cacheNewRecentSearchQueriesList(
          key: _key,
          recentSearchQueriesList: List.empty(),
        );
        var _recentSearchQueriesList = await _searchRepository
            .getCachedRecentSearchQueries(key: _key) as List<String>;
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
    on<RecentSearchQueryIndexCleared>(
      (event, emit) async {
        try {
          //get cached recent search queries
          var _recentSearchQueriesList = await _searchRepository
              .getCachedRecentSearchQueries(key: _key) as List<String>;

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
      },
    );
  }

  Future<void> _onSearchQueryInitiated(
      SearchQueryInitiated event, Emitter<SearchState> emit) async {
    emit(
      state.copyWith(
        theStates: TheStates.loading,
      ),
    );
    try {
      final searchResults =
          await _searchRepository.getSearchResults(event.searchQuery);
      emit(
        state.copyWith(
          theStates: TheStates.success,
          result: searchResults,
          recentSearchQueriesList: [
            event.searchQuery,
            ...state.recentSearchQueriesList,
          ],
        ),
      );
    } catch (e) {
      log("Search Event Error: $e");
      emit(
        state.copyWith(
          theStates: TheStates.failure,
          result: SearchRes(),
          recentSearchQueriesList: [
            ...state.recentSearchQueriesList,
          ],
        ),
      );
    }
  }

  Future<void> _onSearchCleared(
      SearchQueryCleared event, Emitter<SearchState> emit) async {
    emit(
      state.copyWith(
        theStates: TheStates.loading,
      ),
    );
    try {
      emit(
        state.copyWith(
          theStates: TheStates.success,
          result: SearchRes(),
        ),
      );
    } catch (e) {
      log("Search Clear Event Error: $e");
      emit(
        state.copyWith(
          theStates: TheStates.failure,
          result: SearchRes(),
        ),
      );
    }
  }
}
