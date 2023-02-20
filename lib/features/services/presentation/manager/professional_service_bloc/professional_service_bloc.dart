import 'package:bloc/bloc.dart';
import 'package:cipher/features/services/data/models/professional_service_model.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:equatable/equatable.dart';

part 'professional_service_event.dart';
part 'professional_service_state.dart';

class ProfessionalServiceBloc
    extends Bloc<ProfessionalServiceEvent, ProfessionalServiceState> {
  final repo = ServicesRepositories();
  ProfessionalServiceBloc() : super(ProfessionalServiceInitial()) {
    on<ProfessionalLoadInitated>(
      (event, emit) async {
        try {
          emit(
            ProfessionalServiceInitial(),
          );
          await repo.fetchProfessionalService().then(
                (value) => emit(
                  ProfessionalServiceLoadSuccess(
                    model: ProfessionalServiceModel.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            ProfessionalServiceLoadFailure(),
          );
        }
      },
    );
  }
}
