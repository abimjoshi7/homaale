part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LanguageLoadInitiated extends LanguageEvent {
  @override
  List<Object?> get props => [];
}
