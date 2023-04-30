import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ProfileKycVerifySection extends StatelessWidget {
  const ProfileKycVerifySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<KycBloc>()
      ..add(
        KycModelLoaded(),
      )
      ..add(
        KycDocumentLoaded(),
      );
    return BlocBuilder<KycBloc, KycState>(
      builder: (context, state) {
        return Visibility(
          visible: state.list?.isEmpty ?? true,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: const BoxDecoration(
                  // color: Color(0xffFFF5E5),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: Colors.amber,
                        ),
                        kWidth5,
                        Text(
                          'Get your KYC verified now',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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
      },
    );
  }
}
