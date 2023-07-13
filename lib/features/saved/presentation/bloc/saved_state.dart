part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final TheStates? theStates;
  final SavedModelRes? savedModelRes;
  final SavedAddRes? savedAddRes;
  final bool? isAdded;
  final String idToBeSaved;
  final bool isLastPage;

  const SavedState( {
    this.theStates = TheStates.initial,
    this.savedModelRes,
    this.savedAddRes,
    this.isAdded = false,
    this.idToBeSaved = '',
    this.isLastPage=false,
  });
  @override
  List<Object?> get props => [theStates, savedModelRes, savedAddRes, isAdded, idToBeSaved,isLastPage];

  SavedState copyWith({
    TheStates? theStates,
    SavedModelRes? savedModelRes,
    SavedAddRes? savedAddRes,
    bool? isAdded,
    String? idToBeSaved,
    bool? isLastPage,
  }) {
    return SavedState(
      theStates: theStates ?? this.theStates,
      savedModelRes: savedModelRes ?? this.savedModelRes,
      savedAddRes: savedAddRes ?? this.savedAddRes,
      isAdded: isAdded ?? this.isAdded,
      idToBeSaved: idToBeSaved ?? this.idToBeSaved,
      isLastPage: isLastPage ?? this.isLastPage
    );
  }
}
