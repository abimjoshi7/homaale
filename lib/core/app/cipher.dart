import 'package:cipher/core/app/bloc/theme_bloc.dart';
import 'package:cipher/core/route/app_router.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/cubit/deactivate_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/bloc/support_help_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/repositories/support_help_repositories.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/bloc/password_security_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/repositories/password_security_repositories.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Cipher extends StatelessWidget {
  const Cipher({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SupportHelpRepositories()..getHelpTopicList(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(
              SignUpRepositories(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoriesBloc()
              ..add(
                CategoriesHeroLoadInitiated(),
              ),
          ),
          // BlocProvider(
          //   create: (context) => HomeCubit(
          //     networkHelper: NetworkHelper(),
          //   )..fetchHeroCategory(),
          // ),
          BlocProvider(
            create: (context) => SignInBloc(SignInRepository()),
          ),
          BlocProvider(
            create: (context) => UserBloc()
              ..add(
                UserLoaded(),
              ),
          ),

          BlocProvider(
            create: (context) => TaskerPortfolioCubit()..getPortfolio(),
          ),
          BlocProvider(
            create: (context) => TaskerExperienceCubit()..getTaskerExperience(),
          ),
          BlocProvider(
            create: (context) => TaskerEducationCubit()..getTaskerEducation(),
          ),
          BlocProvider(
            create: (context) =>
                TaskerCertificationCubit()..getTaskerCertification(),
          ),
          BlocProvider(
            create: (context) => KycBloc()
              ..add(
                KycLoaded(),
              ),
          ),
          BlocProvider(
            create: (context) => ImageUploadCubit(),
          ),
          BlocProvider(
            create: (context) => SupportHelpBloc(
              SupportHelpRepositories(),
            ),
          ),
          BlocProvider(
            create: (context) => PasswordSecurityBloc(
              PasswordSecurityRepositories(),
            ),
          ),
          BlocProvider(
            create: (context) => ForgotPasswordBloc(
              SignInRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => OtpResetVerifyBloc(
              SignUpRepositories(),
            ),
          ),
          BlocProvider(
            create: (context) => DeactivateCubit(),
          ),
          BlocProvider(
            create: (context) => InterestsBloc()
              ..add(
                InterestLoadInitiated(),
              ),
          ),
          BlocProvider(
            create: (context) => CountryBloc()
              ..add(
                CountryLoadInitiated(),
              ),
          ),
          BlocProvider(
            create: (context) => CityBloc()
              ..add(
                CityLoadInitiated(),
              ),
          ),
          BlocProvider(
            create: (context) => CurrencyBloc()
              ..add(
                CurrencyLoadInitiated(),
              ),
          ),
          BlocProvider(
            create: (context) => LanguageBloc()
              ..add(
                LanguageLoadInitiated(),
              ),
          ),
          BlocProvider(
            create: (context) => ThemeBloc()
              ..add(
                ThemeChangeInitiated(),
              ),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            ThemeData? displayTheme() {
              ThemeData? theme;
              if (state is ThemeLight) {
                theme = state.themeData;
              } else if (state is ThemeDark) {
                theme = state.themeData;
              }
              return theme;
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: displayTheme(),
              builder: (context, child) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child!),
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(480, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
              ),
              initialRoute: SplashPage.routeName,
              onGenerateRoute: AppRouter().onGenerate,
            );
          },
        ),
      ),
    );
  }
}
