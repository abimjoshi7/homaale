import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
                print(CacheHelper.accessToken);
              },
              label: 'Get Token',
            ),
          ),
          kHeight20,
          Center(
            child: CustomElevatedButton(
              callback: () async {
                context.read<UserBloc>().add(
                      UserLoaded(),
                    );
              },
              label: 'Get User Data',
            ),
          ),
        ],
      ),
    );
  }
}
