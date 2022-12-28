// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:cipher/features/profile/data/repositories/profile_repository.dart';
import 'package:cipher/networking/models/response/tasker_profile_res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.profileRepository,
  ) : super(ProfileInitial());

  final ProfileRepository profileRepository;

  Future<void> getTaskerData() async {
    final x = await profileRepository.fetchTaskerProfile();
    print(x.status);
    emit(
      ProfileSuccess(
        taskerProfileRes: x,
      ),
    );
  }
}
