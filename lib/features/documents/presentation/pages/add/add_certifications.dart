import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/data/models/tasker_certification_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AddCertifications extends StatefulWidget {
  const AddCertifications({super.key});
  static const routeName = '/add-certifications';

  @override
  State<AddCertifications> createState() => _AddCertificationsState();
}

class _AddCertificationsState extends State<AddCertifications> {
  final nameController = TextEditingController();
  final issuingOraganizationController = TextEditingController();
  final descriptionController = TextEditingController();
  final credentialIdController = TextEditingController();
  final certificationUrlController = TextEditingController();
  final _issuedDateController = TextEditingController();
  final _expiryDateController = TextEditingController();
  DateTime? issuedDate;
  DateTime? endDate;
  bool isExpirable = false;
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    issuingOraganizationController.dispose();
    descriptionController.dispose();
    credentialIdController.dispose();
    certificationUrlController.dispose();
    _issuedDateController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(appBarTitle: "Add Certification"),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  label: 'Name',
                  isRequired: true,
                  child: CustomTextFormField(
                    validator: validateNotEmpty,
                    hintText: 'Eg: Certified Gardener',
                    onSaved: (p0) {
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
                    validator: validateNotEmpty,
                    hintText: 'Eg: Cagtu',
                    onSaved: (p0) {
                      setState(() {
                        issuingOraganizationController.text = p0!;
                      });
                    },
                  ),
                ),
                CustomFormField(
                  label: 'Description',
                  child: CustomTextFormField(
                    maxLines: 3,
                    hintText: 'Write something...',
                    onSaved: (p0) {
                      setState(() {
                        descriptionController.text = p0!;
                      });
                    },
                  ),
                ),

                kHeight20,
                CustomFormField(
                  label: 'Cerfication Id',
                  isRequired: true,
                  child: CustomTextFormField(
                    validator: validateNotEmpty,
                    hintText: 'Eg: 213224-212-212',
                    onSaved: (p0) {
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
                    validator: validateNotEmpty,
                    hintText: 'Eg: https//www.cagtu.com.np',
                    prefixWidget: const Icon(
                      Icons.location_on_outlined,
                      color: kColorPrimary,
                    ),
                    onSaved: (p0) {
                      setState(() {
                        certificationUrlController.text = p0!;
                      });
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: CustomFormField(
                        label: 'Issued Date',
                        isRequired: true,
                        child: CustomTextFormField(
                          readOnly: true,
                          controller: _issuedDateController,
                          validator: (p0) {
                            if (issuedDate == null) {
                              return "Required Field";
                            }
                            if (issuedDate != null && endDate != null) {
                              if (issuedDate!.isAfter(endDate!)) {
                                return "Cannot be greater than expiry date";
                              }
                              return null;
                            }
                            return null;
                          },
                          hintText: issuedDate != null
                              ? DateFormat("yyyy-MM-dd").format(
                                  issuedDate!,
                                )
                              : "yyyy-mm-dd",
                          prefixWidget: Icon(
                            Icons.calendar_month_rounded,
                            color: Theme.of(context).indicatorColor,
                          ),
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(
                                2080,
                              ),
                            ).then(
                              (value) => setState(
                                () {
                                  issuedDate = value;
                                  _issuedDateController.text =
                                      issuedDate != null
                                          ? DateFormat("yyyy-MM-dd").format(
                                              issuedDate!,
                                            )
                                          : "";
                                },
                              ),
                            );
                          },
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    kWidth20,
                    Flexible(
                      child: CustomFormField(
                        label: 'Valid Till',
                        isRequired: isExpirable,
                        child: CustomTextFormField(
                          readOnly: true,
                          controller: _expiryDateController,
                          validator: (p0) {
                            if (isExpirable) {
                              if (endDate == null) {
                                return "Required Field";
                              }
                              if (issuedDate != null && endDate != null) {
                                if (endDate!.isBefore(issuedDate!)) {
                                  return "Cannot be less than issued date";
                                }
                                return null;
                              }
                            }
                            return null;
                          },
                          hintText: endDate != null
                              ? DateFormat("yyyy-MM-dd").format(
                                  endDate!,
                                )
                              : "yyyy-mm-dd",
                          prefixWidget: Icon(
                            Icons.calendar_month_rounded,
                            color: Theme.of(context).indicatorColor,
                          ),
                          onTap: isExpirable == false
                              ? null
                              : () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(
                                      2080,
                                    ),
                                  ).then(
                                    (value) => setState(
                                      () {
                                        endDate = value;
                                        _expiryDateController.text = endDate !=
                                                null
                                            ? DateFormat("yyyy-MM-dd").format(
                                                endDate!,
                                              )
                                            : "";
                                      },
                                    ),
                                  );
                                },
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      CustomCheckBox(
                        isChecked: !isExpirable,
                        onTap: () {
                          setState(
                            () {
                              isExpirable = !isExpirable;
                            },
                          );
                        },
                      ),
                      addHorizontalSpace(10),
                      Flexible(
                        child: Text('This document does not expire.',
                            style: Theme.of(context).textTheme.displaySmall),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     Flexible(
                //       child: CustomFormField(
                //         label: 'Issued Date',
                //         isRequired: true,
                //         child: InkWell(
                //           onTap: () async {
                //             await showDatePicker(
                //               context: context,
                //               firstDate: DateTime(1980),
                //               initialDate: DateTime.now(),
                //               lastDate: DateTime(2050),
                //             ).then(
                //               (value) => setState(
                //                 () {
                //                   issuedDate = value;
                //                 },
                //               ),
                //             );
                //           },
                //           child: CustomFormContainer(
                //             hintText: issuedDate?.toString().substring(0, 10) ??
                //                 '1999-06-13',
                //             leadingWidget: const Icon(
                //               Icons.calendar_month_rounded,
                //               color: kColorPrimary,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     kWidth20,
                //     Flexible(
                //       child: CustomFormField(
                //         label: 'End Date',
                //         isRequired: true,
                //         child: InkWell(
                //           onTap: () async {
                //             await showDatePicker(
                //               context: context,
                //               firstDate: DateTime(1980),
                //               initialDate: DateTime.now(),
                //               lastDate: DateTime(2050),
                //             ).then(
                //               (value) => setState(
                //                 () {
                //                   endDate = value;
                //                 },
                //               ),
                //             );
                //           },
                //           child: CustomFormContainer(
                //             hintText: endDate?.toString().substring(0, 10) ??
                //                 '1999-06-30',
                //             leadingWidget: const Icon(
                //               Icons.calendar_month_rounded,
                //               color: kColorPrimary,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // addVerticalSpace(10.0),
                BlocConsumer<TaskerCertificationCubit,
                    TaskerCertificationState>(
                  listener: (context, state) async {
                    final error = await CacheHelper.getCachedString(kErrorLog);
                    if (state is TaskerCertificationSuccess) {
                      if (!mounted) return;

                      context
                          .read<TaskerCertificationCubit>()
                          .getTaskerCertification();

                      showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Success',
                          content: 'Certification added successfully',
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            Root.routeName,
                            (route) => false,
                          ),
                          isSuccess: true,
                        ),
                      );
                    } else if (state is TaskerCertificationFailure) {
                      if (!mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text(error ?? "Certification coouldn't be added"),
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Failure',
                          content: error ?? "Certification coouldn't be added",
                          onTap: () => Navigator.pop(context),
                          isSuccess: false,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      callback: () async {
                        if (_key.currentState!.validate() &&
                            issuedDate!.isBefore(endDate!)) {
                          _key.currentState!.save();
                          final cerificationReq = TaskerCertificateReq(
                            name: nameController.text,
                            issuingOrganization:
                                issuingOraganizationController.text,
                            description: descriptionController.text,
                            credentialId: credentialIdController.text,
                            certificateUrl:
                                'https://${certificationUrlController.text}',
                            doesExpire: isExpirable,
                            issuedDate: issuedDate,
                            expireDate: endDate,
                          );

                          await context
                              .read<TaskerCertificationCubit>()
                              .addTaskerCertification(cerificationReq);
                        } else if (endDate!.isBefore(issuedDate!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please check your start and end dates'),
                            ),
                          );
                        }
                      },
                      label: 'Add',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
