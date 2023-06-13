part of 'scroll_bloc.dart';

@immutable
abstract class ScrollEvent extends Equatable {}

class FetchItemsEvent extends ScrollEvent {
  final String url;
  final Map<String, dynamic> data;
  final bool newFetch;

  FetchItemsEvent({required this.url, required this.data, required this.newFetch});

  @override
  // TODO: implement props
  List<Object?> get props => [url, data, newFetch];
}
