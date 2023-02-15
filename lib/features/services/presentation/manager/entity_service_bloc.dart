import 'package:cipher/features/services/data/models/entity_service.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          await repositories.fetchEntityServices(event.id).then(
                (value) => emit(
                  EntityServiceLoadSuccess(
                    EntityService.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            EntityServiceLoadFailure(),
          );
        }
      },
    );
  }
}
