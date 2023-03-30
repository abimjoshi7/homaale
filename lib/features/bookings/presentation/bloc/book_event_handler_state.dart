part of 'book_event_handler_bloc.dart';

class BookEventHandlerState extends Equatable {
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final TimeSlot? timeSlot;
  final TheStates? states;
  final double? budget;
  final List<String>? requirements;
  final String? description;
  final List<int>? images;
  final List<int>? videos;
  const BookEventHandlerState({
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.timeSlot,
    this.states = TheStates.initial,
    this.budget,
    this.requirements,
    this.description,
    this.images,
    this.videos,
  });
  @override
  List<Object?> get props {
    return [
      startDate,
      endDate,
      startTime,
      endTime,
      timeSlot,
      states,
      budget,
      requirements,
      description,
      images,
      videos,
    ];
  }

  BookEventHandlerState copyWith({
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    TimeSlot? timeSlot,
    TheStates? states,
    double? budget,
    List<String>? requirements,
    String? description,
    List<int>? images,
    List<int>? videos,
  }) {
    return BookEventHandlerState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      timeSlot: timeSlot ?? this.timeSlot,
      states: states ?? this.states,
      budget: budget ?? this.budget,
      requirements: requirements ?? this.requirements,
      description: description ?? this.description,
      images: images ?? this.images,
      videos: videos ?? this.videos,
    );
  }
}
