import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileKycVerifySection extends StatelessWidget {
  const ProfileKycVerifySection({
    super.key,
    required this.isKycVerified,
  });

  final bool isKycVerified;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit, UserDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // if (state is UserDataLoadSuccess) {
        //   isKycVerified = state.userData.isProfileVerified;
        // }
        return Visibility(
          visible: isKycVerified == false,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xffFFF5E5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: Colors.amber,
                        ),
                        kWidth5,
                        Text('Get your KYC verified now'),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
