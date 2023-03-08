import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/data/models/tasker_certification_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EditCertification extends StatefulWidget {
  final int id;
  const EditCertification({super.key, required this.id});

  @override
  State<EditCertification> createState() => _EditCertificationsState();
}

class _EditCertificationsState extends State<EditCertification> {
  final nameController = TextEditingController();
  final issuingOrganizationController = TextEditingController();
  final descriptionController = TextEditingController();
  final credentialIdController = TextEditingController();
  final certificationUrlController = TextEditingController();
  DateTime? issuedDate;
  DateTime? endDate;
  bool? isExpirable = false;
  Certificate? certificate;

  @override
  void dispose() {
    nameController.dispose();
    issuingOrganizationController.dispose();
    descriptionController.dispose();
    credentialIdController.dispose();
    certificationUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskerCertificationCubit, TaskerCertificationState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (state is TaskerEditCertificationSuccess) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Certification edited successfully',
              onTap: () async {
                context
                    .read<TaskerCertificationCubit>()
                    .getTaskerCertification();
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          );
        }
        if (state is TaskerEditCertificationFailure) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: error ?? "Certification couldn't be edited",
              onTap: () async {
                await context
                    .read<TaskerCertificationCubit>()
                    .getTaskerCertification();
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TaskerGetCertificationSuccess) {
          for (final x in state.taskerCertificationRes) {
            if (x.id == widget.id) {
              certificate = x;
            }
          }
          return Column(
            children: [
              const CustomModalSheetDrawerIcon(),
              const Center(
                child: Text(
                  'Edit Certification',
                  style: kPurpleText16,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      CustomFormField(
                        label: 'Name',
                        isRequired: true,
                        child: CustomTextFormField(
                          hintText: nameController.text.isNotEmpty
                              ? nameController.text
                              : certificate?.name ?? 'Eg: Certified Gardener',
                          onChanged: (p0) {
                            setState(() {
                              nameController.text = p0!;
                            });
                          },
                        ),
                      ),
                      CustomFormField(
                        label: 'Issuing Organization',
                        isRequired: true,
                        child: CustomTextFormField(
                          hintText: issuingOrganizationController
                                  .text.isNotEmpty
                              ? issuingOrganizationController.text
                              : certificate?.issuingOrganization ?? 'Eg: Cagtu',
                          onChanged: (p0) {
                            setState(() {
                              issuingOrganizationController.text = p0!;
                            });
                          },
                        ),
                      ),
                      CustomFormField(
                        label: 'Description',
                        child: CustomTextFormField(
                          maxLines: 3,
                          hintText: descriptionController.text.isNotEmpty
                              ? descriptionController.text
                              : certificate?.description ??
                                  'Write something...',
                          onChanged: (p0) {
                            setState(() {
                              descriptionController.text = p0!;
                            });
                          },
                        ),
                      ),
                      Row(
                        children: [
                          CustomCheckBox(
                            onTap: () {
                              setState(() {
                                isExpirable = !isExpirable!;
                              });
                            },
                            boxColor: const Color(0xff0693E3),
                            isChecked: isExpirable!,
                          ),
                          kWidth10,
                          const Text('This certificate does not expire'),
                        ],
                      ),
                      kHeight20,
                      CustomFormField(
                        label: 'Cerfication Id',
                        isRequired: true,
                        child: CustomTextFormField(
                          hintText: credentialIdController.text.isNotEmpty
                              ? credentialIdController.text
                              : certificate?.credentialId ??
                                  'Eg: 213224-212-212',
                          onChanged: (p0) {
                            setState(() {
                              credentialIdController.text = p0!;
                            });
                          },
                        ),
                      ),
                      CustomFormField(
                        label: 'Certification URL',
                        isRequired: true,
                        child: CustomTextFormField(
                          hintText: certificationUrlController.text.isNotEmpty
                              ? certificationUrlController.text
                              : certificate?.certificateUrl ??
                                  'Eg: https//www.cagtu.com.np',
                          prefixWidget: const Icon(
                            Icons.location_on_outlined,
                            color: kColorPrimary,
                          ),
                          onChanged: (p0) {
                            setState(() {
                              certificationUrlController.text = p0!;
                            });
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormField(
                              label: 'Issued Date',
                              isRequired: true,
                              child: InkWell(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1980),
                                    initialDate: DateTime.now(),
                                    lastDate: DateTime(2050),
                                  ).then(
                                    (value) => setState(
                                      () {
                                        issuedDate = value;
                                      },
                                    ),
                                  );
                                },
                                child: CustomFormContainer(
                                  hintText:
                                      issuedDate?.toString().substring(0, 10) ??
                                          certificate?.issuedDate
                                              .toString()
                                              .substring(0, 10) ??
                                          '1999-06-13',
                                  leadingWidget: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kWidth20,
                          Flexible(
                            child: CustomFormField(
                              label: 'End Date',
                              isRequired: true,
                              child: InkWell(
                                onTap: () async {
                                  await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1980),
                                    initialDate: DateTime.now(),
                                    lastDate: DateTime(2050),
                                  ).then(
                                    (value) => setState(
                                      () {
                                        endDate = value;
                                      },
                                    ),
                                  );
                                },
                                child: CustomFormContainer(
                                  hintText:
                                      endDate?.toString().substring(0, 10) ??
                                          certificate?.expireDate
                                              .toString()
                                              .substring(0, 10) ??
                                          '1999-06-30',
                                  leadingWidget: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                callback: () async {
                  setState(
                    () {
                      issuedDate ??= certificate!.issuedDate;
                      endDate ??= certificate!.expireDate;
                    },
                  );
                  if (issuedDate!.isAfter(endDate!)) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Error',
                        content: 'Please verify your dates',
                        onTap: () {},
                        isSuccess: false,
                      ),
                    );
                  } else {
                    await context
                        .read<TaskerCertificationCubit>()
                        .editTaskerCertification(
                          TaskerCertificateReq(
                            name: nameController.text.isNotEmpty
                                ? nameController.text
                                : certificate!.name!,
                            issuingOrganization:
                                issuingOrganizationController.text.isNotEmpty
                                    ? issuingOrganizationController.text
                                    : certificate!.issuingOrganization!,
                            description: descriptionController.text.isNotEmpty
                                ? descriptionController.text
                                : certificate!.description!,
                            credentialId: credentialIdController.text.isNotEmpty
                                ? credentialIdController.text
                                : certificate!.credentialId!,
                            certificateUrl:
                                certificationUrlController.text.isNotEmpty
                                    ? certificationUrlController.text
                                    : certificate!.certificateUrl!,
                            doesExpire: isExpirable ?? certificate!.doesExpire!,
                            issuedDate: issuedDate,
                            expireDate: endDate,
                          ),
                          widget.id,
                        );
                  }
                },
                label: 'Save',
              ),
              kHeight50
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
