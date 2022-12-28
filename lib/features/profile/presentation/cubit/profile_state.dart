// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSuccess extends ProfileState {
  final TaskerProfileRes taskerProfileRes;
  const ProfileSuccess({
    required this.taskerProfileRes,
  });
  @override
  List<Object?> get props => [taskerProfileRes];
}

class ProfileFailure extends ProfileState {
  @override
  List<Object?> get props => [];
}
