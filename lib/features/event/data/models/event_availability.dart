import 'package:dependencies/dependencies.dart';

part 'event_availability.freezed.dart';
part 'event_availability.g.dart';

@freezed
class EventAvailability with _$EventAvailability {
  const factory EventAvailability({
    String? date,
    String? start,
    String? end,
  }) = _EventAvailability;

  factory EventAvailability.fromJson(Map<String, dynamic> json) =>
      _$EventAvailabilityFromJson(json);
}
