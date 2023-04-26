import 'dart:io';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/locator.dart';
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
  final kycBloc = locator<KycBloc>();

  @override
  void initState() {
    kycBloc
      ..add(
        KycDocumentLoaded(),
      )
      ..add(
        KycModelLoaded(),
      )
      ..add(
        KycDocTypeLoaded(),
      );
    super.initState();
  }

  @override
  void dispose() {
    identityTypeController.dispose();
    fullNameController.dispose();
    identityNumberController.dispose();
    issuedFromController.dispose();
    kycBloc.close();
    file?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KycBloc, KycState>(
      bloc: kycBloc,
      // listenWhen: (previous, current) {
      //   if (previous.kycId == null && current.kycId != null) {
      //     return true;
      //     // if (current.theStates == TheStates.success &&
      //     //     current.list?.length != 0) return true;
      //   }
      //   return previous.theStates == TheStates.loading;
      // },
      listener: (context, state) async {
        print(kycBloc.state.kycId);
        if (state.kycId != null && state.theStates == TheStates.loading) {
          kycBloc.add(
            KycAdded(
              addKycReq: AddKycReq(
                kyc: state.kycId as int,
                documentType: identityTypeController.text,
                documentId: identityNumberController.text,
                isCompany: false,
                issuedDate: issuedDate,
                validThrough: expiryDate ?? DateTime(3000),
                issuerOrganization: issuedFromController.text,
                file: await MultipartFile.fromFile(
                  file!.path,
                ),
              ),
            ),
          );
        }
        if (state.theStates == TheStates.success && state.isCreated == true) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: "Success",
              content: "Kyc document uploaded successfully",
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

        if (state.theStates == TheStates.failure && state.isCreated == false) {
          kycBloc.add(
            KycModelDeleted(),
          );
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: "Failure",
              content: "Kyc document cannot be uploaded",
              onTap: () {},
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.theStates == TheStates.loading)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight50,
              CustomHeader(
                child: const Text(
                  'KYC Details',
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'KYC Details',
                  style: Theme.of(context).textTheme.headlineSmall,
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
                      children: <Widget>[
                        CustomFormField(
                          label: 'Identify Type',
                          isRequired: true,
                          child: CustomDropDownField<String>(
                            onChanged: state.list?.length != 0
                                ? null
                                : (value) {
                                    setState(
                                      () {
                                        identityTypeController.text = value!;
                                      },
                                    );
                                  },
                            list: val,
                            hintText: "Choose document type",
                          ),
                        ),
                        CustomFormField(
                          label: 'Full Name',
                          isRequired: true,
                          child: CustomTextFormField(
                            validator: validateNotEmpty,
                            onSaved: (p0) {
                              setState(() {
                                fullNameController.text = p0!;
                              });
                            },
                            readOnly: state.kycModel != null,
                            hintText: state.kycModel?.fullName?.length == 0
                                ? ""
                                : state.kycModel?.fullName ?? "",
                            onFieldSubmitted: (p0) {
                              print(kycBloc.state);
                            },
                          ),
                        ),
                        CustomFormField(
                          label: 'Identity number',
                          isRequired: true,
                          child: CustomTextFormField(
                            readOnly: state.list?.length != 0,
                            hintText: state.list?.length == 0
                                ? ""
                                : state.list?.first.documentId ?? "",
                            validator: validateNotEmpty,
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
                            readOnly: state.list?.length != 0,
                            validator: validateNotEmpty,
                            hintText: state.list?.length == 0
                                ? ""
                                : state.list?.first.issuerOrganization ?? "",
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
                                child: CustomFormContainer(
                                  hintText: state.list?.length == 0
                                      ? issuedDate != null
                                          ? DateFormat("yyyy-MM-dd").format(
                                              issuedDate!,
                                            )
                                          : "yyyy-mm-dd"
                                      : state.list?.first.issuedDate != null
                                          ? DateFormat("yyyy-MM-dd").format(
                                              state.list!.first.issuedDate!,
                                            )
                                          : "No date available",
                                  leadingWidget: Icon(
                                    Icons.calendar_month_rounded,
                                    color: Theme.of(context).indicatorColor,
                                  ),
                                  callback: state.list?.length != 0
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
                                                issuedDate = value;
                                              },
                                            ),
                                          );
                                        },
                                ),
                              ),
                            ),
                            kWidth20,
                            Flexible(
                              child: CustomFormField(
                                label: 'Expiry Date',
                                child: CustomFormContainer(
                                  hintText: state.list?.length == 0
                                      ? expiryDate != null
                                          ? DateFormat("yyyy-MM-dd").format(
                                              expiryDate!,
                                            )
                                          : "yyyy-mm-dd"
                                      : state.list?.first.validThrough != null
                                          ? DateFormat("yyyy-MM-dd").format(
                                              state.list!.first.validThrough!,
                                            )
                                          : "No date available",
                                  leadingWidget: Icon(
                                    Icons.calendar_month_rounded,
                                    color: Theme.of(context).indicatorColor,
                                  ),
                                  callback: state.list?.length != 0
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
                                                expiryDate = value;
                                              },
                                            ),
                                          );
                                        },
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
                                    'Maximum file size 5 MB',
                                    // style: kHelper13,
                                  ),
                                  kWidth10,
                                  Icon(
                                    Icons.info_outline,
                                    size: 14,
                                    color: Color(0xffFF9700),
                                  )
                                ],
                              ),
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
                                child: file == null
                                    ? state.list?.length == 0
                                        ? CustomDottedContainerStack()
                                        : ConstrainedBox(
                                            constraints: BoxConstraints.expand(
                                              height: 200,
                                              width: double.maxFinite,
                                            ),
                                            child: Image.network(
                                              state.list?.first.file ??
                                                  kNoImageNImg,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                    : ConstrainedBox(
                                        constraints: BoxConstraints.expand(
                                          height: 200,
                                          width: double.maxFinite,
                                        ),
                                        child: Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: state.list?.isEmpty ?? true,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomElevatedButton(
                                callback: () async {
                                  print(kycBloc.state);
                                  if (_key.currentState!.validate()) {
                                    _key.currentState!.save();
                                    kycBloc.add(
                                      KycInitiated(
                                        createKycReq: CreateKycReq(
                                          fullName: fullNameController.text,
                                          address: issuedFromController.text,
                                          country: 'NP',
                                          isCompany: false,
                                          extraData: ExtraData(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                label: 'Submit',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
