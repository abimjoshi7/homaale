import 'package:dependencies/dependencies.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersInitial()) {
    on<OffersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
