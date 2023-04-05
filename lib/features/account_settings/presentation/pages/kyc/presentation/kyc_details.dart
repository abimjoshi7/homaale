import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class KycDetails extends StatefulWidget {
  const KycDetails({super.key});

  static const routeName = '/kyc-details';

  @override
  State<KycDetails> createState() => _KycDetailsState();
}

class _KycDetailsState extends State<KycDetails> {
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
  File? file;
  final _key = GlobalKey<FormState>();

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
    return BlocConsumer<KycBloc, KycState>(
      listener: (context, state) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (state is KycAddSuccess) {
          if (!mounted) return;
          await showDialog(
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
        }
        if (state is KycAddFailure) {
          if (!mounted) return;
          await showDialog(
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
          if (!mounted) return;
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
        Widget displayName() {
          return CustomTextFormField(
            onChanged: (p0) => setState(
              () {
                fullNameController.text = p0!;
              },
            ),
          );
        }

        Widget displayDocType() {
          if (state is KycLoadSuccess) {
            return CustomDropDownField(
              onChanged: (value) => setState(
                () {
                  identityTypeController.text = value!;
                },
              ),
              list: val,
              hintText: state.list.first.documentType!,
            );
          } else {
            return CustomDropDownField(
              onChanged: (value) => setState(
                () {
                  identityTypeController.text = value!;
                },
              ),
              list: val,
              hintText: 'Choose your document type here',
            );
          }
        }

        Widget displayDocId() {
          if (state is KycLoadSuccess) {
            return CustomTextFormField(
              validator: validateNotEmpty,
              hintText: state.list.first.documentId!,
              onSaved: (p0) => setState(
                () {
                  identityNumberController.text = p0!;
                },
              ),
            );
          }
          return CustomTextFormField(
            validator: validateNotEmpty,
            hintText: '123321-123-123123',
            onSaved: (p0) => setState(
              () {
                identityNumberController.text = p0!;
              },
            ),
          );
        }

        Widget displayIssued() {
          if (state is KycLoadSuccess) {
            return CustomTextFormField(
              validator: validateNotEmpty,
              hintText: state.list.first.issuerOrganization!,
              onSaved: (p0) => setState(
                () {
                  issuedFromController.text = p0!;
                },
              ),
            );
          }
          return CustomTextFormField(
            validator: validateNotEmpty,
            hintText: 'Kathmandu',
            onSaved: (p0) => setState(
              () {
                issuedFromController.text = p0!;
              },
            ),
          );
        }

        Widget displayIssuedDate() {
          if (state is KycLoadSuccess) {
            return CustomFormContainer(
              hintText:
                  "${state.list.first.issuedDate?.year}-${state.list.first.issuedDate?.weekday}-${state.list.first.issuedDate?.day}",
              leadingWidget: const Icon(
                Icons.calendar_month_rounded,
                color: kColorPrimary,
              ),
            );
          }
          return CustomFormContainer(
            hintText: issuedDate?.toString().substring(0, 10) ?? '1999-06-13',
            leadingWidget: const Icon(
              Icons.calendar_month_rounded,
              color: kColorPrimary,
            ),
          );
        }

        Widget displayExpiryDate() {
          if (state is KycLoadSuccess) {
            return CustomFormContainer(
              hintText:
                  "${state.list.first.validThrough?.year}-${state.list.first.validThrough?.weekday}-${state.list.first.validThrough?.day}",
              leadingWidget: const Icon(
                Icons.calendar_month_rounded,
                color: kColorPrimary,
              ),
            );
          }
          return CustomFormContainer(
            hintText: expiryDate != null
                ? expiryDate?.toString().substring(0, 4) ?? 'yyyy'
                : 'yyyy',
            leadingWidget: const Icon(
              Icons.calendar_month_rounded,
              color: kColorPrimary,
            ),
          );
        }

        Widget displayDocuments() {
          if (state is KycLoadSuccess) {
            return SizedBox(
              height: 100,
              width: double.maxFinite,
              child: Image.network(
                state.list.first.file ?? kDefaultAvatarNImg,
                fit: BoxFit.cover,
              ),
            );
          }
          return CustomFormContainer(
            hintText: file?.path.substring(0, 30) ?? '+ Select files',
          );
        }

        Widget displayButton() {
          if (state is KycLoadSuccess) {
            return const SizedBox.shrink();
          }
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
                    content: Text('Please check your start and end dates'),
                  ),
                );
              }
              // {status: success, id: 22, message: KYC created successfully.}
              // {status: success, message: KYCDocument added successfully.}
            },
            label: 'Submit',
          );
        }

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
                    padding: EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      children: [
                        CustomFormField(
                          label: 'Identify Type',
                          isRequired: true,
                          child: displayDocType(),
                        ),
                        CustomFormField(
                          label: 'Full Name',
                          isRequired: true,
                          child: displayName(),
                        ),
                        CustomFormField(
                          label: 'Identity number',
                          isRequired: true,
                          child: displayDocId(),
                        ),
                        CustomFormField(
                          label: 'Issued',
                          isRequired: true,
                          child: displayIssued(),
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
                                  child: displayIssuedDate(),
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
                                  child: displayExpiryDate(),
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
                                child: displayDocuments(),
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
                child: displayButton(),
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
