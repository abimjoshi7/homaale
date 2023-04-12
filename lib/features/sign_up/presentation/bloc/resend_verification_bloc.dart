import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'resend_verification_event.dart';
part 'resend_verification_state.dart';

class ResendVerificationBloc
    extends Bloc<ResendVerificationEvent, ResendVerificationState> {
  final SignUpRepositories repository;
  ResendVerificationBloc(this.repository) : super(ResendVerificationInitial()) {
    on<ResendVerificationWithPhoneInititated>((event, emit) async {
      try {
        emit(ResendVerificationInitial());
        final x = await repository.resendOTPSignUp(phoneNumber: event.phone);

        emit(ResendVerificationWithPhoneSuccess());
      } catch (e) {
        emit(ResendVerificationFailure(error: e.toString()));
      }
    });
    on<ResendVerificationWithEmailInitiated>((event, emit) async {
      try {
        emit(ResendVerificationInitial());
        final x = await repository.resendEmailSignUp(email: event.email);

        emit(ResendVerificationWithEmailSuccess());
      } catch (e) {
        emit(ResendVerificationFailure(error: e.toString()));
      }
    });
  }
}
