// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scrolling_bloc.dart';

@immutable
abstract class ScrollingEvent extends Equatable {}

class SetToInitialEvent extends ScrollingEvent {
  @override
  List<Object?> get props => [];
}

class FetchListEvent extends ScrollingEvent {
  final bool newFetch;
  final int pageNum;
  FetchListEvent({
    required this.newFetch,
    this.pageNum = 1,
  });
  @override
  List<Object?> get props => [
        newFetch,
        pageNum,
      ];
}

abstract class ScrollRepo {
  Future<dynamic> fetchItems(
    String url,
    int pageNum,
  );
}

class ScrollRepoImpl implements ScrollRepo {
  final _dio = DioHelper();
  @override
  Future fetchItems(String url, int pageNum) async =>
      await _dio.getDatawithCredential(
        url: "url",
        token: CacheHelper.accessToken,
        query: {
          "page": pageNum,
        },
      );
}
