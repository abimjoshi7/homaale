import 'package:cipher/features/services/data/models/add_service_req.dart';
import 'package:cipher/features/services/data/models/add_service_res.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  final repo = ServicesRepositories();
  AddServiceCubit() : super(AddServiceInitial());

  Future<void> addService(
    AddServiceReq addServiceReq,
  ) async {
    try {
      emit(
        AddServiceInitial(),
      );
      await repo.createTaskEntityService(addServiceReq).then(
            (value) => emit(
              AddServiceSuccess(
                res: AddServiceRes.fromJson(
                  value,
                ),
              ),
            ),
          );
    } catch (e) {
      emit(
        AddServiceFailure(),
      );
    }
  }
}
