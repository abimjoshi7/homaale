// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_service_cubit.dart';

abstract class AddServiceState extends Equatable {
  const AddServiceState();
}

class AddServiceInitial extends AddServiceState {
  @override
  List<Object?> get props => [];
}

class AddServiceSuccess extends AddServiceState {
  final AddServiceRes res;
  const AddServiceSuccess({
    required this.res,
  });
  @override
  List<Object?> get props => [
        res,
      ];
}

class AddServiceFailure extends AddServiceState {
  @override
  List<Object?> get props => [];
}
