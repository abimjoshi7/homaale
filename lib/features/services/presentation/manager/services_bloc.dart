import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/services/data/models/add_service_req.dart';
import 'package:cipher/features/services/data/models/add_service_res.dart';
import 'package:cipher/features/services/data/models/my_created_services_res.dart';
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final repositories = ServicesRepositories();
  ServicesBloc() : super(ServicesInitial()) {
    on<ServicesLoadInitiated>(
      (event, emit) async {
        try {
          // emit(
          //   ServicesLoading(),
          // );
          // await repositories.fetchServices(event.categoryId).then(
          //       (value) => emit(
          //         ServicesLoadSuccess(
          //           value
          //               .map(
          //                 (e) => ServiceList.fromJson(e),
          //               )
          //               .toList()
          //             ..sort(
          //               (a, b) => a.title!.compareTo(
          //                 b.title!,
          //               ),
          //             ),
          //         ),
          //       ),
          //     );
        } catch (e) {
          // emit(
          // ServicesLoadFailure(),
          // );
        }
      },
    );

    on<ServicesAddInitiated>(
      (event, emit) async {
        try {
          // emit(
          //   state.copyWith(
          //     theStates: TheStates.initial,
          //   ),
          // );
          // await repositories.addEntityService(event.addServiceReq).then(
          //       (value) => emit(
          //         ServicesAddSuccess(
          //           AddServiceRes.fromJson(
          //             value,
          //           ),
          //         ),
          //       ),
          //     );
        } catch (e) {
          // emit(
          //   state.copyWith(
          //     theStates: TheStates.failure,
          //   ),
          // );
        }
      },
    );
  }
}
