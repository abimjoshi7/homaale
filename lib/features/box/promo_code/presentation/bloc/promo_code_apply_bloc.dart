import 'package:cipher/features/box/promo_code/data/models/apply_promo_code.dart';
import 'package:cipher/features/box/promo_code/presentation/bloc/promo_code_apply_event.dart';
import 'package:cipher/features/box/promo_code/presentation/bloc/promo_code_apply_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';
import '../../data/repositories/apply_offer_repositories.dart';

class PromoCodeApplyBloc extends Bloc<PromoCodeApply, PromoCodeApplyState> {
  final repositories = ApplyPromoCodeRepositories();

  PromoCodeApplyBloc() : super(PromoCodeApplyState()) {
    on<PromoCodeApply>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories
            .postOfferCode(event.uuid, event.code, event.offer_type)
            .then(
              (value) => emit(
                state.copyWith(
                  theState: TheStates.success,
                  applyPromoCode: ApplyPromoCode.fromJson(value),
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
  }
}
