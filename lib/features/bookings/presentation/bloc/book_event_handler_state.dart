// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_event_handler_bloc.dart';

class BookEventHandlerState extends Equatable {
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final String? description;
  final String? address;
  final TimeSlot? timeSlot;
  final TheStates states;
  final double? budget;
  final List<String>? requirements;
  final String city;
  final bool isTermAccepted;
  const BookEventHandlerState({
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.description,
    this.address,
    this.timeSlot,
    this.states = TheStates.initial,
    this.budget,
    this.requirements,
    this.city = kCityCode,
    this.isTermAccepted = false,
  });
  @override
  List<Object?> get props {
    return [
      startDate,
      endDate,
      startTime,
      endTime,
      description,
      address,
      timeSlot,
      states,
      budget,
      requirements,
      city,
      isTermAccepted,
    ];
  }

  BookEventHandlerState copyWith({
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? description,
    String? address,
    TimeSlot? timeSlot,
    TheStates? states,
    double? budget,
    List<String>? requirements,
    String? city,
    bool? isTermAccepted,
  }) {
    return BookEventHandlerState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
      address: address ?? this.address,
      timeSlot: timeSlot ?? this.timeSlot,
      states: states ?? this.states,
      budget: budget ?? this.budget,
      requirements: requirements ?? this.requirements,
      city: city ?? this.city,
      isTermAccepted: isTermAccepted ?? this.isTermAccepted,
    );
  }
}
