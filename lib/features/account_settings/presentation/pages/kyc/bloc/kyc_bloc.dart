// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_list_res.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_model.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/repositories/kyc_repositories.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final KycRepositories repositories;
  KycBloc(
    this.repositories,
  ) : super(const KycState()) {
    on<KycProfileInitiated>((event, emit) async {
      List<Country> _countriesList = [];
      final x = await repositories.getCountriesList();
      log('kyc country test: $x');
      for (final country in x) {
        _countriesList.add(Country.fromJson(country as Map<String, dynamic>));
      }
      emit(state.copyWith(
        country: _countriesList,
      ));
    });
    on<KycInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.createKyc(event.createKycReq!).then(
                (value) => emit(
                  state.copyWith(
                    kycId: value["id"] as int,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              kycId: 0,
            ),
          );
        }
      },
    );

    on<KycAdded>(
      (event, emit) async {
        try {
          await repositories
              .addKyc(event.addKycReq!)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    kycId: null,
                    isCreated: true,
                  ),
                ),
              )
              .whenComplete(
                () => emit(
                  state.copyWith(
                    isCreated: false,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isCreated: false,
            ),
          );
        }
      },
    );

    on<KycModelLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            theStates: TheStates.loading,
          ),
        );
        await repositories.getKyc().then(
              (value) => emit(
                state.copyWith(
                  theStates: TheStates.success,
                  kycModel: KycModel.fromJson(value),
                ),
              ),
            );
      },
    );

    on<KycModelDeleted>(
      (event, emit) async {
        await repositories.deleteKyc().then(
          (value) {
            if (value["status"] == "success") {
              add(KycModelLoaded());
            }
          },
        );
      },
    );

    on<KycDocumentLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.getKycDocument().then(
            (value) {
              emit(
                state.copyWith(
                  list: value
                      .map(
                        (e) => KycListRes.fromJson(e),
                      )
                      .toList(),
                ),
              );
            },
          );
        } catch (e) {
          log("Kyc document load error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              list: [],
            ),
          );
        }
      },
    );

    on<KycDocTypeLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.fetchKycDocType().then(
            (value) {
              if (value.isNotEmpty)
                emit(
                  state.copyWith(
                    isDocLoaded: true,
                  ),
                );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              isDocLoaded: false,
            ),
          );
        }
      },
    );
  }
}
