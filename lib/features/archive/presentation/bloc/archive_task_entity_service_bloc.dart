import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'archive_task_entity_service_event.dart';
part 'archive_task_entity_service_state.dart';

class ArchiveTaskEntityServiceBloc
    extends Bloc<ArchiveTaskEntityServiceEvent, ArchiveTaskEntityServiceState> {
  final _repository = BookingRepositories();
  ArchiveTaskEntityServiceBloc() : super(ArchiveTaskEntityServiceState()) {
    on<ArchiveTaskInitiated>((event, emit) async {
      try {
        await _repository.archiveTaskEntityService(
          id: event.id,
        );
        emit(state.copyWith(theStates: TheStates.success));
      } catch (e) {
        emit(state.copyWith(
          theStates: TheStates.failure,
        ));
      }
    });
  }
}
