part of 'privacy_policy_cubit.dart';

class PrivacyPolicyState extends Equatable {
  final ContentClient? contentClient;
  final TheStates? theStates;
  const PrivacyPolicyState({
    this.contentClient,
    this.theStates,
  });
  PrivacyPolicyState copyWith({
    ContentClient? contentClient,
    TheStates? theStates,
  }) {
    return PrivacyPolicyState(
      contentClient: contentClient ?? this.contentClient,
      theStates: theStates ?? this.theStates,
    );
  }

  @override
  List<Object?> get props => [contentClient, theStates];
}
