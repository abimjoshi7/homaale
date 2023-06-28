// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recent_search_cubit.dart';

@immutable
class RecentSearchState extends Equatable {
  final List<String> recentSearchList;
  RecentSearchState({
    this.recentSearchList = const [],
  });

  RecentSearchState copyWith({
    List<String>? recentSearchList,
  }) {
    return RecentSearchState(
      recentSearchList: recentSearchList ?? this.recentSearchList,
    );
  }

  @override
  List<Object> get props => [recentSearchList];
}
