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
      ((event, emit) {
        emit(
          state.copyWith(theStates: TheStates.initial),
        );
      }),
    );
    on<SearchQueryCleared>(
      (event, emit) {
        try {
          emit(state.copyWith(
            theStates: TheStates.initial,
            filteredList: List.empty(),
          ));
        } catch (e) {
          log(e.toString());
        }
      },
    );
    on<SearchQueryInitiated>(
      (event, emit) async {
        try {
          final _unFilteredSearchList = await _searchRepository
              .fetchSearchQueryResults(searchQuery: event.searchQuery);

          if (_unFilteredSearchList != null) {
            final List<SearchResult>? filteredSearchList =
                _searchRepository.filterSearchResults(_unFilteredSearchList);
            String? x = _searchRepository.getCachedRecentSearchQueries(
                key: _key) as String?;
            if (x != null) {
              List<String> list = jsonDecode(x) as List<String>;
            }
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
