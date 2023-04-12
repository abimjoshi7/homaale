part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final TheStates? states;
  final List<ChatPersonDetails>? rCl;

  const ChatState({
    this.states = TheStates.initial,
    this.rCl,
  });

  ChatState copyWith({
    TheStates? states,
    List<ChatPersonDetails>? rCl,
  }) {
    return ChatState(
      states: states ?? this.states,
      rCl: rCl ?? this.rCl,
    );
  }

  @override
  List<Object?> get props => [states, rCl];
}
