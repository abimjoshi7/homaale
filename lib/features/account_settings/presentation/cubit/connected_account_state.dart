// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connected_account_cubit.dart';

@immutable
class ConnectedAccountState extends Equatable {
  final TheStates states;
  final List<ConnectedAccount> accountList;
  ConnectedAccountState({
    this.states = TheStates.initial,
    this.accountList = const [],
  });

  ConnectedAccountState copyWith({
    TheStates? states,
    List<ConnectedAccount>? accountList,
  }) {
    return ConnectedAccountState(
      states: states ?? this.states,
      accountList: accountList ?? this.accountList,
    );
  }

  @override
  List<Object?> get props => [states, accountList];
}
