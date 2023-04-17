part of 'saved_bloc.dart';

@immutable
abstract class SavedEvent extends Equatable {}

class SavedListLoaded extends SavedEvent {
	@override
	List<Object?> get props => [];
}
