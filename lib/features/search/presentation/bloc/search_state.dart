// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final TheStates? theStates;
  final List? recentSearchQueriesList;
  final List<SearchResult>? filteredList;
  SearchState({
    this.theStates,
    this.recentSearchQueriesList,
    this.filteredList,
  });

  SearchState copyWith({
    TheStates? theStates,
    List? recentSearchQueriesList,
    List<SearchResult>? filteredList,
  }) {
    return SearchState(
      theStates: theStates ?? this.theStates,
      recentSearchQueriesList:
          recentSearchQueriesList ?? this.recentSearchQueriesList,
      filteredList: filteredList ?? this.filteredList,
    );
  }

  @override
  List<Object?> get props => [theStates, recentSearchQueriesList, filteredList];
}
