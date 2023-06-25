// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/compress_helper.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/data/repositories/categories_repositories.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SandboxPage extends StatefulWidget {
  static const routeName = '/sandbox-page';
  const SandboxPage({super.key});

  @override
  State<SandboxPage> createState() => _SandboxPageState();
}

class _SandboxPageState extends State<SandboxPage> {
  late ScrollController _controller;
  final bloc = locator<UploadBloc>();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.animateTo(
      5,
      duration: Duration.zero,
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Sandbox",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomElevatedButton(
                callback: () {
                  log("Access: ${CacheHelper.accessToken}");
                  log("Refresh: ${CacheHelper.refreshToken}");
                },
                label: 'Get Token',
              ),
            ),
            kHeight20,
            Center(
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      if (state.theStates == TheStates.success) {
                        print(state.userLoginRes?.toJson());
                        // log(
                        //   state.user.user!.toJson().toString(),
                        // );
                      }
                    },
                    label: 'Get User Data',
                  );
                },
              ),
            ),
            kHeight20,
            CustomMultimedia(
              bloc: bloc,
              imagePage: ImagePage.Form,
            ),
            // Center(
            //   child: CustomElevatedButton(
            //     callback: () async {
            //       final image = await CompressHelper().compressFileAsync(
            //         bloc.state.imageFileList.last,
            //       );
            //       print(image.lengthSync());
            //     },
            //     label: 'Compress Image',
            //   ),
            // ),
            kHeight20,
            Center(
              child: CustomElevatedButton(
                callback: () async {
                  final x = context
                      .read<TaskEntityServiceBloc>()
                      .state
                      .taskEntityServiceModel;
                  log(x.result!.first.id!);
                },
                label: 'View Task Entity Services',
              ),
            ),
            kHeight20,
            Center(
              child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      await context
                          .read<TaskerEducationCubit>()
                          .getTaskerEducation();
                      if (state is TaskerGetEducationSuccess) {
                        log(state.taskerEducationRes.first.id.toString());
                      }
                    },
                    label: 'Get Education',
                  );
                },
              ),
            ),
            kHeight20,
            Center(
              child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      context.read<LanguageBloc>().add(
                            LanguageLoadInitiated(),
                          );
                    },
                    label: 'Get Languages',
                  );
                },
              ),
            ),
            kHeight20,
            Center(
              child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      final x = await UtilitiesRepositories().getCountryList();
                      print(x.first.name);
                      print(x.last);
                      // context.read<CountryBloc>().add(
                      //       CountryLoadInitiated(),
                      //     );
                    },
                    label: 'Get Country',
                  );
                },
              ),
            ),
            kHeight20,
            Center(
              child: BlocBuilder<TaskerEducationCubit, TaskerEducationState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      print(MediaQuery.of(context).size.height);
                      print(MediaQuery.of(context).size.width);
                    },
                    label: 'Get Kyc',
                  );
                },
              ),
            ),
            kHeight20,

            // Center(
            //   child: BlocBuilder<CategoriesBloc, CategoriesState>(
            //     builder: (context, state) {
            //       return CustomElevatedButton(
            //         callback: () async {
            //           await CategoriesRepositories().fetchHeroCategory();
            //           // print(x);
            //         },
            //         label: 'Get Categories',
            //       );
            //     },
            //   ),
            // ),
            // kHeight20,
            Center(
              child: BlocBuilder<NestedCategoriesCubit, NestedCategoriesState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      final x = await CategoriesRepositories()
                          .fetchNestedCategory()
                          .then(
                            (value) => value.map(
                              (e) => NestedCategory.fromJson(e),
                            ),
                          );
                      print(x.length);
                      print(x.first.name);
                      // await context.read<NestedCategoriesCubit>().getNestedCategory();
                      // print(123);
                    },
                    label: 'Get Nested Categories',
                  );
                },
              ),
            ),
            kHeight20,
            addVerticalSpace(20),
            Center(
              child: BlocBuilder<NestedCategoriesCubit, NestedCategoriesState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    callback: () async {
                      // final x =
                      await BookingRepositories()
                          .approveBooking(ApproveReq(booking: 468));
                      // print(x['result'].toJson());
                      // print(123);
                    },
                    label: 'Approve Booking',
                  );
                },
              ),
            ),
            addVerticalSpace(20),
            // Center(
            //   child: BlocBuilder<BookingsBloc, BookingsState>(
            //     builder: (context, state) {
            //       return CustomElevatedButton(
            //         callback: () async {
            //           // context.read<BookingsBloc>().add(
            //           //       ServiceBookingListInitiated(),
            //           //     );
            //           if (state is ServiceBookingLoadSuccess) {
            //             print(
            //               state.myBookingList.result?.first.description,
            //             );
            //           }
            //         },
            //         label: 'Get Bookings',
            //       );
            //     },
            //   ),
            // ),
            // addVerticalSpace(20),
            // Center(
            //   child: BlocBuilder<TaskBloc, TaskState>(
            //     builder: (context, state) {
            //       return CustomElevatedButton(
            //         callback: () async {
            //           context
            //               .read<TaskBloc>()
            //               .add(SingleEntityTaskLoadInitiated());
            //           print(23);
            //         },
            //         label: 'Get My Tasks',
            //       );
            //     },
            //   ),
            // ),
            // addVerticalSpace(20),
            // Center(
            //   child: BlocBuilder<TaskBloc, TaskState>(
            //     builder: (context, state) {
            //       return CustomElevatedButton(
            //         callback: () async {
            //           // context.read<TaskerBloc>().add(TaskerAllLoadInitiated());
            //         },
            //         label: 'Get All Taskers',
            //       );
            //     },
            //   ),
            // ),
            addVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
