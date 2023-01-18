// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'support_help_bloc.dart';

abstract class SupportHelpEvent extends Equatable {
  const SupportHelpEvent();
}

class SupportHelpInitiated extends SupportHelpEvent {
  final SupportHelpReq supportHelpReq;
  const SupportHelpInitiated({
    required this.supportHelpReq,
  });
  @override
  List<Object?> get props => [supportHelpReq];
}
