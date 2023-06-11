import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:cipher/features/user/data/repositories/user_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final respositories = UserRepositories();
  UserBloc()
      : super(
          const UserState(),
        ) {
    on<UserLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
              isCreated: false,
              isEdited: false,
            ),
          );
          await respositories.fetchUser().then(
            (value) {
              emit(state.copyWith(theStates: TheStates.success, taskerProfile: value));
            },
          );
        } catch (e) {
          log("User Load Error: $e");
          emit(state.copyWith(theStates: TheStates.failure));
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
                  state.copyWith(
                    theStates: TheStates.success,
                    isEdited: true,
                  ),
                ),
              )
              .whenComplete(
            () {
              CacheHelper.hasProfile = true;
              add(UserLoaded());
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
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
                  state.copyWith(
                    theStates: TheStates.success,
                    isEdited: true,
                  ),
                ),
              )
              .whenComplete(() => add(UserLoaded()));
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isEdited: false,
            ),
          );
          add(UserLoaded());
        }
      },
    );
  }
}
