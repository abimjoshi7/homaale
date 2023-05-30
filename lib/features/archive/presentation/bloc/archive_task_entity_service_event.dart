// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'archive_task_entity_service_bloc.dart';

@immutable
abstract class ArchiveTaskEntityServiceEvent extends Equatable {}

class ArchiveTaskInitiated extends ArchiveTaskEntityServiceEvent {
  final String id;
  ArchiveTaskInitiated({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}
