// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final TheStates? theStates;

  final List<SearchResult>? filteredList;
  SearchState({
    this.theStates,
    this.filteredList,
  });

  SearchState copyWith({
    TheStates? theStates,
    List<SearchResult>? filteredList,
  }) {
    return SearchState(
      theStates: theStates ?? this.theStates,
      filteredList: filteredList ?? this.filteredList,
    );
  }

  @override
  List<Object?> get props => [theStates, filteredList];
}
