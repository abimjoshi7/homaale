// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'google_sign_in_cubit.dart';

@immutable
class GoogleSignInState extends Equatable {
  final TheStates states;
  final bool isLoggedIn;
  GoogleSignInState({
    this.states = TheStates.initial,
    this.isLoggedIn = false,
  });

  GoogleSignInState copyWith({
    TheStates? states,
    bool? isLoggedIn,
  }) {
    return GoogleSignInState(
      states: states ?? this.states,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object> get props => [states, isLoggedIn];
}
