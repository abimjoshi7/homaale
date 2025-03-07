// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

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

      await _googleSignIn.signIn().then(
        (googleSignInAccount) async {
          if (kDebugMode) {
            print(await googleSignInAccount?.authHeaders);
          }
          if (googleSignInAccount != null)
            await googleSignInAccount.authentication.then(
              (value) async {
                if (value.idToken != null) {
                  print(value.idToken);
                  final idToken = value.idToken;
                  final x = await repository.sendGoogleLoginReq(
                    {
                      'credential': idToken,
                    },
                  );
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
                      states: TheStates.success,
                      isLoggedIn: true,
                    ),
                  );
                }
              },
            );
          print("access token: ${CacheHelper.accessToken}");
        },
      );
    } catch (e) {
      print(e.toString());
      emit(
        state.copyWith(
          states: TheStates.failure,
          isLoggedIn: false,
        ),
      );
      if (kDebugMode) {
        print('Google Sign-In Error');
      }
      throw Exception("Google Sign In Error: $e");
    }
  }

  Future<void> signOut() async {
    try {
      if (CacheHelper.isLoggedIn == true) {
        await _googleSignIn.signOut().then(
              (value) => emit(
                state.copyWith(
                  states: TheStates.success,
                  isLoggedIn: false,
                ),
              ),
            );
      } else
        return;
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-Out Error: $e');
      }
      emit(
        state.copyWith(
          states: TheStates.failure,
          isLoggedIn: true,
        ),
      );
      throw Exception("Google Sign-Out Error: $e");
    }
  }
}
