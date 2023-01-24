part of 'sandbox_bloc.dart';

abstract class SandboxState extends Equatable {
  const SandboxState();  

  @override
  List<Object> get props => [];
}
class SandboxInitial extends SandboxState {}
