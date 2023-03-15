import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:dependencies/dependencies.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => TaskBloc());
  locator.registerFactory(() => TaskerCubit());
}
