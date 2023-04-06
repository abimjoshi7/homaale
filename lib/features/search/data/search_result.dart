import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:dependencies/dependencies.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
	const SearchResult._();
	const factory SearchResult.taskerProfileResult(TaskerProfile taskerProfile) = _TaskerProfileResult;
	const factory SearchResult.taskEntityServiceResult(TaskEntityService taskEntityService) = _TaskEntityServiceResult;

}
