import 'dart:developer';

import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'entity_service_event.dart';
part 'entity_service_state.dart';

class EntityServiceBloc extends Bloc<EntityServiceEvent, EntityServiceState> {
  final repositories = ServicesRepositories();
  EntityServiceBloc() : super(EntityServiceInitial()) {
    on<EntityServiceInitiated>(
      (event, emit) async {
        try {
          emit(
            EntityServiceInitial(),
          );
          await repositories.fetchEntityServices(page: event.page ?? 1).then(
                (value) => emit(
                  EntityServiceLoadSuccess(
                    EntityServiceModel.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          log("Service load error: $e");
          emit(
            EntityServiceLoadFailure(),
          );
        }
      },
    );
  }
}
