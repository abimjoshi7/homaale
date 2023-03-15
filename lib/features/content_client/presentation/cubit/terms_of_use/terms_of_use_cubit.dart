import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'terms_of_use_state.dart';

class TermsOfUseCubit extends Cubit<TermsOfUseState> {
  TermsOfUseCubit() : super(TermsOfUseInitial());
}
