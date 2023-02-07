import 'package:bloc/bloc.dart';
import 'package:cipher/features/services/data/models/entity_service.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:equatable/equatable.dart';

part 'single_entity_service_state.dart';

class SingleEntityServiceCubit extends Cubit<SingleEntityServiceState> {
  final repo = ServicesRepositories();
  SingleEntityServiceCubit() : super(SingleEntityServiceInitial());

  Future getSingleEntity(String id) async {
    try {
      emit(
        SingleEntityServiceInitial(),
      );
      await repo
          .fetchSingleEntityServices(
            serviceId: id,
          )
          .then(
            (value) => emit(
              SingleEntityServiceLoadSuccess(
                Result.fromJson(value),
              ),
            ),
          );
    } catch (e) {
      emit(
        SingleEntityServiceLoadFailure(),
      );
    }
  }
}
