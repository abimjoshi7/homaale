// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'support_ticket_bloc.dart';

@immutable
class SupportTicketState extends Equatable {
  final TheStates? theStates;
  final List<SupportTicketModel>? supportTicketList;
  final bool isTicketClosed;
  SupportTicketState({
    this.theStates = TheStates.initial,
    this.supportTicketList,
    this.isTicketClosed = false,
  });

  SupportTicketState copyWith({
    TheStates? theStates,
    List<SupportTicketModel>? supportTicketList,
    bool? isTicketClosed,
  }) {
    return SupportTicketState(
      theStates: theStates ?? this.theStates,
      supportTicketList: supportTicketList ?? this.supportTicketList,
      isTicketClosed: isTicketClosed ?? this.isTicketClosed,
    );
  }

  @override
  List<Object?> get props => [theStates, supportTicketList, isTicketClosed];
}
