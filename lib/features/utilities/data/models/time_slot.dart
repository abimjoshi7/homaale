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

  @override
  bool operator ==(covariant TimeSlot other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => index.hashCode ^ startTime.hashCode ^ endTime.hashCode;
}
