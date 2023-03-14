import 'package:cipher/core/constants/payment_key.dart';
import 'package:cipher/core/route/app_router.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/cubit/deactivate_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/bloc/support_help_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/repositories/support_help_repositories.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/bloc/password_security_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/repositories/password_security_repositories.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/manager/cubit/tax_calculator_cubit.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/presentation/manager/add_service/add_service_cubit.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/manager/professional_service_category_bloc/professional_service_category_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/cubit/single_entity_task_cubit.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
          BlocProvider(
            create: (context) => SignInBloc(),
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
          BlocProvider(
            create: (context) => HeroCategoryCubit(),
          ),
          BlocProvider(
            create: (context) => NestedCategoriesCubit(),
          ),
          BlocProvider(
            create: (context) => ServicesBloc(),
          ),
          BlocProvider(
            create: (context) => locator<TaskBloc>(),
          ),
          BlocProvider(
            create: (context) => EntityServiceBloc(),
          ),
          BlocProvider(
            create: (context) => SingleEntityServiceCubit(),
          ),
          BlocProvider(
            create: (context) => BookingsBloc(),
          ),
          BlocProvider(
            create: (context) => ProfessionalServiceCategoryBloc(),
          ),
          BlocProvider(
            create: (context) => TaxCalculatorCubit(),
          ),
          BlocProvider(
            create: (context) => AddServiceCubit(),
          ),
          BlocProvider(
            create: (context) => locator<TaskerCubit>()..loadTaskerList(),
          ),
          BlocProvider(
            create: (context) => SingleEntityTaskCubit(),
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

            return KhaltiScope(
              publicKey: testPublicKey,
              builder: (context, navigatorKey) {
                return MaterialApp(
                  navigatorKey: navigatorKey,
                  supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('ne', 'NP'),
                  ],
                  localizationsDelegates: const [
                    KhaltiLocalizations.delegate,
                  ],
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
            );
          },
        ),
      ),
    );
  }
}
