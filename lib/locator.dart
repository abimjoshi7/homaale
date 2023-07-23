import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/repositories/kyc_repositories.dart';
import 'package:cipher/features/billing_payment_page/data/repositories/bank_repositories.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/box/presentation/bloc/order_retrive_bloc.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_bloc.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/chat/repository/chat_repository.dart';
import 'package:cipher/features/event/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:cipher/features/marketing/data/repositories/marketing_repository.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:cipher/features/notification/data/repositories/notification_repositories.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/rating_reviews/data/repositories/rating_reviews_repository.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem_bloc.dart';
import 'package:cipher/features/saved/data/repositories/saved_repository.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/search/presentation/bloc/search_bloc.dart';
import 'package:cipher/features/search/repositories/search_repository.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/sign_in/presentation/cubit/google_sign_in_cubit.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/transaction/data/repositories/transaction_repository.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/features/upload/data/repositories/upload_respositoy.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:dependencies/dependencies.dart';

import 'features/redeem/data/repo/redeem_repository.dart';

final locator = GetIt.instance;

void init() {
  //repositories
  locator.registerLazySingleton<TaskEntityServiceRepository>(
    () => TaskEntityServiceRepository(),
  );
  locator.registerLazySingleton<KycRepositories>(() => KycRepositories());
  locator.registerLazySingleton<CategoriesRepositories>(() => CategoriesRepositories());
  locator.registerLazySingleton<ChatRepository>(() => ChatRepository());
  locator.registerLazySingleton<SavedRepository>(() => SavedRepository());
  locator.registerLazySingleton<NotificationRepositories>(() => NotificationRepositories());
  locator.registerLazySingleton<UploadRepository>(() => UploadRepository());
  locator.registerLazySingleton<RatingReviewsRepositroy>(() => RatingReviewsRepositroy());
  locator.registerLazySingleton<TransactionRepository>(() => TransactionRepository());
  locator.registerLazySingleton<BankRepository>(() => BankRepository());
  locator.registerLazySingleton<RedeemRepositories>(() => RedeemRepositories());
  locator.registerLazySingleton<MarketingRepository>(() => MarketingRepository());
  locator.registerLazySingleton<SearchRepository>(() => SearchRepository());
  locator.registerLazySingleton<SignInRepository>(() => SignInRepository());

  //bloc
  locator.registerFactory<TaskEntityServiceBloc>(() => TaskEntityServiceBloc(locator()));
  locator.registerFactory<TaskBloc>(() => TaskBloc(TaskEntityServiceRepository()));
  locator.registerFactory<ServicesBloc>(() => ServicesBloc());
  locator.registerFactory<TaskerCubit>(() => TaskerCubit());
  locator.registerFactory<UserBloc>(() => UserBloc());
  locator.registerFactory<TaskerPortfolioCubit>(() => TaskerPortfolioCubit());
  locator.registerFactory<BookingsBloc>(() => BookingsBloc());
  locator.registerFactory<PaymentBloc>(() => PaymentBloc());
  locator.registerFactory<PaymentTypeBloc>(() => PaymentTypeBloc());
  locator.registerFactory<OrderIdCreateBloc>(() => OrderIdCreateBloc());
  locator.registerFactory<ChatBloc>(() => ChatBloc(chatRepository: locator()));
  locator.registerFactory<KycBloc>(() => KycBloc(locator()));
  locator.registerFactory<CategoriesBloc>(() => CategoriesBloc(locator()));
  locator.registerFactory<SavedBloc>(() => SavedBloc(savedRepository: locator()));
  locator.registerFactory<OrderItemRetriveBloc>(() => OrderItemRetriveBloc());
  locator.registerFactory<ImageUploadCubit>(() => ImageUploadCubit());
  locator.registerFactory<GoogleSignInCubit>(() => GoogleSignInCubit(
        locator(),
        locator(),
      ));
  locator.registerFactory<NotificationBloc>(() => NotificationBloc(repo: locator()));
  locator.registerFactory<UploadBloc>(() => UploadBloc(locator()));
  locator.registerFactory<RatingReviewsBloc>(() => RatingReviewsBloc(locator()));
  locator.registerFactory<TransactionBloc>(() => TransactionBloc(locator()));
  locator.registerFactory<BillsPaymentBloc>(() => BillsPaymentBloc(bankRepository: locator()));
  locator.registerFactory<RedeemBloc>(() => RedeemBloc(locator()));
  locator.registerFactory<ScrollBloc>(() => ScrollBloc());
  locator.registerFactory<BookEventHandlerBloc>(() => BookEventHandlerBloc());
  locator.registerFactory<ScheduleBloc>(() => ScheduleBloc());
  locator.registerFactory<MarketingAdsBloc>(() => MarketingAdsBloc(locator()));
  locator.registerFactory<SearchBloc>(() => SearchBloc(locator()));

  // chat
  // var firebaseInstance = FirebaseFirestore.instance;
  // locator.registerSingleton<FirebaseFirestore>(firebaseInstance);

  // google sign in
  final googleSignIn = GoogleSignIn(
    scopes: ['openid', 'email', 'profile'],
    // clientId: "245846975950-ukpkm9snp47odn4pjunlv0775n9hbfj1.apps.googleusercontent.com",
    // clientId: "245846975950-cf39er49lib7g9ja6cg53ihpcvjdjm5u.apps.googleusercontent.com",
    // serverClientId: "245846975950-o8vg401tkmt8nfm26751qqjjrb5sgpp4.apps.googleusercontent.com",
    // serverClientId:
    //     "245846975950-b369pvp6e4ra8bi7g0s1ofs39vfleqsg.apps.googleusercontent.com",
  );

  locator.registerLazySingleton<GoogleSignIn>(() => googleSignIn);
}
