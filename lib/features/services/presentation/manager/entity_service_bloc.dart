import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'entity_service_event.dart';
part 'entity_service_state.dart';

class EntityServiceBloc extends Bloc<EntityServiceEvent, EntityServiceState> {
  final repositories = ServicesRepositories();

  EntityServiceBloc() : super(EntityServiceState()) {
    on<EntityServiceInitiated>(
      (event, emit) async {
        emit(state.copyWith(theStates: TheStates.initial));
        try {
          await repositories
              .fetchEntityServices(page: event.page ?? 1, order: event.order, serviceId: event.serviceId)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    service: EntityServiceModel.fromJson(value),
                    isFilter: event.isFilter,
                    isBudgetSort: event.isBudgetSort,
                    isDateSort: event.isDateSort,
                  ),
                ),
              );
        } catch (e) {
          log("Service load error: $e");
          emit(state.copyWith(theStates: TheStates.failure));
        }
      },
    );

    on<FetchServicesList>(
      (event, emit) async {
        try {
          await repositories.fetchServiceCategoryList().then(
                (value) => emit(
                  state.copyWith(
                    servicesLoaded: true,
                    serviceList: value.map((e) => ServiceList.fromJson(e)).toList()
                      ..sort((a, b) => a.title!.compareTo(b.title!)),
                  ),
                ),
              );
        } catch (e) {
          log("Service List load error: $e");
          emit(state.copyWith(servicesLoaded: false));
        }
      },
    );
  }
}
