import 'package:cipher/core/constants/navigation_constants.dart';
import 'package:cipher/core/constants/theme.dart';
import 'package:cipher/core/route/app_router.dart';
import 'package:cipher/features/account_settings/data/repositories/connected_account_repo.dart';
import 'package:cipher/features/account_settings/presentation/cubit/connected_account_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/bloc/user_deactive_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/bloc/support_help_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/repositories/support_help_repositories.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/bloc/password_security_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/repositories/password_security_repositories.dart';
import 'package:cipher/features/archive/presentation/bloc/archive_task_entity_service_bloc.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
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
import 'package:cipher/features/event/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:cipher/features/google_maps/presentation/bloc/nearby_task_entity_service_bloc/nearby_task_entity_service_bloc.dart';
import 'package:cipher/features/google_maps/presentation/cubit/user_location_cubit.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_bloc.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem_bloc.dart';
import 'package:cipher/features/redeem/statement/presentation/bloc/redeem_statement_bloc.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/search/presentation/cubit/recent_search_cubit.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/forgot_password_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/cubit/google_sign_in_cubit.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:cipher/features/sign_up/presentation/bloc/otp_reset_verify_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/resend_verification_bloc.dart';
import 'package:cipher/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/features/support/presentation/bloc/post_support_ticket_bloc.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/activities/bloc/activities_timeline_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/user_location/presentation/google_maps_bloc/google_maps_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/skills/skills_bloc.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../features/booking_cancel/presentation/bloc/booking_cancel_bloc.dart';
import '../../features/box/presentation/bloc/order_id_create_bloc.dart';
import '../../features/box/promo_code/presentation/bloc/promo_code_apply_bloc.dart';
import '../../features/feedback/bloc/feedback_bloc.dart';
import '../../features/feedback/bloc/feedback_post_bloc.dart';
import '../../features/payment/presentation/bloc/payment_bloc.dart';
import '../../features/redeem/statement/presentation/bloc/earned_bloc.dart';
import '../../features/redeem/statement/presentation/bloc/redeemed_bloc.dart';
import '../../features/support/presentation/bloc/support_ticket_type_options_bloc.dart';
import '../../features/theme/presentation/bloc/theme_state.dart';
import '../../features/user_suspend/presentation/bloc/user_suspend_bloc.dart';
import 'firebase_messaging.dart';
class Cipher extends StatefulWidget {
  const Cipher({super.key});

  @override
  State<Cipher> createState() => _CipherState();
}

class _CipherState extends State<Cipher> {
  @override
  void initState() {
    super.initState();
    FirebaseAppMessaging.initNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SupportHelpRepositories()..getHelpTopicList(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignupBloc(SignUpRepositories())),
          BlocProvider(create: (context) => locator<SearchBloc>()),
          BlocProvider(create: (context) => PrivacyPolicyCubit()),
          BlocProvider(create: (context) => TermsOfUseCubit()),
          BlocProvider(create: (context) => SupportTicketBloc()),
          BlocProvider(create: (context) => locator<CategoriesBloc>()),
          BlocProvider(create: (context) => locator<ScrollBloc>()),
          BlocProvider(create: (context) => SignInBloc()),
          BlocProvider(create: (context) => FeedbackBloc()),
          BlocProvider(create: (context) => PostSupportTicketBloc()),
          BlocProvider(create: (context) => SupportTicketTypeOptionsBloc()),
          BlocProvider(create: (context) => FeedbackPostBloc()),
          BlocProvider(create: (context) => UserSuspendBloc()),
          BlocProvider(create: (context) => BookingCancelBloc()),
          BlocProvider(
              create: (context) =>
                  ResendVerificationBloc(SignUpRepositories())),
          BlocProvider(create: (context) => NearbyTaskEntityServiceBloc()),
          BlocProvider(create: (context) => locator<UserBloc>()),
          BlocProvider(create: (context) => UserLocationCubit()),
          BlocProvider(create: (context) => GoogleMapsBloc()),
          BlocProvider(create: (context) => ArchiveTaskEntityServiceBloc()),
          BlocProvider(create: (context) => TaskerPortfolioCubit()),
          BlocProvider(create: (context) => TaskerExperienceCubit()),
          BlocProvider(create: (context) => TaskerEducationCubit()),
          BlocProvider(create: (context) => TaskerCertificationCubit()),
          BlocProvider(create: (context) => locator<KycBloc>()),
          BlocProvider(create: (context) => locator<ImageUploadCubit>()),
          BlocProvider(create: (context) => locator<UploadBloc>()),
          BlocProvider(create: (context) => locator<GoogleSignInCubit>()),
          BlocProvider(
              create: (context) => SupportHelpBloc(SupportHelpRepositories())),
          BlocProvider(
              create: (context) =>
                  PasswordSecurityBloc(PasswordSecurityRepositories())),
          BlocProvider(
              create: (context) => ForgotPasswordBloc(SignInRepository())),
          BlocProvider(
              create: (context) => OtpResetVerifyBloc(SignUpRepositories())),
          BlocProvider(create: (context) => UserDeactiveBloc()),
          BlocProvider(create: (context) => InterestsBloc()),
          BlocProvider(create: (context) => CountryBloc()),
          BlocProvider(create: (context) => CityBloc()),
          BlocProvider(create: (context) => CurrencyBloc()),
          BlocProvider(create: (context) => SkillsBloc()),
          BlocProvider(
              create: (context) => RecentSearchCubit()..loadPersistedState()),
          BlocProvider(create: (context) => LanguageBloc()),
          BlocProvider(create: (context) => ThemeBloc()),
          BlocProvider(create: (context) => ActivitiesTimelineBloc()),
          BlocProvider(create: (context) => NestedCategoriesCubit()),
          BlocProvider(create: (context) => locator<TaskEntityServiceBloc>()),
          BlocProvider(create: (context) => locator<TaskBloc>()),
          BlocProvider(create: (context) => locator<ServicesBloc>()),
          BlocProvider(create: (context) => locator<BookingsBloc>()),
          BlocProvider(create: (context) => locator<ChatBloc>()),
          BlocProvider(create: (context) => locator<RatingReviewsBloc>()),
          BlocProvider(create: (context) => locator<RedeemBloc>()),
          BlocProvider(create: (context) => RedeemStatementBloc()),
          BlocProvider(create: (context) => EarnedBloc()),
          BlocProvider(create: (context) => RedeemedBloc()),
          BlocProvider(create: (context) => locator<BillsPaymentBloc>()),
          BlocProvider(create: (context) => locator<TaskerCubit>()),
          BlocProvider(create: (context) => locator<NotificationBloc>()),
          BlocProvider(create: (context) => EventBloc()),
          BlocProvider(create: (context) => locator<ScheduleBloc>()),
          BlocProvider(create: (context) => locator<PaymentBloc>()),
          BlocProvider(create: (context) => locator<PaymentTypeBloc>()),
          BlocProvider(create: (context) => OrderItemListBloc()),
          BlocProvider(create: (context) => locator<OrderIdCreateBloc>()),
          BlocProvider(create: (context) => locator<OrderItemRetriveBloc>()),
          BlocProvider(create: (context) => PromoCodeApplyBloc()),
          BlocProvider(create: (context) => PaymentVerifyBloc()),
          BlocProvider(create: (context) => locator<SavedBloc>()),
          BlocProvider(create: (context) => locator<BookEventHandlerBloc>()),
          BlocProvider(create: (context) => WalletBloc()),
          BlocProvider(create: (context) => SecurityBloc()),
          BlocProvider(
              create: (context) =>
                  ConnectedAccountCubit(ConnectedAccountRepo())..getList()),
          BlocProvider(create: (context) => locator<MarketingAdsBloc>()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
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
              navigatorKey: navigationKey,
            );
          },
        ),
      ),
    );
  }
}
