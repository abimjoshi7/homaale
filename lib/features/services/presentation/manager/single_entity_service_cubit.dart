import 'package:bloc/bloc.dart';
import 'package:cipher/features/services/data/models/service_model.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:equatable/equatable.dart';

part 'single_entity_service_state.dart';

class SingleEntityServiceCubit extends Cubit<SingleEntityServiceState> {
  final repo = ServicesRepositories();
  SingleEntityServiceCubit() : super(SingleEntityServiceInitial());

  Future getSingleService(String id) async {
    try {
      emit(
        SingleEntityServiceInitial(),
      );
      await repo
          .fetchSingleService(
            serviceId: id,
          )
          .then(
            (value) => emit(
              SingleEntityServiceLoadSuccess(
                ServiceModel.fromJson(
                  value,
                ),
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
