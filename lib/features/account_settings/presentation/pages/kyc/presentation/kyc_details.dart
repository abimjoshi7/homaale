import 'dart:io';
import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/add_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/account.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class KycDetails extends StatelessWidget {
  const KycDetails({super.key});

  static const routeName = '/kyc-details';

  @override
  Widget build(BuildContext context) {
    return KycDetailMainView();
  }
}

class KycDetailMainView extends StatefulWidget {
  const KycDetailMainView({super.key});

  @override
  State<KycDetailMainView> createState() => _KycDetailMainViewState();
}

class _KycDetailMainViewState extends State<KycDetailMainView> {
  bool hasDocExpiryDate = true;
  final identityTypeController = TextEditingController();
  final identityNumberController = TextEditingController();
  final issuedFromController = TextEditingController();
  DateTime? issuedDate;
  DateTime? expiryDate;
  File? file;
  final _key = GlobalKey<FormState>();
  void setInitialValues(KycState state) {
    if (state.isNewDoc == true) {}
    if (state.list?.length != 0 && state.isNewDoc == false) {
      setState(() {
        identityTypeController.setText(state.list!
            .where((e) => e.id == state.kycId)
            .first
            .documentType!
            .id
            .toString());

        identityNumberController.setText(
            state.list!.where((e) => e.id == state.kycId).first.documentId!);

        issuedFromController.setText(state.list!
            .where((e) => e.id == state.kycId)
            .first
            .issuerOrganization!);
        issuedDate =
            state.list!.where((e) => e.id == state.kycId).first.issuedDate!;

        expiryDate =
            state.list?.where((e) => e.id == state.kycId).first.validThrough ??
                null;

        hasDocExpiryDate =
            state.list?.where((e) => e.id == state.kycId).first.validThrough !=
                    null
                ? true
                : false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setInitialValues(context.read<KycBloc>().state);
  }

  @override
  void dispose() {
    identityTypeController.dispose();
    identityNumberController.dispose();
    issuedFromController.dispose();
    // file?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();
    return BlocConsumer<KycBloc, KycState>(
      listenWhen: (previous, current) {
        if (previous.isDocCreated == false && current.isDocCreated == true)
          return true;
        if (previous.isDocEdited == false && current.isDocEdited == true)
          return true;
        if (previous.theStates != TheStates.failure &&
            current.theStates == TheStates.failure) return true;

        return false;
      },
      listener: (context, state) async {
        if (state.theStates == TheStates.success &&
            state.isDocCreated == true) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => CustomToast(
              heading: "Success",
              content: "Kyc document uploaded successfully",
              onTap: () {
                // context.read<KycBloc>().add(KycModelLoaded());
                context.read<KycBloc>().add(KycDocumentLoaded());
                context.read<KycBloc>().add(KycProfileInitiated());
                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == Root.routeName,
                );
              },
              isSuccess: true,
            ),
          );
        }
        if (state.theStates == TheStates.success && state.isDocEdited == true) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => CustomToast(
              heading: "Success",
              content: "Identity Document Edited Successfully.",
              onTap: () {
                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == AccountView.routeName,
                );
              },
              isSuccess: true,
            ),
          );
        }
        if (state.theStates == TheStates.failure &&
            (state.isDocCreated == false || state.isDocEdited == false)) {
          await showDialog(
            context: context,
            builder: (_) => CustomToast(
              heading: "Failure",
              content: state.errMsg ?? "Kyc Process Cannot Be Completed.",
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
          appBar: CustomAppBar(
            appBarTitle: state.list?.length != 0 && state.isNewDoc == false
                ? "Edit KYC Details"
                : "Add KYC Details",
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Identity Information',
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          buildIdentityTypeDropdown(state),
                          CustomFormField(
                            label: 'Identity number',
                            isRequired: true,
                            child: CustomTextFormField(
                              validator: validateNotEmpty,
                              controller: identityNumberController,
                            ),
                          ),
                          CustomFormField(
                            label: 'Issuer Organization',
                            isRequired: true,
                            child: CustomTextFormField(
                              validator: validateNotEmpty,
                              controller: issuedFromController,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: CustomFormField(
                                  label: 'Issued Date',
                                  isRequired: true,
                                  child: CustomFormContainer(
                                    hintText: issuedDate != null
                                        ? DateFormat("yyyy-MM-dd").format(
                                            issuedDate!,
                                          )
                                        : "yyyy-mm-dd",
                            

                                    leadingWidget: Icon(
                                      Icons.calendar_month_rounded,
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                    callback: () async {
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
                                  label: 'Valid Till',
                                  child: CustomFormContainer(
                                    hintText: expiryDate != null
                                        ? DateFormat("yyyy-MM-dd").format(
                                            expiryDate!,
                                          )
                                        : "yyyy-mm-dd",
                                    leadingWidget: Icon(
                                      Icons.calendar_month_rounded,
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                    callback: hasDocExpiryDate == false
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: <Widget>[
                                CustomCheckBox(
                                  isChecked: !hasDocExpiryDate,
                                  onTap: () {
                                    setState(
                                      () {
                                        hasDocExpiryDate = !hasDocExpiryDate;
                                      },
                                    );
                                  },
                                ),
                                addHorizontalSpace(10),
                                Flexible(
                                  child: Text('This document does not expire.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                ),
                              ],
                            ),
                          ),
                          CustomFormField(
                            label: 'Documents',
                            isRequired: true,
                            child: Column(
                              children: <Widget>[
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
                                      ? state.list?.length != 0 &&
                                              state.isNewDoc == false
                                          ? ConstrainedBox(
                                              constraints:
                                                  BoxConstraints.expand(
                                                height: 200,
                                                width: double.maxFinite,
                                              ),
                                              child: Image.network(
                                                state.list
                                                        ?.where((e) =>
                                                            e.id == state.kycId)
                                                        .first
                                                        .file ??
                                                    kNoImageNImg,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : CustomDottedContainerStack()
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
                            visible: true,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomElevatedButton(
                                  callback: () async {
                                    fieldValidations(state);
                                    if (state.list?.length != 0 &&
                                        state.isNewDoc == false) {
                                      Map<String, dynamic> editReq = {
                                        "document_id":
                                            identityNumberController.text,
                                        "issuer_organization":
                                            issuedFromController.text,
                                        "issued_date":
                                            DateFormat("yyyy-MM-dd").format(
                                          issuedDate!,
                                        ),
                                        "valid_through": hasDocExpiryDate
                                            ? DateFormat("yyyy-MM-dd").format(
                                                expiryDate!,
                                              )
                                            : null,
                                        "document_type": int.parse(
                                            identityTypeController.text)
                                      };
                                      if (file != null) {
                                        editReq.addAll({
                                          "file": await MultipartFile.fromFile(
                                              file!.path),
                                        });
                                      }
                                      if (_key.currentState!.validate()) {
                                        context.read<KycBloc>().add(
                                              KycDocEditLoaded(
                                                id: int.parse(
                                                  state.list
                                                      ?.where((e) =>
                                                          e.id == state.kycId)
                                                      .first
                                                      .documentId as String,
                                                ),
                                                editDocReq: editReq,
                                              ),
                                            );
                                      }
                                    }

                                    if (state.list?.length == 0 ||
                                        state.isNewDoc == true) {
                                      if (_key.currentState!.validate()) {
                                        // _key.currentState!.save();
                                        final AddKycReq x = AddKycReq(
                                          kyc: int.parse(
                                              state.kycModel!.id.toString()),
                                          documentType: int.parse(
                                              identityTypeController.text),
                                          documentId:
                                              identityNumberController.text,
                                          isCompany: state.kycModel!.isCompany,
                                          issuedDate: issuedDate,
                                          validThrough: hasDocExpiryDate
                                              ? expiryDate
                                              : null,
                                          issuerOrganization:
                                              issuedFromController.text,
                                          file: await MultipartFile.fromFile(
                                            file!.path,
                                          ),
                                        );

                                        context.read<KycBloc>().add(
                                              KycAdded(addKycReq: x),
                                            );
                                      }
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
              ),
            ],
          ),
        );
      },
    );
  }

  void fieldValidations(KycState state) {
    if (state.list?.length == 0 && file == null) {
      showDialog(
        context: context,
        builder: (_) => CustomToast(
          heading: "Failure",
          content: "Document File Upload Required.",
          onTap: () {},
          isSuccess: false,
        ),
      );
    }
    if (issuedDate == null) {
      showDialog(
        context: context,
        builder: (_) => CustomToast(
          heading: "Failure",
          content: "Document Issued Date Required.",
          onTap: () {},
          isSuccess: false,
        ),
      );
    }
    if (hasDocExpiryDate == true && expiryDate == null) {
      showDialog(
        context: context,
        builder: (_) => CustomToast(
          heading: "Failure",
          content: "Document Valid Till Date Required.",
          onTap: () {},
          isSuccess: false,
        ),
      );
    }
  }

  Widget buildIdentityTypeDropdown(KycState state) {
    if (state.docTypeList?.length != 0 && state.docTypeList != null) {
      return CustomFormField(
        label: 'Identity Type',
        isRequired: true,
        child: CustomDropDownField<String>(
          list: state.docTypeList?.map((e) => e.name!).toList() ?? [],
          selectedIndex: state.list?.length != 0 && state.isNewDoc == false
              ? state.docTypeList!.indexWhere(
                  (e) => e.name!.contains(
                    state.list!
                        .where((e) => e.id == state.kycId)
                        .first
                        .documentType!
                        .name
                        .toString(),
                  ),
                )
              : null,
          onChanged: (value) {
            setState(
              () {
                identityTypeController.text = state.docTypeList!
                    .where(
                      (e) => e.name!.contains(value.toString()),
                    )
                    .first
                    .id
                    .toString();
              },
            );
          },
          hintText: "Choose document type",
        ),
      );
    }
    return CardLoading(height: 50.0);
  }
}
