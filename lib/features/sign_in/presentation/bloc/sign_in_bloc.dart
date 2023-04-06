import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/models/user_login_res.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final _signInRepository = SignInRepository();
  SignInBloc() : super(SignInState()) {
    on<SignOutInitiated>(
      (event, emit) async {
        await CacheHelper.clearAllCachedData().whenComplete(
          () => emit(
            state.copyWith(
              theStates: TheStates.initial,
              isPhoneNumber: true,
              hasValidationErrors: false,
            ),
          ),
        );
      },
    );

    on<SignInWithPhoneSelected>(
      (event, emit) => emit(
        state.copyWith(
          theStates: TheStates.initial,
          isPhoneNumber: true,
        ),
      ),
    );
    on<SignInWithEmailSelected>(
      (event, emit) => emit(
        state.copyWith(
          theStates: TheStates.initial,
          isPhoneNumber: false,
        ),
      ),
    );
    on<SignInWithPhoneInitiated>(
      (event, emit) async {
        try {
          await _signInRepository.initiateSignIn(event.userLoginReq).then(
            (value) {
              CacheHelper.isLoggedIn = true;
              emit(
                state.copyWith(
                  userLoginRes: value,
                  theStates: TheStates.success,
                  isPhoneNumber: true,
                  hasValidationErrors: false,
                ),
              );
              CacheHelper.accessToken = value.access;
              CacheHelper.refreshToken = value.refresh;
            },
          );
        } catch (e) {
          CacheHelper.isLoggedIn = false;
          emit(state.copyWith(
            theStates: TheStates.failure,
            isPhoneNumber: true,
            hasValidationErrors: false,
          ));
        }
      },
    );

    on<SignInWithEmailInitiated>(
      (event, emit) async {
        try {
          await _signInRepository.initiateSignIn(event.userLoginReq).then(
            (value) {
              CacheHelper.isLoggedIn = true;
              emit(state.copyWith(
                userLoginRes: value,
                theStates: TheStates.success,
                isPhoneNumber: false,
                hasValidationErrors: false,
              ));

              CacheHelper.accessToken = value.access;
              CacheHelper.refreshToken = value.refresh;
            },
          );
        } catch (e) {
          CacheHelper.isLoggedIn = false;
          emit(state.copyWith(
            theStates: TheStates.failure,
            isPhoneNumber: false,
            hasValidationErrors: false,
          ));
        }
      },
    );
    on<SignInValErrorStatusChanged>(
      ((event, emit) {
        emit(
          state.copyWith(
            theStates: TheStates.initial,
            hasValidationErrors: true,
          ),
        );
      }),
    );
    on<SignInWithoutCredentials>((event, emit) {
      CacheHelper.isLoggedIn = false;
      emit(
        state.copyWith(
          theStates: TheStates.success,
        ),
      );
    });
  }
}


