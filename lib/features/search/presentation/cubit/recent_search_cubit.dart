import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:dependencies/dependencies.dart';

part 'recent_search_state.dart';

class RecentSearchCubit extends Cubit<RecentSearchState> {
  RecentSearchCubit() : super(RecentSearchState());
  final _key = "recent_search";

  void addSearchList(String searchString) async {
    if (searchString.length != 0) {
      emit(
        state.copyWith(
          recentSearchList: [
            searchString,
            ...state.recentSearchList,
          ],
        ),
      );
      await persistState();
    }
  }

  void deleteSearchList(int index) async {
    var list = state.recentSearchList;
    list.removeAt(index);
    emit(
      state.copyWith(
        recentSearchList: list,
      ),
    );
    await persistState();
  }

  Future<void> persistState() async {
    await CacheHelper.setCachedString(
      _key,
      jsonEncode(state.recentSearchList),
    );
  }

  void loadPersistedState() async {
    final value = await CacheHelper.getCachedString(_key);
    final list = value != null ? jsonDecode(value) : [];
    emit(
      state.copyWith(
        recentSearchList: List<String>.from(
          list as Iterable,
        ),
      ),
    );
  }
}
