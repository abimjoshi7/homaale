part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final TheStates? theStates;
  final List? recentSearchQueriesList;
  final List<SearchResult>? filteredList;
  final String? cachedSearchQuery;
  final SearchRes? result;

  SearchState({
    this.theStates = TheStates.initial,
    this.recentSearchQueriesList,
    this.filteredList,
    this.cachedSearchQuery,
    this.result,
  });

  SearchState copyWith({
    TheStates? theStates,
    List? recentSearchQueriesList,
    List<SearchResult>? filteredList,
    String? cachedSearchQuery,
    SearchRes? result,
  }) {
    return SearchState(
      theStates: theStates ?? this.theStates,
      recentSearchQueriesList:
          recentSearchQueriesList ?? this.recentSearchQueriesList,
      filteredList: filteredList ?? this.filteredList,
      cachedSearchQuery: cachedSearchQuery ?? this.cachedSearchQuery,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      recentSearchQueriesList,
      filteredList,
      cachedSearchQuery,
      result,
    ];
  }
}
