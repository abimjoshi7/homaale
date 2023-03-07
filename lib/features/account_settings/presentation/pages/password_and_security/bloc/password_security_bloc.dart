import 'package:cipher/features/account_settings/presentation/pages/password_and_security/models/password_security.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/repositories/password_security_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'password_security_event.dart';
part 'password_security_state.dart';

class PasswordSecurityBloc
    extends Bloc<PasswordSecurityEvent, PasswordSecurityState> {
  final PasswordSecurityRepositories passwordSecurityRepositories;
  PasswordSecurityBloc(this.passwordSecurityRepositories)
      : super(PasswordSecurityInitial()) {
    on<PasswordSecurityInitiated>(
      (event, emit) async {
        try {
          emit(
            PasswordSecurityInitial(),
          );
          await passwordSecurityRepositories
              .changePassword(event.passwordSecurity)
              .then(
                (value) => emit(
                  PasswordSecuritySuccess(
                    passwordSecurity: value,
                  ),
                ),
              );
        } catch (e) {
          emit(
            PasswordSecurityFailure(),
          );
        }
      },
    );
  }
}
