// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'support_help_bloc.dart';

abstract class SupportHelpState extends Equatable {
  const SupportHelpState();
}

class SupportHelpInitial extends SupportHelpState {
  @override
  List<Object?> get props => [];
}

class SupportHelpSuccess extends SupportHelpState {
  final SupportHelpRes supportHelpRes;
  const SupportHelpSuccess({
    required this.supportHelpRes,
  });
  @override
  List<Object?> get props => [supportHelpRes];
}

class SupportHelpFailure extends SupportHelpState {
  @override
  List<Object?> get props => [];
}
