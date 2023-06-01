// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'archive_task_entity_service_bloc.dart';

@immutable
class ArchiveTaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  ArchiveTaskEntityServiceState({
    this.theStates,
  });
  @override
  List<Object?> get props => [theStates];

  ArchiveTaskEntityServiceState copyWith({
    TheStates? theStates,
  }) {
    return ArchiveTaskEntityServiceState(
      theStates: theStates ?? this.theStates,
    );
  }
}
