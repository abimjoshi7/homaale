part of 'scrolling_bloc.dart';

@immutable
class ScrollingState extends Equatable {
  final TheStates theState;
  final List<dynamic> result;
  final String? next;
  final bool hasReachedMax;
  final int pageIndex;

  const ScrollingState({
    this.theState = TheStates.initial,
    this.result = const [],
    this.next = null,
    this.hasReachedMax = false,
    this.pageIndex = 1,
  });

  ScrollingState copyWith({
    TheStates? theState,
    List<dynamic>? result,
    String? next,
    bool? hasReachedMax,
    int? pageIndex,
  }) {
    return ScrollingState(
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
