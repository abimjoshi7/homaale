import 'dart:developer';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/data/search_result.dart';
import 'package:cipher/features/search/repositories/search_repository.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:dependencies/dependencies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository = SearchRepository();
  SearchBloc() : super(SearchState()) {
    on<SearchQueryInitiated>(
      (event, emit) async {
        try {
          final _unFilteredSearchList = await _searchRepository
              .fetchSearchQueryResults(searchQuery: event.searchQuery);
          log("unfiltered List: " + _unFilteredSearchList.toString());
          if (_unFilteredSearchList != null) {
            final List<SearchResult>? filteredSearchList =
                _searchRepository.filterSearchResults(_unFilteredSearchList);
            log('Search API Test: ${filteredSearchList}');
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
