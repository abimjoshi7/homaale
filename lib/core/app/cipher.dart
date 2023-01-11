import 'package:cipher/core/route/app_router.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/cubit/kyc_cubit.dart';
import 'package:cipher/features/home/presentation/cubit/categories_cubit.dart';
import 'package:cipher/features/home/presentation/cubit/home_cubit.dart';
import 'package:cipher/features/portfolio/presentation/cubit/image_upload_cubit.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_certification_cubit.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_education_cubit.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_experience_cubit.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_portfolio_cubit.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Cipher extends StatelessWidget {
  const Cipher({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            NetworkHelper(),
          )..fetchAllCategories(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            networkHelper: NetworkHelper(),
          )..fetchHeroCategory(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(SignInRepository()),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => UserDataCubit()..getTaskerUserData(),
        ),
        BlocProvider(
          create: (context) => TaskerPortfolioCubit()..getPortfolio(5),
        ),
        BlocProvider(
          create: (context) => TaskerExperienceCubit()..getTaskerExperience(),
        ),
        BlocProvider(
          create: (context) => TaskerEducationCubit()..getTaskerEducation(),
        ),
        BlocProvider(
          create: (context) =>
              TaskerCertificationCubit()..getTaskerCertification(),
        ),
        BlocProvider(
          create: (context) => KycCubit(),
        ),
        BlocProvider(
          create: (context) => ImageUploadCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: const ColoredBox(color: Colors.cyan),
        ),
        initialRoute: SplashPage.routeName,
        onGenerateRoute: AppRouter.onGenerate,
      ),
    );
  }
}
