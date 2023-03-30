// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final TheStates? theStates;
  final List? recentSearchQueriesList;
  final List<SearchResult>? filteredList;
  final String? cachedSearchQuery;

  SearchState({
    this.theStates,
    this.recentSearchQueriesList,
    this.filteredList,
    this.cachedSearchQuery,
  });

  SearchState copyWith({
    TheStates? theStates,
    List? recentSearchQueriesList,
    List<SearchResult>? filteredList,
    String? cachedSearchQuery,
  }) {
    return SearchState(
      theStates: theStates ?? this.theStates,
      recentSearchQueriesList:
          recentSearchQueriesList ?? this.recentSearchQueriesList,
      filteredList: filteredList ?? this.filteredList,
      cachedSearchQuery: cachedSearchQuery ?? this.cachedSearchQuery,
    );
  }

  @override
  List<Object?> get props =>
      [theStates, recentSearchQueriesList, filteredList, cachedSearchQuery];
}
