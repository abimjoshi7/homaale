// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kyc_bloc.dart';

abstract class KycState extends Equatable {
  const KycState();
}

class KycInitial extends KycState {
  @override
  List<Object?> get props => [];
}

class KycCreateSuccess extends KycState {
  final int id;
  const KycCreateSuccess({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}

class KycCreateFailure extends KycState {
  @override
  List<Object?> get props => [];
}

class KycAddSuccess extends KycState {
  @override
  List<Object?> get props => [];
}

class KycAddFailure extends KycState {
  @override
  List<Object?> get props => [];
}

class KycLoadSuccess extends KycState {
  final List<GetKycRes> list;
  const KycLoadSuccess({
    required this.list,
  });
  @override
  List<Object?> get props => [list];
}

class KycLoadFailure extends KycState {
  @override
  List<Object?> get props => [];
}
