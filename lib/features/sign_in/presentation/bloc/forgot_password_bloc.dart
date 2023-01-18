import 'package:bloc/bloc.dart';
import 'package:cipher/features/sign_in/models/user_reset_create.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
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
          final x = await repository.resetPasswordwithPhone(
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
          final x = await repository.resetPasswordwithEmail(
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
  }
}
