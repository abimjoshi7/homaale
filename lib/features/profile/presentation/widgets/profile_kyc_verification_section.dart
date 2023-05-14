// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_profile.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_view.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';

class ProfileKycVerifySection extends StatelessWidget {
  const ProfileKycVerifySection({
    Key? key,
  }) : super(key: key);

  void conditionalCheckNavigation(BuildContext context, KycState state) {
    if (state.kycModel == null && state.list?.length == 0) {
      Navigator.pushNamed(
        context,
        KycProfile.routeName,
      );
    }
    if (state.kycModel != null && state.list?.length == 0) {
      Navigator.pushNamed(
        context,
        KycDetails.routeName,
      );
    }
    if (state.kycModel != null && state.list?.length != 0) {
      Navigator.pushNamed(
        context,
        KycView.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: InkWell(
        onTap: () {
          conditionalCheckNavigation(context, context.read<KycBloc>().state);
        },
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
                children: <Widget>[
                  Row(
                    children: <Widget>[
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
      ),
    );
  }
}
