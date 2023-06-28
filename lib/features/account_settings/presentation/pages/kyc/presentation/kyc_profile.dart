import 'dart:developer';
import 'dart:io';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/compress_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_view.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/account_view.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class KycProfile extends StatefulWidget {
  const KycProfile({super.key});
  static const routeName = '/kyc-profile-details';
  @override
  State<KycProfile> createState() => _KycProfileState();
}

class _KycProfileState extends State<KycProfile> {
  File? selectedImage;
  bool isCamera = false;
  bool _isCompany = false;
  final List<String> _userType = ['Individual', 'Organization'];
  final _key = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  void setInitialValues(KycState state) {
    if (state.kycModel != null) {
      setState(() {
        _fullNameController.setText(state.kycModel!.fullName!);
        state.kycModel!.isCompany!
            ? _companyNameController.setText(state.kycModel!.organizationName!)
            : null;
        _addressController.setText(state.kycModel!.address!);
        _countryController.setText(state.kycModel!.country!.code!);
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
    _fullNameController.dispose();
    _companyNameController.dispose();
    _countryController.dispose();
    _addressController.dispose();
    // _key.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KycBloc, KycState>(
      listener: (_, state) async {
        if (state.theStates == TheStates.success &&
            state.isProfileCreated == true) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => CustomToast(
              heading: "Success",
              content: "Tasker Profile Filled Successfully.",
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  KycDetails.routeName,
                );
              },
              isSuccess: true,
            ),
          );
        }
        if (state.theStates == TheStates.success &&
            state.isProfileEdited == true) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => CustomToast(
              heading: "Success",
              content: "Tasker Profile Edited Successfully.",
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
        // if (state.theStates == TheStates.failure &&
        //     (state.isProfileCreated == false)) {
        //   await showDialog(
        //     context: context,
        //     builder: (_) => CustomToast(
        //       heading: "Failure",
        //       content: state.errMsg?.toString().toTitleCase() ??
        //           "Something Went Wrong. Please Try Again.",
        //       onTap: () {},
        //       isSuccess: false,
        //     ),
        //   );
        // }
        // if (state.theStates == TheStates.failure &&
        //     (state.isProfileEdited == false)) {
        //   await showDialog(
        //     context: context,
        //     builder: (_) => CustomToast(
        //       heading: "Failure",
        //       content: state.errMsg?.toString().toTitleCase() ??
        //           "Something Went Wrong. Please Try Again.",
        //       onTap: () {},
        //       isSuccess: false,
        //     ),
        //   );
        // }
      },
      builder: (_, state) {
        if (state.theStates == TheStates.loading) {
          return CardLoading(height: 500.0);
        }
        return WillPopScope(
          onWillPop: () async {
            if (state.kycModel == null) {
              Navigator.pushNamed(
                context,
                AccountView.routeName,
              );
            }
            if (state.kycModel != null) {
              Navigator.pushNamed(
                context,
                KycView.routeName,
              );
            }
            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: CustomAppBar(
              trailingWidget: SizedBox.shrink(),
              appBarTitle:
                  state.kycModel != null ? 'Edit KYC Details' : 'KYC Details',
              leadingWidget: IconButton(
                onPressed: () {
                  if (state.kycModel == null) {
                    Navigator.pushNamed(
                      context,
                      AccountView.routeName,
                    );
                  }
                  if (state.kycModel != null) {
                    Navigator.pushNamed(
                      context,
                      KycView.routeName,
                    );
                  }
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      'General Information',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CustomFormField(
                              label: "Passport Size Photo",
                              isRequired: true,
                              child: InkWell(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: WidgetText(
                                          callback: () {
                                            setState(
                                              () => isCamera = false,
                                            );
                                            Navigator.pop(context);
                                          },
                                          widget: Icon(Icons.image_search),
                                          label: "Gallery"),
                                    ),
                                  ).then(
                                    (value) async => await ImagePicker()
                                        .pickImage(source: ImageSource.gallery)
                                        .then(
                                      (value) async {
                                        final file = await CompressHelper()
                                            .compressFileAsync(
                                          File(
                                            value!.path,
                                          ),
                                        );
                                        if (file.lengthSync() > 5093309) {
                                          await showDialog(
                                            context: context,
                                            builder: (_) => CustomToast(
                                              heading: "Failure",
                                              content:
                                                  "File Size Must Be Less Than 5MB.",
                                              onTap: () {},
                                              isSuccess: false,
                                            ),
                                          );
                                        }
                                        if (file.lengthSync() > 5093309) return;
                                        setState(
                                          () {
                                            selectedImage = file;
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: (selectedImage == null)
                                              ? (state.kycModel != null)
                                                  ? Image.network(
                                                      state.kycModel!.logo!)
                                                  : const Placeholder(
                                                      color: kColorSecondary,
                                                    )
                                              : Image.file(
                                                  fit: BoxFit.cover,
                                                  File(
                                                    selectedImage?.path ?? '',
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomFormField(
                              label: 'User Type',
                              isRequired: true,
                              child: CustomDropDownField(
                                validator: validateNotEmpty,
                                initialValue: (state.kycModel != null)
                                    ? state.kycModel!.isCompany ?? true
                                        ? _userType[1]
                                        : _userType[0]
                                    : _isCompany
                                        ? _userType[1]
                                        : _userType[0],
                                list: _userType,
                                hintText: 'Select User Type',
                                onChanged: (value) {
                                  if (value == _userType.last) {
                                    setState(
                                      () => _isCompany = true,
                                    );
                                  }
                                  if (value == _userType.first) {
                                    setState(
                                      () => _isCompany = false,
                                    );
                                  }
                                  log("Is Company? : $_isCompany");
                                },
                              ),
                            ),
                            CustomFormField(
                              label: _isCompany
                                  ? "Representative Name"
                                  : "Full Name",
                              isRequired: true,
                              child: CustomTextFormField(
                                controller: _fullNameController,
                                validator: validateNotEmpty,
                                hintText: state.kycModel?.fullName?.length == 0
                                    ? ""
                                    : state.kycModel?.fullName ?? "",
                                hintStyle: (state.kycModel != null)
                                    ? TextStyle(color: Colors.grey.shade500)
                                    : null,
                              ),
                            ),
                            _isCompany
                                ? CustomFormField(
                                    label: "Organization Name",
                                    isRequired: true,
                                    child: CustomTextFormField(
                                      controller: _companyNameController,
                                      validator:
                                          _isCompany ? validateNotEmpty : null,
                                      hintText: state.kycModel?.organizationName
                                                  ?.length ==
                                              0
                                          ? ""
                                          : state.kycModel?.organizationName ??
                                              "",
                                      hintStyle: (state.kycModel != null)
                                          ? TextStyle(
                                              color: Colors.grey.shade500)
                                          : null,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            CustomFormField(
                              label: "Address",
                              isRequired: true,
                              child: CustomTextFormField(
                                controller: _addressController,
                                validator: validateNotEmpty,
                                hintText: state.kycModel?.address?.length == 0
                                    ? ""
                                    : state.kycModel?.address ?? "",
                                hintStyle: (state.kycModel != null)
                                    ? TextStyle(color: Colors.grey.shade500)
                                    : null,
                              ),
                            ),
                            buildCountryDropDownField(state),
                            Visibility(
                              visible: true,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomElevatedButton(
                                    callback: () async {
                                      log("state test: ${state.theStates}");

                                      if (state.kycModel != null) {
                                        Map<String, dynamic> editReq = {
                                          "full_name": _fullNameController.text,
                                          "is_company": _isCompany,
                                          "organization_name": _isCompany
                                              ? _companyNameController.text
                                              : null,
                                          "address": _addressController.text,
                                          "country": _countryController.text
                                        };
                                        if (selectedImage != null) {
                                          editReq.addAll({
                                            "logo":
                                                await MultipartFile.fromFile(
                                                    selectedImage!.path),
                                          });
                                        }
                                        if (_key.currentState!.validate() &&
                                            _countryController
                                                .text.isNotEmpty) {
                                          context
                                              .read<KycBloc>()
                                              .add(KycProfileEditLoaded(
                                                editKycReq: editReq,
                                              ));
                                        }
                                      }
                                      if (state.kycModel != null) return;
                                      if (selectedImage == null) {
                                        await showDialog(
                                          context: context,
                                          builder: (context) => CustomToast(
                                            heading: "Error",
                                            content:
                                                "Please Upload a Passport Size Photo",
                                            onTap: () {},
                                            isSuccess: false,
                                          ),
                                        );
                                      }
                                      if (_key.currentState!.validate() &&
                                          _countryController.text.isNotEmpty &&
                                          selectedImage != null) {
                                        // _key.currentState!.save();

                                        if (!mounted) return;
                                        final req = CreateKycReq(
                                          logo: await MultipartFile.fromFile(
                                              selectedImage!.path),
                                          isCompany: _isCompany,
                                          fullName: _fullNameController.text,
                                          organizationName: _isCompany
                                              ? _companyNameController.text
                                              : null,
                                          address: _addressController.text,
                                          country: _countryController.text,
                                        );
                                        if (state.kycModel == null) {
                                          context.read<KycBloc>().add(
                                                KycInitiated(
                                                  createKycReq: req,
                                                ),
                                              );
                                        }
                                      }
                                    },
                                    label: 'Continue',
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
            ),
          ),
        );
      },
    );
  }

  Widget buildCountryDropDownField(KycState state) {
    if (state.country != null) {
      return CustomFormField(
        label: 'Country',
        isRequired: true,
        child: CustomDropDownField<String>(
            validator: (p0) =>
                _countryController.text.isEmpty ? "Required Field" : null,
            list: state.country!.map((country) => country.name!).toList(),
            hintText: 'Select Country',
            selectedIndex: (state.kycModel != null)
                ? state.country!.indexOf(state.country!
                    .firstWhere((e) => e == state.kycModel!.country!))
                : _countryController.text.isNotEmpty
                    ? state.country!.indexOf(
                        state.country!.firstWhere(
                          (e) => e.code!.contains(_countryController.text),
                        ),
                      )
                    : null,
            onChanged: (value) {
              setState(
                () => _countryController.text = state.country!
                    .where(
                      (e) => e.name!.contains(value.toString()),
                    )
                    .first
                    .code
                    .toString(),
              );
            }),
      );
    }
    return CardLoading(height: 50.0);
  }
}
