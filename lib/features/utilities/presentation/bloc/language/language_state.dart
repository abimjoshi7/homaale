// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  @override
  List<Object?> get props => [];
}

class LanguageLoadSuccess extends LanguageState {
  final List<LanguageModel> language;
  const LanguageLoadSuccess({
    required this.language,
  });
  @override
  List<Object?> get props => [language];
}

class LanguageLoadFailure extends LanguageState {
  @override
  List<Object?> get props => [];
}
