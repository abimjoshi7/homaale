// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoaded extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserAdded extends UserEvent {
  final TaskerProfileCreateReq req;
  const UserAdded({
    required this.req,
  });
  @override
  List<Object?> get props => [req];
}

class UserEdited extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserDeleted extends UserEvent {
  @override
  List<Object?> get props => [];
}
