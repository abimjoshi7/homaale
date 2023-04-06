import 'package:dependencies/dependencies.dart';

abstract class PromoCodeApplyEvent extends Equatable {
  const PromoCodeApplyEvent();
}

class PromoCodeApply extends PromoCodeApplyEvent {
  final String uuid;
  final String code;
  final String offer_type;

  const PromoCodeApply({
    required this.uuid,
    required this.offer_type,
    required this.code,
  });
  @override
  List<Object?> get props => [uuid, offer_type, code];
}
