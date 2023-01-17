import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'support_help_event.dart';
part 'support_help_state.dart';

class SupportHelpBloc extends Bloc<SupportHelpEvent, SupportHelpState> {
  SupportHelpBloc() : super(SupportHelpInitial()) {
    on<SupportHelpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
