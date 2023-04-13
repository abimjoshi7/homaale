import 'package:cipher/features/sign_up/data/models/otp_reset_verify_res.dart';
import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'otp_reset_verify_event.dart';
part 'otp_reset_verify_state.dart';

class OtpResetVerifyBloc
    extends Bloc<OtpResetVerifyEvent, OtpResetVerifyState> {
  final SignUpRepositories repositories;
  OtpResetVerifyBloc(this.repositories) : super(OtpResetVerifyInitial()) {
    on<OtpResetVerifyInitiated>(
      (event, emit) async {
        try {
          emit(OtpResetVerifyInitial());
          await repositories
              .verifyOTPSignUp(
                otpResetVerifyReq: event.initiateEvent,
              )
              .then(
                (value) => emit(
                  OtpResetVerifySuccess(
                    successState: value,
                  ),
                ),
              );
        } catch (e) {
          emit(
            OtpResetVerifyFailure(
              error: e.toString(),
            ),
          );
        }
      },
    );
    on<OtpResendSignUpInitiated>((event, emit) async {
      try {
        await repositories.resendOTPSignUp(
          phoneNumber: event.phoneNumber,
        );
        // emit(OtpResendSignUpSuccess());
      } catch (e) {}
    });
  }
}
