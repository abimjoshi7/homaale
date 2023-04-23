
import 'package:dependencies/dependencies.dart';

part 'saved_add_res.freezed.dart';
part 'saved_add_res.g.dart';

@freezed
class SavedAddRes with _$SavedAddRes {
    const factory SavedAddRes({
        String? status,
        String? message,
    }) = _SavedAddRes;

    factory SavedAddRes.fromJson(Map<String, dynamic> json) => _$SavedAddResFromJson(json);
}
