import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/repositories/kyc_repositories.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_bloc.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/chat/repository/chat_repository.dart';
import 'package:cipher/features/box/presentation/bloc/order_id_create_bloc.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';

final locator = GetIt.instance;

void init() {
  //repositories
  locator.registerLazySingleton(
    () => KycRepositories(),
  );
  locator.registerLazySingleton(
    () => CategoriesRepositories(),
  );
  // bloc
  locator.registerFactory(() => TaskBloc());
  locator.registerFactory(() => ServicesBloc());
  locator.registerFactory(() => EntityServiceBloc());
  locator.registerFactory(() => TaskerCubit());
  locator.registerFactory(() => UserBloc());
  locator.registerFactory(() => TaskEntityServiceBloc());
  locator.registerFactory(() => BookingsBloc());
  locator.registerFactory(() => PaymentBloc());
  locator.registerFactory(() => PaymentTypeBloc());
  locator.registerFactory(() => NotificationBloc());
  locator.registerFactory(() => OrderIdCreateBloc());
  locator.registerFactory(
    () => KycBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => CategoriesBloc(
      locator(),
    ),
  );
  locator.registerFactory(() => OrderIdCreateBloc());
  locator.registerFactory(() => ChatBloc(chatRepository: locator()));

  locator.registerFactory(
    () => KycBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => CategoriesBloc(
      locator(),
    ),
  );
  locator.registerLazySingleton(() => BookEventHandlerBloc());

  // repository
  locator.registerLazySingleton(() => ChatRepository());

  //cubit
  locator.registerFactory<ImageUploadCubit>(
    () => ImageUploadCubit(),
  );

  var firebaseInstance = FirebaseFirestore.instance;
  locator.registerFactory<FirebaseFirestore>(() => firebaseInstance);
}
