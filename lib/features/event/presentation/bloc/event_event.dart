// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class EventRetrieveInitiated extends EventEvent {
  final String id;
  const EventRetrieveInitiated({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}
