// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'professional_service_category_bloc.dart';

abstract class ProfessionalServiceCategoryState extends Equatable {
  const ProfessionalServiceCategoryState();
}

class ProfessionalServiceInitial extends ProfessionalServiceCategoryState {
  @override
  List<Object?> get props => [];
}

class ProfessionalServiceCategoryLoadSuccess
    extends ProfessionalServiceCategoryState {
  final ProfessionalServiceCategoryModel model;
  const ProfessionalServiceCategoryLoadSuccess({
    required this.model,
  });
  @override
  List<Object?> get props => [
        model,
      ];
}

class ProfessionalServiceCategoryLoadFailure
    extends ProfessionalServiceCategoryState {
  @override
  List<Object?> get props => [];
}
