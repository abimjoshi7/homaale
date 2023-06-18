part of 'task_entity_service_bloc.dart';

class TaskEntityServiceState extends Equatable {
  final TheStates theStates;
  final TaskEntityServiceModel taskEntityServiceModel;
  final List<TaskEntityService>? taskEntityServices;
  final TaskEntityService? taskEntityService;
  final ApplicantModel? applicantModel;
  final bool? approveSuccess;
  final bool? approveFail;
  final TaskEntityServiceRes? taskEntityServiceRes;
  final bool? isLoaded;
  final bool? isCreated;
  final bool? isEdited;
  final bool? isDeleted;
  final bool? rejectSuccess;
  final bool? rejectFail;
  final bool? isDateSort;
  final bool? isBudgetSort;
  final bool? isFilter;
  final bool? serviceLoaded;
  final SelfCreatedTaskService? selfCreatedTaskService;
  final List<ServiceList>? serviceList;
  final bool isLastPage;
  final RecommendedSimilarDto recommendedSimilarDto;

  const TaskEntityServiceState({
    this.theStates = TheStates.initial,
    this.taskEntityServiceModel = const TaskEntityServiceModel(),
    this.recommendedSimilarDto = const RecommendedSimilarDto(),
    this.taskEntityServices,
    this.taskEntityService,
    this.applicantModel,
    this.approveSuccess,
    this.approveFail,
    this.taskEntityServiceRes,
    this.isLoaded,
    this.isCreated,
    this.isEdited,
    this.isDeleted,
    this.rejectSuccess,
    this.rejectFail,
    this.isDateSort,
    this.isBudgetSort,
    this.isFilter,
    this.serviceLoaded,
    this.selfCreatedTaskService,
    this.serviceList,
    this.isLastPage = false,
  });

  const TaskEntityServiceState.initial({
    this.theStates = TheStates.initial,
    this.taskEntityServiceModel = const TaskEntityServiceModel(),
    this.recommendedSimilarDto = const RecommendedSimilarDto(),
    this.taskEntityService = null,
    this.applicantModel = null,
    this.approveSuccess = false,
    this.approveFail = false,
    this.taskEntityServiceRes = null,
    this.isLoaded = false,
    this.isEdited = false,
    this.isDeleted = false,
    this.isCreated = false,
    this.rejectSuccess = false,
    this.rejectFail = false,
    this.isDateSort = false,
    this.isBudgetSort = false,
    this.isFilter = false,
    this.serviceLoaded = false,
    this.selfCreatedTaskService = null,
    this.serviceList = const [],
    this.isLastPage = false,
    this.taskEntityServices = const [],
  });

  TaskEntityServiceState copyWith({
    TheStates? theStates,
    TaskEntityServiceModel? taskEntityServiceModel,
    List<TaskEntityService>? taskEntityServices,
    TaskEntityService? taskEntityService,
    ApplicantModel? applicantModel,
    bool? approveSuccess,
    bool? approveFail,
    TaskEntityServiceRes? taskEntityServiceRes,
    bool? isLoaded,
    bool? isCreated,
    bool? isEdited,
    bool? isDeleted,
    bool? rejectSuccess,
    bool? rejectFail,
    bool? isDateSort,
    bool? isBudgetSort,
    bool? isFilter,
    bool? serviceLoaded,
    SelfCreatedTaskService? selfCreatedTaskService,
    List<ServiceList>? serviceList,
    bool? isLastPage,
    RecommendedSimilarDto? recommendedSimilarDto,
  }) {
    return TaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      taskEntityServiceModel: taskEntityServiceModel ?? this.taskEntityServiceModel,
      recommendedSimilarDto: recommendedSimilarDto ?? this.recommendedSimilarDto,
      taskEntityServices: taskEntityServices ?? this.taskEntityServices,
      taskEntityService: taskEntityService ?? this.taskEntityService,
      applicantModel: applicantModel ?? this.applicantModel,
      approveSuccess: approveSuccess ?? this.approveSuccess,
      approveFail: approveFail ?? this.approveFail,
      taskEntityServiceRes: taskEntityServiceRes ?? this.taskEntityServiceRes,
      isLoaded: isLoaded ?? this.isLoaded,
      isCreated: isCreated ?? this.isCreated,
      isEdited: isEdited ?? this.isEdited,
      isDeleted: isDeleted ?? this.isDeleted,
      rejectSuccess: rejectSuccess ?? this.rejectSuccess,
      rejectFail: rejectFail ?? this.rejectFail,
      isDateSort: isDateSort ?? this.isDateSort,
      isBudgetSort: isBudgetSort ?? this.isBudgetSort,
      isFilter: isFilter ?? this.isFilter,
      serviceLoaded: serviceLoaded ?? this.serviceLoaded,
      selfCreatedTaskService: selfCreatedTaskService ?? this.selfCreatedTaskService,
      serviceList: serviceList ?? this.serviceList,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      taskEntityServiceModel,
      taskEntityServices,
      taskEntityService,
      applicantModel,
      approveSuccess,
      approveFail,
      taskEntityServiceRes,
      isLoaded,
      isCreated,
      isEdited,
      isDeleted,
      rejectSuccess,
      rejectFail,
      isDateSort,
      isBudgetSort,
      isFilter,
      serviceLoaded,
      selfCreatedTaskService,
      serviceList,
      isLastPage,
      recommendedSimilarDto,
    ];
  }
}
