import 'dart:io';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../models/kyc_model.dart';

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
  final TextEditingController _companyName = TextEditingController();
  List<Country> _countries = [];
  @override
  void initState() {
    super.initState();
    context.read<KycBloc>().add(KycProfileInitiated());
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _companyName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KycBloc, KycState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                Expanded(
                  child: Form(
                    key: _key,
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
                                  content: Flexible(
                                    child: WidgetText(
                                        callback: () {
                                          setState(
                                            () {
                                              isCamera = false;
                                            },
                                          );
                                          Navigator.pop(context);
                                        },
                                        widget: Icon(Icons.image_search),
                                        label: "Gallery"),
                                  ),
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
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
                            },
                          ),
                        ),
                        CustomFormField(
                          label:
                              _isCompany ? "Representative Name" : "Full Name",
                          isRequired: true,
                          child: CustomTextFormField(
                            validator: validateNotEmpty,
                            onSaved: (p0) {
                              setState(() {
                                // fullNameController.text = p0!;
                              });
                            },
                            // readOnly: state.kycModel != null,
                            // hintText: state.kycModel?.fullName?.length == 0
                            //     ? ""
                            //     : state.kycModel?.fullName ?? "",
                            // onFieldSubmitted: (p0) {
                            //   print(kycBloc.state);
                            // },
                          ),
                        ),
                        Visibility(
                          visible: _isCompany,
                          child: CustomFormField(
                            label: "Organization Name",
                            isRequired: true,
                            child: CustomTextFormField(
                              validator: validateNotEmpty,
                              onSaved: (p0) {
                                setState(() {
                                  // organizationName.text = p0!;
                                });
                              },
                              // readOnly: state.kycModel != null,
                              // hintText: state.kycModel?.fullName?.length == 0
                              //     ? ""
                              //     : state.kycModel?.fullName ?? "",
                              // onFieldSubmitted: (p0) {
                              //   print(kycBloc.state);
                              // },
                            ),
                          ),
                        ),
                        CustomFormField(
                          label: "Address",
                          isRequired: true,
                          child: CustomTextFormField(
                            validator: validateNotEmpty,
                            onSaved: (p0) {
                              setState(() {
                                // fullNameController.text = p0!;
                              });
                            },
                            // readOnly: state.kycModel != null,
                            // hintText: state.kycModel?.fullName?.length == 0
                            //     ? ""
                            //     : state.kycModel?.fullName ?? "",
                            // onFieldSubmitted: (p0) {
                            //   print(kycBloc.state);
                            // },
                          ),
                        ),
                        CustomFormField(
                          label: 'Country',
                          isRequired: true,
                          child: CustomDropDownField(
                            list: state.country ?? [],
                            hintText: 'Select Country',
                            onChanged: (value) => setState(
                              () {},
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomElevatedButton(
                                callback: () async {
                                  if (_key.currentState!.validate()) {
                                    _key.currentState!.save();
                                    // kycBloc.add(
                                    //   KycInitiated(
                                    //     createKycReq: CreateKycReq(
                                    //       fullName: fullNameController.text,
                                    //       address: issuedFromController.text,
                                    //       country: 'NP',
                                    //       isCompany: false,
                                    //       extraData: ExtraData(),
                                    //     ),
                                    //   ),
                                    // );
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
              ],
            ),
          ),
        );
      },
    );
  }
}
