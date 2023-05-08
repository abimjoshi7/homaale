// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_doc_type.dart';
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
  ) : super(const KycState(theStates: TheStates.initial)) {
    on<KycProfileInitiated>((event, emit) async {
      List<Country> _countriesList = [];
      final kycRes = await repositories.getKyc();
      final _countries = await repositories.getCountriesList();
      for (final country in _countries) {
        _countriesList.add(Country.fromJson(country as Map<String, dynamic>));
      }
      log("RES: $kycRes");
      if (kycRes != null) {
        emit(
          state.copyWith(
            theStates: TheStates.initial,
            kycModel: KycModel.fromJson(kycRes),
            country: _countriesList,
          ),
        );
      }
      if (kycRes == null) {
        emit(state.copyWith(
          theStates: TheStates.initial,
          country: _countriesList,
        ));
      }
    });

    on<KycInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          final res = await repositories.createKyc(event.createKycReq!);
          if (res != null) {
            emit(
              state.copyWith(
                isCreated: true,
              ),
            );
          }
        } catch (e) {
          log("kyc error: $e");
          final String? err = await CacheHelper.getCachedString(kErrorLog);
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              errMsg: err,
            ),
          );
        }
      },
    );
    on<KycAdded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await repositories.addKyc(event.addKycReq!);

          emit(
            state.copyWith(
              theStates: TheStates.success,
              isCreated: false,
            ),
          );
        } catch (e) {
          final err = await CacheHelper.getCachedString(kErrorLog);
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isCreated: false,
              errMsg: err,
            ),
          );
          log("KYC added bloc called.");
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
                  kycModel: KycModel.fromJson(value!),
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
              if (value.isEmpty) return;
              List<KycDocType> _docTypeList = [];
              for (final kycDocType in value) {
                _docTypeList.add(KycDocType.fromJson(kycDocType));
              }
              emit(
                state.copyWith(
                  theStates: TheStates.initial,
                  isDocLoaded: true,
                  docTypeList: _docTypeList,
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
