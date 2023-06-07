part of 'skills_bloc.dart';

@immutable
class SkillsState extends Equatable {
  final TheStates theStates;
  final List<SkillOptionModel> skillListRes;
  final List<int>? skillsIdList;
  SkillsState({
    this.theStates = TheStates.initial,
    this.skillListRes = const [],
    this.skillsIdList,
  });
  @override
  List<Object?> get props => [theStates, skillListRes, skillsIdList];

  SkillsState copyWith({
    TheStates? theStates,
    List<SkillOptionModel>? skillListRes,
    List<int>? skillsIdList,
  }) {
    return SkillsState(
      theStates: theStates ?? this.theStates,
      skillListRes: skillListRes ?? this.skillListRes,
      skillsIdList: skillsIdList ?? this.skillsIdList,
    );
  }
}
