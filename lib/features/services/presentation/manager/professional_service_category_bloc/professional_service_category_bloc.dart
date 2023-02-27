import 'package:bloc/bloc.dart';
import 'package:cipher/features/services/data/models/professional_service_model.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:equatable/equatable.dart';

part 'professional_service_category_event.dart';
part 'professional_service_category_state.dart';

class ProfessionalServiceCategoryBloc extends Bloc<
    ProfessionalServiceCategoryEvent, ProfessionalServiceCategoryState> {
  final repo = ServicesRepositories();
  ProfessionalServiceCategoryBloc() : super(ProfessionalServiceInitial()) {
    on<ProfessionalServiceCategoryLoadInitated>(
      (event, emit) async {
        try {
          emit(
            ProfessionalServiceInitial(),
          );
          await repo.fetchProfessionalService().then(
                (value) => emit(
                  ProfessionalServiceCategoryLoadSuccess(
                    model: ProfessionalServiceCategoryModel.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            ProfessionalServiceCategoryLoadFailure(),
          );
        }
      },
    );
  }
}
