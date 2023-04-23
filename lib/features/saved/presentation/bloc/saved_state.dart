part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final TheStates? theStates;
  final SavedModelRes? savedModelRes;
  final SavedAddRes? savedAddRes;
  final bool? isAdded;
  const SavedState({
    this.theStates = TheStates.initial,
    this.savedModelRes,
    this.savedAddRes,
    this.isAdded = false,
  });
  @override
  List<Object?> get props => [
        theStates,
        savedModelRes,
        savedAddRes,
        isAdded,
      ];

  SavedState copyWith({
    TheStates? theStates,
    SavedModelRes? savedModelRes,
    SavedAddRes? savedAddRes,
    bool? isAdded,
  }) {
    return SavedState(
      theStates: theStates ?? this.theStates,
      savedModelRes: savedModelRes ?? this.savedModelRes,
      savedAddRes: savedAddRes ?? this.savedAddRes,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}
