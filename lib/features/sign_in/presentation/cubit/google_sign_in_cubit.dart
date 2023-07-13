// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/app/initial_data_fetch.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit(
    this._googleSignIn,
    this.repository,
  ) : super(GoogleSignInState());

  final GoogleSignIn _googleSignIn;
  final SignInRepository repository;

  Future<void> signIn(BuildContext context) async {
    try {
      emit(
        state.copyWith(
          states: TheStates.loading,
        ),
      );

      final result = await _googleSignIn.signIn();
      final authentication = await result?.authentication;
      if (authentication?.idToken != null) {
        final idToken = authentication!.idToken;
        final x = await repository.sendGoogleLoginReq({'credential': idToken});
        if (x.access != null) {
          CacheHelper.hasProfile = x.hasProfile;
          CacheHelper.accessToken = x.access;
          CacheHelper.refreshToken = x.refresh;
          CacheHelper.isLoggedIn = true;

          // fetch user details
          if (CacheHelper.hasProfile ?? false) {
            userDetailsFetch(context);
          }

          // fetch data for app
          fetchDataForForms(context);
        }
        emit(
          state.copyWith(
            states: TheStates.loading,
            isLoggedIn: true,
          ),
        );
        // else {
        //   setState(() {
        //     isLoading = false;
        //   });
        //   if (!mounted) return;
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Cannot Sign in. Please try again'),
        //     ),
        //   );
        // }
      }
    } catch (e) {
      emit(
        state.copyWith(
          states: TheStates.failure,
          isLoggedIn: false,
        ),
      );
      if (kDebugMode) {
        print('Google Sign-In Error');
      }
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      CacheHelper.isLoggedIn = true;
      await _googleSignIn.signOut().then((value) => emit(state.copyWith(
            states: TheStates.success,
            isLoggedIn: false,
          )));
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-Out Error');
      }
      emit(
        state.copyWith(
          states: TheStates.failure,
          isLoggedIn: true,
        ),
      );
      throw Exception("Google Sign-Out Error");
    }
  }
}
