// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'support_ticket_bloc.dart';

@immutable
class SupportTicketState extends Equatable {
  final TheStates? theStates;
  final List<SupportTicketModel>? supportTicketList;
  SupportTicketState({
    this.theStates = TheStates.initial,
    this.supportTicketList,
  });

  SupportTicketState copyWith({
    TheStates? theStates,
    List<SupportTicketModel>? supportTicketList,
    String? status,
  }) {
    return SupportTicketState(
      theStates: theStates ?? this.theStates,
      supportTicketList: supportTicketList ?? this.supportTicketList,
    );
  }

  @override
  List<Object?> get props => [theStates, supportTicketList];
}
