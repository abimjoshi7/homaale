import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileKycVerifySection extends StatelessWidget {
  const ProfileKycVerifySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KycBloc, KycState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.theStates == TheStates.failure) {
          return BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state2) {
              if (state2.theStates == TheStates.success) {
                return Visibility(
                  visible: state2.userLoginRes?.hasProfile ?? false,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
