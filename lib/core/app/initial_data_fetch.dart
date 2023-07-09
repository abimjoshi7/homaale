import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/google_maps/presentation/cubit/user_location_cubit.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/user/presentation/bloc/activities/bloc/activities_timeline_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/user_suspend/presentation/bloc/user_suspend_bloc.dart';
import 'package:cipher/features/user_suspend/presentation/bloc/user_suspend_event.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/skills/skills_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void initialFetch(BuildContext context) {
  context.read<CategoriesBloc>().add(CategoriesTopLoadInitiated());
  context
      .read<TaskEntityServiceBloc>()
      .add(TaskEntityServiceInitiated(isTask: false, newFetch: true));
  context.read<TaskBloc>().add(AllTaskLoadInitiated(page: 1, newFetch: true));
  context.read<TaskerCubit>().loadTaskerList();
}

void userDetailsFetch(BuildContext context) {
  context.read<UserBloc>().add(UserLoaded());
  context.read<UserLocationCubit>().getUserLocation();
  context.read<KycBloc>().add(KycModelLoaded());
  context.read<KycBloc>().add(KycDocumentLoaded());
  context.read<KycBloc>().add(KycProfileInitiated());
  context.read<TaskerPortfolioCubit>().getPortfolio();
  context.read<TaskerExperienceCubit>().getTaskerExperience();
  context.read<TaskerEducationCubit>().getTaskerEducation();
  context.read<TaskerCertificationCubit>().getTaskerCertification();
  context.read<ActivitiesTimelineBloc>().add(ActivitiesLoaded());
  context.read<UserSuspendBloc>().add(UserSuspendLoaded(
      userId: '${context.read<UserBloc>().state.taskerProfile?.user?.id}'));
  context.read<BillsPaymentBloc>().add(InitializeState());
  context.read<BillsPaymentBloc>().add(FetchLinkedBankAccount());
}

void fetchDataForForms(BuildContext context) {
  context.read<MarketingAdsBloc>().add(FetchMarketingAdsEvent());
  context.read<CountryBloc>().add(CountryLoadInitiated());
  context.read<CityBloc>().add(CityLoadInitiated());
  context.read<CurrencyBloc>().add(CurrencyLoadInitiated());
  context.read<LanguageBloc>().add(LanguageLoadInitiated());
  context.read<CategoriesBloc>().add(CategoriesLoadInitiated());
  context.read<ServicesBloc>().add(ServicesLoadInitiated());
  context.read<SkillsBloc>().add(SkillOptionsLoaded());
  context.read<InterestsBloc>().add(InterestLoadInitiated());
}
