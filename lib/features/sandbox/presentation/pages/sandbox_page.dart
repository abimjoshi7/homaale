import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/repositories/kyc_repositories.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/user/data/repositories/user_repositories.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SandboxPage extends StatelessWidget {
  static const routeName = '/sandbox-page';
  const SandboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomElevatedButton(
              callback: () {
                log(CacheHelper.accessToken.toString());
              },
              label: 'Get Token',
            ),
          ),
          kHeight20,
          Center(
            child: CustomElevatedButton(
              callback: () async {
                await UserRepositories().fetchuser();
                context.read<UserBloc>().add(
                      UserLoaded(),
                    );
              },
              label: 'Get User Data',
            ),
          ),
          kHeight20,
          Center(
            child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () async {
                    await context
                        .read<TaskerEducationCubit>()
                        .getTaskerEducation();
                    if (state is TaskerGetEducationSuccess) {
                      log(state.taskerEducationRes.first.id.toString());
                    }
                  },
                  label: 'Get Education',
                );
              },
            ),
          ),
          kHeight20,
          Center(
            child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () async {
                    context.read<LanguageBloc>().add(
                          LanguageLoadInitiated(),
                        );
                  },
                  label: 'Get Languages',
                );
              },
            ),
          ),
          kHeight20,
          Center(
            child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () async {
                    final x = await UtilitiesRepositories().getCountryList();
                    print(x.first.name);
                    print(x.last);
                    // context.read<CountryBloc>().add(
                    //       CountryLoadInitiated(),
                    //     );
                  },
                  label: 'Get Country',
                );
              },
            ),
          ),
          kHeight20,
          Center(
            child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () async {
                    log("123");
                    print(123);
                    final x = await KycRepositories().getKyc();
                    print(x);
                  },
                  label: 'Get Kyc',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
