import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/services/data/models/add_service_req.dart';
import 'package:cipher/features/services/data/models/add_service_res.dart';
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final repositories = ServicesRepositories();
  ServicesBloc()
      : super(
          const ServicesState(),
        ) {
    on<ServicesLoadInitiated>(
      (event, emit) async {
        try {
          emit(state.copyWith(theStates: TheStates.initial));
          await repositories.fetchServiceCategoryList(event.categoryId).then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    isServiceListLoaded: true,
                    serviceList: value.map((e) => ServiceList.fromJson(e)).toList()
                      ..sort((a, b) => a.title!.compareTo(b.title!)),
                  ),
                ),
              );
        } catch (e) {
          print(e);
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isServiceListLoaded: false,
            ),
          );
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
