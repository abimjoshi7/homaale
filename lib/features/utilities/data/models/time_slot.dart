// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimeSlot {
  final int id;
  final DateTime? startTime;
  final DateTime? endTime;

  TimeSlot({
    required this.id,
    this.startTime,
    this.endTime,
  });

  @override
  String toString() =>
      'TimeSlot(id: $id, startTime: $startTime, endTime: $endTime)';

  @override
  bool operator ==(covariant TimeSlot other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => id.hashCode ^ startTime.hashCode ^ endTime.hashCode;

  TimeSlot copyWith({
    int? id,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return TimeSlot(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
