part of 'scroll_bloc.dart';

@immutable
abstract class ScrollEvent extends Equatable {}

class FetchItemsEvent extends ScrollEvent {
  final String url;
  final Map<String, dynamic> data;
  final bool newFetch;

  FetchItemsEvent(this.url, this.data, this.newFetch);

  @override
  List<Object?> get props => [];
}
