// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileEventRequested extends ProfileEvent {
  // final TaskerProfileRes taskerProfileRes;
  // const ProfileEventRequested({
  //   required this.taskerProfileRes,
  // });
  @override
  List<Object?> get props => [];
}
