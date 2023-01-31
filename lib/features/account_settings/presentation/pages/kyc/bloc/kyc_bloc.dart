import 'package:bloc/bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/get_kyc_res.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/repositories/kyc_repositories.dart';
import 'package:equatable/equatable.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final repositories = KycRepositories();
  KycBloc() : super(KycInitial()) {
    on<KycInitiated>(
      (event, emit) async {
        try {
          emit(KycInitial());
          final x = await repositories.createKyc(event.createKycReq);
          if (x['status'] == 'success') {
            emit(
              KycCreateSuccess(
                id: x['id'] as int,
              ),
            );
          }
        } catch (e) {
          emit(
            KycCreateFailure(),
          );
        }
      },
    );

    on<KycAdded>(
      (event, emit) async {
        try {
          emit(
            KycInitial(),
          );
          final x = await repositories.addKyc(event.addKycReq);
          if (x['status'] == 'success') {
            emit(
              KycAddSuccess(),
            );
          }
        } catch (e) {
          emit(
            KycAddFailure(),
          );
        }
      },
    );

    on<KycLoaded>(
      (event, emit) async {
        try {
          emit(
            KycInitial(),
          );
          final x = await repositories.getKyc();
          if (x.isNotEmpty) {
            emit(
              KycLoadSuccess(
                list: x.map((e) => GetKycRes.fromJson(e)).toList(),
              ),
            );
          }
        } catch (e) {
          emit(
            KycLoadFailure(),
          );
        }
      },
    );
  }
}
