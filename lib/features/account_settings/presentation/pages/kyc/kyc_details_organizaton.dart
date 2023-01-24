import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KycDetailsOrganization extends StatefulWidget {
  const KycDetailsOrganization({super.key});

  static const routeName = '/kyc-details-organization';

  @override
  State<KycDetailsOrganization> createState() => _KycDetailsOrganizationState();
}

class _KycDetailsOrganizationState extends State<KycDetailsOrganization> {
  final val = [
    'Citizenship',
    'PAN/VAT',
    'Passport',
    'Driving License',
  ];

  String? fullName;

  final identityTypeController = TextEditingController();
  final fullNameController = TextEditingController();
  final identityNumberController = TextEditingController();
  final issuedFromController = TextEditingController();
  DateTime? issuedDate;
  DateTime? expiryDate;
  final _key = GlobalKey<FormState>();
  File? file;

  @override
  void dispose() {
    identityTypeController.dispose();
    fullNameController.dispose();
    identityNumberController.dispose();
    issuedFromController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight50,
              CustomHeader(
                leadingWidget: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                trailingWidget: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {},
                ),
                child: const Text(
                  'KYC Details',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(
                      0xff212529,
                    ),
                  ),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'KYC Details',
                  style: kPurpleText19,
                ),
              ),
              Expanded(
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: kPadding20,
                    child: Column(
                      children: [
                        CustomFormField(
                          label: 'Identify Type',
                          isRequired: true,
                          child: CustomDropDownField(
                              onChanged: (value) => setState(
                                    () {
                                      identityTypeController.text = value!;
                                    },
                                  ),
                              list: val,
                              hintText: 'Choose your document type here'),
                        ),
                        CustomFormField(
                          label: 'Full Name',
                          isRequired: true,
                          child: CustomTextFormField(
                            validator: validateNotEmpty,
                            hintText: 'Harry Smith',
                            onSaved: (p0) => setState(
                              () {
                                fullNameController.text = p0!;
                              },
                            ),
                          ),
                        ),
                        CustomFormField(
                          label: 'Identity number',
                          isRequired: true,
                          child: CustomTextFormField(
                            validator: validateNotEmpty,
                            hintText: '123321-123-123123',
                            onSaved: (p0) => setState(
                              () {
                                identityNumberController.text = p0!;
                              },
                            ),
                          ),
                        ),
                        CustomFormField(
                          label: 'Issued',
                          isRequired: true,
                          child: CustomTextFormField(
                            validator: validateNotEmpty,
                            hintText: 'Kathmandu',
                            onSaved: (p0) => setState(
                              () {
                                issuedFromController.text = p0!;
                              },
                            ),
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
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(
                                        2080,
                                      ),
                                    ).then(
                                      (value) => setState(
                                        () {
                                          issuedDate = value;
                                        },
                                      ),
                                    );
                                  },
                                  child: CustomFormContainer(
                                    hintText: issuedDate
                                            ?.toString()
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
                                label: 'Expiry Date',
                                isRequired: true,
                                child: InkWell(
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
                                          expiryDate = value;
                                        },
                                      ),
                                    );
                                  },
                                  child: CustomFormContainer(
                                    hintText: expiryDate
                                            ?.toString()
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
                          ],
                        ),
                        CustomFormField(
                          label: 'Documents',
                          isRequired: true,
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Maximum file size 20 MB',
                                    style: kHelper13,
                                  ),
                                  kWidth10,
                                  Icon(
                                    Icons.info_outline,
                                    size: 14,
                                    color: Color(0xffFF9700),
                                  )
                                ],
                              ),
                              kHeight10,
                              InkWell(
                                onTap: () async {
                                  await FilePickHelper.filePicker().then(
                                    (value) => setState(
                                      () {
                                        file = value;
                                      },
                                    ),
                                  );
                                },
                                child: CustomFormContainer(
                                  hintText: file?.path.substring(0, 30) ??
                                      '+ Select files',
                                ),
                              ),
                              kHeight20,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              kHeight20,
              Center(
                child: BlocConsumer<KycBloc, KycState>(
                  listener: (context, state) async {
                    final error = await CacheHelper.getCachedString(kErrorLog);
                    if (state is KycAddSuccess) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Success',
                          content: 'KYC document added Successfully',
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Root.routeName,
                              (route) => false,
                            );
                          },
                          isSuccess: true,
                        ),
                      );
                    } else if (state is KycAddFailure) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Failure',
                          content: error ?? 'KYC document failed',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isSuccess: false,
                        ),
                      );
                    } else if (state is KycCreateFailure) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Failure',
                          content: error ?? 'KYC document creation failed',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isSuccess: false,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      callback: () async {
                        if (_key.currentState!.validate() &&
                            issuedDate!.isBefore(expiryDate!)) {
                          _key.currentState!.save();
                          context.read<KycBloc>().add(
                                KycInitiated(
                                  createKycReq: CreateKycReq(
                                    fullName: fullNameController.text,
                                    address: issuedFromController.text,
                                    country: 'NP',
                                    isCompany: false,
                                    extraData: {},
                                  ),
                                ),
                              );
                          if (state is KycCreateSuccess) {
                            context.read<KycBloc>().add(
                                  KycAdded(
                                    addKycReq: AddKycReq(
                                      kyc: state.id,
                                      documentType: identityTypeController.text,
                                      documentId: identityNumberController.text,
                                      isCompany: false,
                                      issuedDate: issuedDate,
                                      validThrough: expiryDate,
                                      issuerOrganization: 'Nepal Government',
                                      file: await MultipartFile.fromFile(
                                        file!.path,
                                      ),
                                    ),
                                  ),
                                );
                          }
                        } else if (expiryDate!.isBefore(issuedDate!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please check your start and end dates'),
                            ),
                          );
                        }
                        // {status: success, id: 22, message: KYC created successfully.}
                        // {status: success, message: KYCDocument added successfully.}
                      },
                      label: 'Submit',
                    );
                  },
                ),
              ),
              kHeight50,

              // const GeneralInformationSection(),
              // const CompanyContactSection(),
              // const PanVatInformationSection(),
            ],
          ),
        );
      },
    );
  }
}
