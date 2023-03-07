
import 'package:dependencies/dependencies.dart';

part 'sandbox_event.dart';
part 'sandbox_state.dart';

class SandboxBloc extends Bloc<SandboxEvent, SandboxState> {
  SandboxBloc() : super(SandboxInitial()) {
    on<SandboxEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
