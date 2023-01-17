part of 'support_help_bloc.dart';

abstract class SupportHelpEvent extends Equatable {
  const SupportHelpEvent();
}

class SupportHelpInitiated extends SupportHelpEvent {
  @override
  List<Object?> get props => [];
}
