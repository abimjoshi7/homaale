import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => TaskBloc());
  locator.registerFactory(() => EntityServiceBloc());
  locator.registerFactory(() => TaskerCubit());
  // locator.registerFactory(() => UserBloc());
}
