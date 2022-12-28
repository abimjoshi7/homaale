// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cipher/features/profile/data/repositories/profile_repository.dart';
import 'package:cipher/networking/models/response/tasker_profile_res.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  final ProfileRepository profileRepo;
  ProfileBloc(
    this.profileRepo,
  ) : super(ProfileInitial()) {
    on<ProfileEventRequested>(
      (event, emit) async {
        final x = await profileRepo.fetchTaskerProfile();
        emit(
          ProfileLoadSuccess(
            taskerProfileRes: x,
          ),
        );
      },
    );
  }
}
