part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final TheStates? theStates;
  final SavedModelRes? savedModelRes;
  final SavedAddRes? savedAddRes;
  const SavedState({
    this.theStates = TheStates.initial,
    this.savedModelRes,
    this.savedAddRes,
  });
  @override
  List<Object?> get props => [
        theStates,
        savedModelRes,
        savedAddRes,
      ];

  SavedState copyWith({
    TheStates? theStates,
    SavedModelRes? savedModelRes,
    SavedAddRes? savedAddRes,
  }) {
    return SavedState(
      theStates: theStates ?? this.theStates,
      savedModelRes: savedModelRes ?? this.savedModelRes,
      savedAddRes: savedAddRes ?? this.savedAddRes,
    );
  }
}
