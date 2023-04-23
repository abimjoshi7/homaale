import 'package:dependencies/dependencies.dart';

part 'edit_booking_res.freezed.dart';
part 'edit_booking_res.g.dart';

@freezed
class EditBookingRes with _$EditBookingRes {
  const factory EditBookingRes({
    String? status,
    String? description,
    List<String>? requirements,
    String? budgetFrom,
    String? budgetTo,
    DateTime? startDate,
    DateTime? endDate,
    String? startTime,
    String? endTime,
    String? location,
    bool? isActive,
    dynamic extraData,
    String? createdBy,
    dynamic bookingMerchant,
    String? entityService,
    int? city,
    List<int>? images,
    List<int>? videos,
  }) = _EditBookingRes;

  factory EditBookingRes.fromJson(Map<String, dynamic> json) =>
      _$EditBookingResFromJson(json);
}
