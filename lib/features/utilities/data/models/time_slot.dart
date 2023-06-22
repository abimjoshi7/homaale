// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimeSlot {
  final int? index;
  final DateTime? startTime;
  final DateTime? endTime;

  TimeSlot({
    this.index,
    this.startTime,
    this.endTime,
  });

  @override
  String toString() =>
      'TimeSlot(index: $index, startTime: $startTime, endTime: $endTime)';

  TimeSlot copyWith({
    int? index,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return TimeSlot(
      index: index ?? this.index,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
