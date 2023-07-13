import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/cubit/google_sign_in_cubit.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/loading_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});
  static const routeName = '/google-login';

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  bool isLoading = false;
  final storage = const FlutterSecureStorage();
  final googleSignCubit = locator<GoogleSignInCubit>();

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: isLoading,
      child: SignInScaffold(
        child: SizedBox.expand(
          child: Column(
            children: [
              addVerticalSpace(30),
              Image.asset('assets/logos/google_logo.png'),
              kHeight10,
              Text(
                'Login with Google',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              kHeight20,
              const Text('Homaale is requesting access to your Google.'),
              const Text("This doesn't let the app post to Google."),
              addVerticalSpace(50),
              const Text('Would you like to continue?'),
              addVerticalSpace(20),
              BlocListener<GoogleSignInCubit, GoogleSignInState>(
                bloc: googleSignCubit,
                listenWhen: (previous, current) {
                  if (previous.states != TheStates.success &&
                      current.states == TheStates.success) return true;
                  return false;
                },
                listener: (context, state) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Root.routeName,
                    (route) => false,
                  );
                },
                child: CustomElevatedButton(
                  callback: () async {
                    await googleSignCubit.signIn(context);
                  },
                  label: 'Continue',
                ),
              ),
              kHeight10,
              CustomElevatedButton(
                mainColor: Colors.white,
                textColor: const Color(0xff3D3F7D),
                callback: () async {
                  await googleSignCubit.signOut();
                  Navigator.pop(context);
                },
                label: 'Cancel',
              ),
              addVerticalSpace(60),
              const Text(
                'Privacy | Terms & Conditions',
                style: kText15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
