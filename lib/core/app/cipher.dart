import 'package:cipher/core/constants/theme.dart';
import 'package:cipher/core/route/app_router.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/cubit/deactivate_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/bloc/support_help_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/repositories/support_help_repositories.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/bloc/password_security_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/repositories/password_security_repositories.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_item_list_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_retrive_bloc.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/content_client/presentation/cubit/privacy_policy/privacy_policy_cubit.dart';
import 'package:cipher/features/content_client/presentation/cubit/terms_of_use/terms_of_use_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/google_maps/presentation/cubit/nearby_task_entity_service_cubit.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/offers/data/repositories/offer_repository.dart';
import 'package:cipher/features/offers/presentation/bloc/offers_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_bloc.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/resend_verification_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../features/box/presentation/bloc/order_id_create_bloc.dart';
import '../../features/box/promo_code/presentation/bloc/promo_code_apply_bloc.dart';
import '../../features/payment/presentation/bloc/payment_bloc.dart';
import '../../features/theme/presentation/bloc/theme_state.dart';

class Cipher extends StatelessWidget {
  const Cipher({super.key});

  @override
  Widget build(BuildContext context) {
    /// Determines whether device's os is using dark theme or light.
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
            create: (context) => PrivacyPolicyCubit(),
          ),
          BlocProvider(
            create: (context) => TermsOfUseCubit(),
          ),
          BlocProvider(
            create: (context) => locator<CategoriesBloc>(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(),
          ),
          BlocProvider(
            create: (context) => ResendVerificationBloc(
              SignUpRepositories(),
            ),
          ),
          BlocProvider(
            create: (context) => NearbyTaskEntityServiceCubit(),
          ),
          BlocProvider(
            create: (context) => locator<UserBloc>()
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
            create: (context) => TaskerCertificationCubit()..getTaskerCertification(),
          ),
          BlocProvider(
            create: (context) => locator<KycBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<ImageUploadCubit>(),
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
          BlocProvider(create: (context) => ThemeBloc()),
          // BlocProvider(
          //   create: (context) => HeroCategoryCubit(),
          // ),
          BlocProvider(
            create: (context) => NestedCategoriesCubit(),
          ),
          BlocProvider(
            create: (context) => locator<TaskEntityServiceBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<EntityServiceBloc>(),
          ),
          BlocProvider(
            create: (context) => SearchBloc(),
          ),
          BlocProvider(
            create: (context) => locator<TaskBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<ServicesBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<BookingsBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<ChatBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<TaskerCubit>()..loadTaskerList(),
          ),
          BlocProvider(
            create: (context) => locator<NotificationBloc>()..add(MyNotificationListInitiated()),
          ),
          BlocProvider(
            create: (context) => EventBloc(),
          ),
          BlocProvider(
            create: (context) => locator<PaymentBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<PaymentTypeBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<BookEventHandlerBloc>(),
          ),
          BlocProvider(
            create: (context) => OrderItemListBloc(),
          ),
          BlocProvider(
            create: (context) => locator<OrderIdCreateBloc>(),
          ),
          BlocProvider(
            create: (context) => locator<OrderItemRetriveBloc>(),
          ),
          BlocProvider(
            create: (context) => PromoCodeApplyBloc(),
          ),
          BlocProvider(
            create: (context) => PaymentVerifyBloc(),
          ),
          BlocProvider(
            create: (context) => OffersBloc(
              OfferRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => locator<SavedBloc>(),
          ),
        ],
        child:BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            ThemeData? displayTheme() {
              ThemeData? theme;
              if (state is ThemeLight) {
                theme = kLightTheme;
              } else if (state is ThemeDark) {
                theme = kDarkTheme;
              }
              return theme;
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: displayTheme(),
              themeMode: ThemeMode.light,
              darkTheme: kDarkTheme,
              builder: (context, child) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child!),
                maxWidth: 1200,
                minWidth: 480,
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
