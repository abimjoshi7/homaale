part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props;
}

class SearchFieldInitialEvent extends SearchEvent {
  @override
  List<Object> get props => [];
}

// class SearchFieldFocused extends SearchEvent {
//   @override
//   List<Object> get props => [];
// }

// class SearchFieldUnFocused extends SearchEvent {
//   @override
//   List<Object> get props => [];
// }

class SearchQueryInitiated extends SearchEvent {
  final String searchQuery;

  SearchQueryInitiated({required this.searchQuery});
  @override
  List<Object> get props => [searchQuery];
}

class SearchQueryCleared extends SearchEvent {
  @override
  List<Object> get props => [];
}

class RecentSearchQueryCleared extends SearchEvent {
  @override
  List<Object> get props => [];
}

class RecentSearchQueryIndexCleared extends SearchEvent {
  final int index;

  RecentSearchQueryIndexCleared({required this.index});
  @override
  List<Object> get props => [index];
}
