part of 'professional_service_category_bloc.dart';

abstract class ProfessionalServiceCategoryEvent extends Equatable {
  const ProfessionalServiceCategoryEvent();
}

class ProfessionalServiceCategoryLoadInitated
    extends ProfessionalServiceCategoryEvent {
  @override
  List<Object?> get props => [];
}
