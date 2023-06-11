part of 'scroll_bloc.dart';

@immutable
class ScrollState extends Equatable {
  final TheStates theState;
  final List<dynamic> result;
  final String? next;
  final bool hasReachedMax;
  final int pageIndex;

  const ScrollState({
    this.theState = TheStates.initial,
    this.result = const [],
    this.next = null,
    this.hasReachedMax = false,
    this.pageIndex = 1,
  });

  ScrollState copyWith({
    TheStates? theState,
    List<dynamic>? result,
    String? next,
    bool? hasReachedMax,
    int? pageIndex,
  }) {
    return ScrollState(
      theState: theState ?? this.theState,
      result: result ?? this.result,
      next: next ?? this.next,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      result,
      next,
      hasReachedMax,
      pageIndex,
    ];
  }
}
