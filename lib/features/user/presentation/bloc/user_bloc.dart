import 'package:bloc/bloc.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/features/user/data/repositories/user_repositories.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final respositories = UserRepositories();
  UserBloc() : super(UserLoading()) {
    on<UserLoaded>(
      (event, emit) async {
        await respositories.fetchuser().then(
          (value) {
            if (value != null && value.isNotEmpty) {
              emit(
                UserLoadSuccess(
                  user: TaskerProfileRetrieveRes.fromJson(
                    value,
                  ),
                ),
              );
            } else {
              emit(
                UserLoadFailure(),
              );
            }
          },
        );
      },
    );

    on<UserAdded>(
      (event, emit) async {
        await respositories.adduser(event.req).then(
          (value) {
            if (value.isNotEmpty) {
              emit(
                UserLoadSuccess(
                  user: TaskerProfileRetrieveRes.fromJson(
                    value,
                  ),
                ),
              );
              add(
                UserLoaded(),
              );
            } else {
              emit(
                UserLoadFailure(),
              );
              add(
                UserLoaded(),
              );
            }
          },
        );
      },
    );

    on<UserEdited>(
      (event, emit) async {
        try {
          await respositories
              .edituser(event.req)
              .then(
                (value) => emit(
                  UserEditSuccess(),
                ),
              )
              .then(
                (value) => add(
                  UserLoaded(),
                ),
              );
        } catch (e) {
          emit(
            UserEditFailure(),
          );
          add(
            UserLoaded(),
          );
        }
      },
    );
  }
}
