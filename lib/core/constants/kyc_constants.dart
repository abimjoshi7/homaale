import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_profile.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_view.dart';
import 'package:flutter/material.dart';

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
