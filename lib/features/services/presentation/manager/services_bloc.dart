import 'package:bloc/bloc.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:equatable/equatable.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final repositories = ServicesRepositories();
  ServicesBloc() : super(ServicesInitial()) {
    on<ServicesLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            ServicesLoading(),
          );
          await repositories.fetchServices(event.categoryId).then(
                (value) => emit(
                  ServicesLoadSuccess(
                    value
                        .map(
                          (e) => ServiceList.fromJson(e),
                        )
                        .toList(),
                  ),
                ),
              );
        } catch (e) {
          // print(e);
          emit(
            ServicesLoadFailure(),
          );
        }
      },
    );
  }
}
