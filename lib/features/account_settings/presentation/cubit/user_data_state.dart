// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_data_cubit.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();
}

class UserDataInitial extends UserDataState {
  @override
  List<Object?> get props => [];
}

class UserDataLoadSuccess extends UserDataState {
  final TaskerProfileRetrieveRes userData;
  const UserDataLoadSuccess({
    required this.userData,
  });

  @override
  List<Object?> get props => [userData];
}

class UserDataLoadFailure extends UserDataState {
  @override
  List<Object?> get props => [];
}

class UserDataCreateSuccess extends UserDataState {
  @override
  List<Object?> get props => [];
}

class UserDataCreateFailure extends UserDataState {
  @override
  List<Object?> get props => [];
}
