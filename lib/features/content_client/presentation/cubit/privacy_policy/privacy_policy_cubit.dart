import 'package:bloc/bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meta/meta.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit() : super(PrivacyPolicyState());
}
