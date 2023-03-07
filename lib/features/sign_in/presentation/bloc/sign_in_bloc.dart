import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/models/user_login_res.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
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
                SignInSuccess(userLoginRes: value),
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
}
