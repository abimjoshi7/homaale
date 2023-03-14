import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_entity_service_event.dart';
part 'task_entity_service_state.dart';

class TaskEntityServiceBloc extends Bloc<TaskEntityServiceEvent, TaskEntityServiceState> {
  TaskEntityServiceBloc() : super(TaskEntityServiceInitial()) {
    on<TaskEntityServiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
