import 'package:bloc/bloc.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_req.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final SignInRepository repository;

  ForgotPasswordBloc(this.repository) : super(ForgotPasswordInitial()) {
    on<ForgotPasswordPhoneInitiated>(
      (event, emit) async {
        try {
          emit(
            ForgotPasswordInitial(),
          );
          final x = await repository.resetPasswordWithPhone(
            phone: event.phone,
          );
          if (x['status'] == 'success') {
            emit(
              ForgotPasswordWithPhoneSuccess(),
            );
          }
        } catch (e) {
          emit(
            ForgotPasswordFailure(
              error: e.toString(),
            ),
          );
        }
      },
    );

    on<ForgotPasswordEmailInitiated>(
      (event, emit) async {
        try {
          emit(
            ForgotPasswordInitial(),
          );
          final x = await repository.resetPasswordWithEmail(
            email: event.email,
          );
          if (x['status'] == 'success') {
            emit(
              ForgotPasswordWithEmailSuccess(),
            );
          }
        } catch (e) {
          emit(
            ForgotPasswordFailure(
              error: e.toString(),
            ),
          );
        }
      },
    );

    on<ForgotPasswordPhoneResetInitiated>((event, emit) async {
      try {
        await repository
            .verifyOtpReset(
              event.otpResetVerifyReq,
            )
            .then(
              (value) => emit(
                ForgotPasswordResetSuccess(),
              ),
            );
      } catch (e) {
        emit(
          ForgotPasswordResetFailure(),
        );
      }
    });
  }
}
