part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final TheStates? theStates;
  final SavedModelRes? savedModelRes;
  SavedState({
    this.theStates = TheStates.initial,
    this.savedModelRes,
  });
  @override
  List<Object?> get props => [theStates, savedModelRes];

  SavedState copyWith({
    TheStates? theStates,
    SavedModelRes? savedModelRes,
  }) {
    return SavedState(
      theStates: theStates ?? this.theStates,
      savedModelRes: savedModelRes ?? this.savedModelRes,
    );
  }
}
