// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileStates extends Equatable {
  const ProfileStates();
}

class ProfileInitial extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class ProfileLoadSuccess extends ProfileStates {
  final TaskerProfileRes taskerProfileRes;
  const ProfileLoadSuccess({
    required this.taskerProfileRes,
  });

  @override
  List<Object?> get props => [taskerProfileRes];
}

class ProfileLoadFailure extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class ProfileLoadUnknown extends ProfileStates {
  @override
  List<Object?> get props => [];
}
