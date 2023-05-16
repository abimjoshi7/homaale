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
  ) : super(const KycState()) {
    on<KycProfileInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(
            theStates: TheStates.loading,
          ),
        );
        List<KycDocType> _docTypeList = [];
        List<Country> _countries = [];

        await repositories
            .fetchCountries()
            .then((value) => _countries.addAll(value));
        await repositories
            .getKycDocType()
            .then((value) => _docTypeList.addAll(value));

        if (_countries.isEmpty || _docTypeList.isEmpty) {
          emit(state.copyWith(
            docTypeList: _docTypeList.isEmpty ? [] : _docTypeList,
            country: _countries.isEmpty ? [] : _countries,
          ));
        } else
          emit(
            state.copyWith(
              // theStates: TheStates.initial,
              isNewDoc: false,
              docTypeList: _docTypeList,
              country: _countries,
            ),
          );
      } catch (e) {
        emit(state.copyWith(
          theStates: TheStates.failure,
          docTypeList: [],
          country: [],
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
          final res = await repositories.createKyc(event.createKycReq!).then(
                (value) => repositories.getKyc(),
              );

          log("RES: $res");
          emit(
            state.copyWith(
              theStates: TheStates.success,
              kycModel: KycModel.fromJson(res as Map<String, dynamic>),
              isProfileCreated: true,
              isProfileEdited: false,
            ),
          );
        } catch (e) {
          log("kyc error: $e");
          final String? err = await CacheHelper.getCachedString(kErrorLog);
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isProfileCreated: false,
              isProfileEdited: false,
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
              isDocCreated: true,
            ),
          );
        } catch (e) {
          final err = await CacheHelper.getCachedString(kErrorLog);
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isDocCreated: false,
              errMsg: err,
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

        await repositories.getKyc().then((value) {
          if (value == null) return;
          emit(
            state.copyWith(
              theStates: TheStates.success,
              kycModel: KycModel.fromJson(value),
              isProfileCreated: false,
              isProfileEdited: false,
            ),
          );
        });
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
              // log("kyc doc: $value");
              emit(
                state.copyWith(
                  list: value
                      .map(
                        (e) => KycListRes.fromJson(e as Map<String, dynamic>),
                      )
                      .toList(),
                  isDocCreated: false,
                  isDocEdited: false,
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
              isProfileEdited: false,
              isDocEdited: false,
            ),
          );
        }
      },
    );

    on<KycProfileEditLoaded>((event, emit) async {
      try {
        emit(
          state.copyWith(
            theStates: TheStates.loading,
          ),
        );
        await repositories.editKycProfile(event.editKycReq!);
        emit(
          state.copyWith(
            theStates: TheStates.success,
            isProfileEdited: true,
          ),
        );
        add(KycModelLoaded());
        add(KycDocumentLoaded());
      } catch (e) {
        log("KYC EDIT ERROR: $e");
        emit(
          state.copyWith(
            theStates: TheStates.failure,
            isProfileEdited: false,
          ),
        );
      }
    });
    on<KycDocEditInitiated>((event, emit) {
      emit(state.copyWith(
        theStates: TheStates.initial,
        kycId: event.kycId,
        isNewDoc: false,
      ));
    });
    on<KycDocEditLoaded>((event, emit) async {
      try {
        emit(
          state.copyWith(
            theStates: TheStates.loading,
          ),
        );
        await repositories.editKycDocument(
          id: event.id,
          editKycReq: event.editDocReq!,
        );
        emit(state.copyWith(
          theStates: TheStates.success,
          isDocEdited: true,
        ));
      } catch (e) {
        log("doc edit err: $e");
        final err = await CacheHelper.getCachedString(kErrorLog);
        emit(state.copyWith(
          theStates: TheStates.failure,
          isDocEdited: false,
          errMsg: err,
        ));
      }
    });
    on<KycAddNewDocInitiated>((event, emit) => emit(
          state.copyWith(isNewDoc: true),
        ));
    on<KycAddNewDocCancel>((event, emit) => emit(
          state.copyWith(isNewDoc: false),
        ));
  }
}
