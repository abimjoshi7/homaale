import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/models/user_login_res.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> with HydratedMixin {
  final _signInRepository = SignInRepository();
  SignInBloc() : super(SignInPhoneInitial()) {
    on<SignOutInitiated>(
      (event, emit) async {
        await CacheHelper.clearAllCachedData().whenComplete(
          () => emit(
            SignInPhoneInitial(),
          ),
        );
      },
    );

    on<SignInWithPhoneSelected>(
      (event, emit) => emit(
        SignInPhoneInitial(),
      ),
    );
    on<SignInWithEmailSelected>(
      (event, emit) => emit(
        SignInEmailInitial(),
      ),
    );
    on<SignInWithPhoneInitiated>(
      (event, emit) async {
        try {
          emit(
            SignInPhoneInitial(),
          );
          await _signInRepository.initiateSignIn(event.userLoginReq).then(
            (value) {
              emit(
                SignInSuccess(
                  userLoginRes: value,
                ),
              );
              CacheHelper.accessToken = value.access;
              CacheHelper.refreshToken = value.refresh;
            },
          );
        } catch (e) {
          emit(
            SignInFailure(),
          );
        }
      },
    );

    on<SignInWithEmailInitiated>(
      (event, emit) async {
        try {
          emit(
            SignInEmailInitial(),
          );
          await _signInRepository.initiateSignIn(event.userLoginReq).then(
            (value) {
              emit(
                SignInSuccess(
                  userLoginRes: value,
                ),
              );
              CacheHelper.accessToken = value.access;
              CacheHelper.refreshToken = value.refresh;
            },
          );
        } catch (e) {
          emit(
            SignInFailure(),
          );
        }
      },
    );
  }

  @override
  SignInState? fromJson(Map<String, dynamic> json) {
    try {
      final userLoginRes = json['value'] as UserLoginRes;
      return SignInSuccess(
        userLoginRes: userLoginRes,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Map<String, dynamic>? toJson(SignInState state) {
    // print("Hydrated State: $state");
    if (state is SignInSuccess) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
