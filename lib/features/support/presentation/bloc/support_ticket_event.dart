// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'support_ticket_bloc.dart';

@immutable
abstract class SupportTicketEvent extends Equatable {}

class SupportTicketInitialEvent extends SupportTicketEvent {
  @override
  List<Object?> get props => [];
}

class SupportTicketFetchInitiated extends SupportTicketEvent {
  final String supportTicketStatus;
  SupportTicketFetchInitiated({
    required this.supportTicketStatus,
  });

  SupportTicketFetchInitiated copyWith({
    String? supportTicketStatus,
  }) {
    return SupportTicketFetchInitiated(
      supportTicketStatus: supportTicketStatus ?? this.supportTicketStatus,
    );
  }

  @override
  List<Object> get props => [supportTicketStatus];
}

class SupportTicketCreateInitiated extends SupportTicketEvent {
  @override
  List<Object?> get props => [];
}
