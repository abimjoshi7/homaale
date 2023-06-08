// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'skills_bloc.dart';

@immutable
class SkillsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SkillOptionsLoaded extends SkillsEvent {
  @override
  List<Object?> get props => [];
}

class SelectedSkillsOptionsStore extends SkillsEvent {
  final List<int>? selectedSkills;
  SelectedSkillsOptionsStore({
    required this.selectedSkills,
  });
  @override
  List<Object?> get props => [selectedSkills];
}
