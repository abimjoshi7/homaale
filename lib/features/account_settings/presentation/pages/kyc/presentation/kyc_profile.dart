import 'dart:developer';
import 'dart:io';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/create_kyc_req.dart';
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
  XFile? selectedImage;
  bool isCamera = false;
  bool _isCompany = false;
  final List<String> _userType = ['Individual', 'Organization'];
  final _key = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<KycBloc>().add(KycProfileInitiated());
    setState(() {});
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _companyNameController.dispose();
    _countryController.dispose();
    _addressController.dispose();
    _key.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(appBarTitle: 'KYC Details'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                'KYC Details',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocConsumer<KycBloc, KycState>(
              listener: (_, state) {
                // TODO: implement listener
              },
              builder: (_, state) {
                if (state.theStates == TheStates.loading) {
                  return CardLoading(height: 500);
                }
                return Expanded(
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
                                showDialog(
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
                                  (value) async => await ImagePickHelper()
                                      .pickImagePath(
                                    isCamera: false,
                                  )
                                      .then(
                                    (value) {
                                      if (value != null) {
                                        setState(
                                          () {
                                            selectedImage = value;
                                          },
                                        );
                                      }
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
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: selectedImage == null
                                            ? const Placeholder(
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
                              initialValue: _userType[0],
                              list: _userType,
                              selectedIndex: 0,
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
                              // onChanged: (p0) {
                              //   setState(
                              //     () => {
                              //       // _fullNameController.text = p0.toString(),
                              //     },
                              //   );
                              // },
                              // readOnly: state.kycModel != null,
                              // hintText: state.kycModel?.fullName?.length == 0
                              //     ? ""
                              //     : state.kycModel?.fullName ?? "",
                              // onFieldSubmitted: (p0) {
                              //   print(kycBloc.state);
                              // },
                            ),
                          ),
                          _isCompany
                              ? CustomFormField(
                                  label: "Organization Name",
                                  isRequired: true,
                                  child: CustomTextFormField(
                                    controller: _companyNameController,
                                    validator: validateNotEmpty,
                                    // onChanged: (p0) {
                                    //   setState(() => {
                                    //         // _companyNameController.text =
                                    //         //     p0.toString(),
                                    //       });
                                    // },
                                    // readOnly: state.kycModel != null,
                                    // hintText: state.kycModel?.fullName?.length == 0
                                    //     ? ""
                                    //     : state.kycModel?.fullName ?? "",
                                    // onFieldSubmitted: (p0) {
                                    //   print(kycBloc.state);
                                    // },
                                  ),
                                )
                              : SizedBox.shrink(),
                          CustomFormField(
                            label: "Address",
                            isRequired: true,
                            child: CustomTextFormField(
                              controller: _addressController,
                              validator: validateNotEmpty,
                              // onChanged: (p0) {
                              //   setState(() {
                              //     // _addressController.text = p0.toString();
                              //   });
                              // },
                              // readOnly: state.kycModel != null,
                              // hintText: state.kycModel?.fullName?.length == 0
                              //     ? ""
                              //     : state.kycModel?.fullName ?? "",
                              // onFieldSubmitted: (p0) {
                              //   print(kycBloc.state);
                              // },
                            ),
                          ),

                          buildCountryDropDownField(state),

                          // return CardLoading(height: 50.0);

                          Visibility(
                            visible: true,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomElevatedButton(
                                  callback: () async {
                                    if (selectedImage == null ||
                                        _countryController.text.isEmpty) {
                                      await showDialog(
                                        context: context,
                                        builder: (context) => CustomToast(
                                          heading: "Error",
                                          content: (selectedImage == null)
                                              ? "Please Upload a Passport Size Photo"
                                              : "Please Select a Country",
                                          onTap: () {},
                                          isSuccess: false,
                                        ),
                                      );
                                    }
                                    if (_key.currentState!.validate() &&
                                        _countryController.text.isNotEmpty &&
                                        selectedImage != null) {
                                      _key.currentState!.save();

                                      if (!mounted) return;
                                      context.read<KycBloc>().add(
                                            KycInitiated(
                                              createKycReq: CreateKycReq(
                                                logo: await MultipartFile
                                                    .fromFile(
                                                        selectedImage!.path),
                                                isCompany: _isCompany,
                                                fullName:
                                                    _fullNameController.text,
                                                organizationName: _isCompany
                                                    ? _companyNameController
                                                        .text
                                                    : null,
                                                address:
                                                    _addressController.text,
                                                country:
                                                    _countryController.text,
                                              ),
                                            ),
                                          );
                                    } else {
                                      log('Form is not validated!');
                                    }
                                  },
                                  label: 'Next',
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCountryDropDownField(KycState state) {
    if (state.country != null) {
      return CustomFormField(
        label: 'Country',
        isRequired: true,
        child: CustomDropDownField<String>(
            list: state.country!.map((country) => country.name!).toList(),
            // ??
            // [],
            hintText: 'Select Country',
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
