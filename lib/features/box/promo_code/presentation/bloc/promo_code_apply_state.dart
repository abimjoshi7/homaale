

import 'package:cipher/features/box/promo_code/data/models/apply_promo_code.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';

class PromoCodeApplyState extends Equatable {
  final TheStates? theState;
  final ApplyPromoCode? applyPromoCode;

  const PromoCodeApplyState( {
    this.theState ,
    this.applyPromoCode,
  });

  PromoCodeApplyState copyWith({
    TheStates? theState,
    ApplyPromoCode? applyPromoCode,
  }) {
    return PromoCodeApplyState(
      theState: theState ?? this.theState,
      applyPromoCode: applyPromoCode ?? this.applyPromoCode,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      applyPromoCode,
    ];
  }
}
