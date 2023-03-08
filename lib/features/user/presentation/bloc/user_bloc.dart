import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/features/user/data/repositories/user_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final respositories = UserRepositories();
  UserBloc() : super(UserLoading()) {
    on<UserLoaded>(
      (event, emit) async {
        try {
          emit(
            UserLoading(),
          );
          await respositories.fetchUser().then(
            (value) {
              if (value != null && value.isNotEmpty) {
                emit(
                  UserLoadSuccess(
                    user: TaskerProfileRetrieveRes.fromJson(
                      value,
                    ),
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            UserLoadFailure(),
          );
        }
      },
    );

    on<UserAdded>(
      (event, emit) async {
        try {
          await respositories
              .addUser(event.req)
              .then(
                (value) => emit(
                  UserAddSuccess(),
                ),
              )
              .whenComplete(
            () {
              CacheHelper.hasProfile = true;
              add(
                UserLoaded(),
              );
            },
          );
        } catch (e) {
          emit(
            UserAddFailure(),
          );
        }
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
              .whenComplete(
                () => add(
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
