// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'terms_of_use_cubit.dart';

class TermsOfUseState extends Equatable {
  final ContentClient? contentClient;
  final TheStates? theStates;

  const TermsOfUseState({
    this.contentClient,
    this.theStates = TheStates.initial,
  });
  TermsOfUseState copyWith({
    ContentClient? contentClient,
    TheStates? theStates,
  }) {
    return TermsOfUseState(
      contentClient: contentClient ?? this.contentClient,
      theStates: theStates ?? this.theStates,
    );
  }

  @override
  List<Object?> get props => [contentClient, theStates];
}
