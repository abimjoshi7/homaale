import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/screens/pages.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/bookings_page.dart';
import 'package:cipher/features/box/box.dart';
import 'package:cipher/features/categories/presentation/cubit/hero_category_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/common_navigation_bar.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  static const routeName = '/root';

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  void initBlocs() {
    Future.delayed(
      const Duration(microseconds: 10),
      () async {
        await context
            .read<HeroCategoryCubit>()
            .getHeroCategory()
            .then(
              (value) async =>
                  context.read<TaskerPortfolioCubit>().getPortfolio(),
            )
            .then(
              (value) async => context
                  .read<TaskBloc>()
                  .add(const AllTaskLoadInitiated(page: 1)),
            )
            .then(
              (value) async =>
                  context.read<TaskerExperienceCubit>().getTaskerExperience(),
            )
            .then(
              (value) async =>
                  context.read<TaskerEducationCubit>().getTaskerEducation(),
            )
            .then(
              (value) async => context
                  .read<TaskerCertificationCubit>()
                  .getTaskerCertification(),
            )
            .then(
              (value) async => context.read<UserBloc>().add(
                    UserLoaded(),
                  ),
            )
            .then(
              (value) async => context.read<KycBloc>().add(
                    KycLoaded(),
                  ),
            )
            .then(
              (value) async => context.read<BookingsBloc>().add(
                    MyTaskServiceBookingListLoadInitiated(isTask: false),
                  ),
            )
            .then(
              (value) async => context
                  .read<EntityServiceBloc>()
                  .add(const EntityServiceInitiated()),
            )
            .then(
              (value) async => context.read<TaskerCubit>().loadTaskerList(),
            );
      },
    );
  }

  @override
  void initState() {
    initBlocs();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (CacheHelper.hasProfile == false) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Welcome To Homaale',
              content: 'Get started by completing your profile',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CompleteProfilePage.routeName,
                );
              },
              isSuccess: true,
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(
            microseconds: 1,
          ),
        );
        initBlocs();
      },
      child: const Scaffold(
        body:CommonNavigationBar(),
      ),
    );
  }
}
