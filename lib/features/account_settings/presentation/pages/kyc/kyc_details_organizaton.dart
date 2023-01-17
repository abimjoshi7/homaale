import 'dart:io';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/cubit/kyc_cubit.dart';
import 'package:cipher/networking/models/request/kyc_req.dart';
import 'package:cipher/widgets/widgets.dart';
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
              onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              'KYC Details',
              style: kPurpleText19,
            ),
          ),
          Expanded(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Identity Type',
                          style: kPurpleText16,
                        ),
                        kWidth10,
                        Text(
                          '*',
                          style: TextStyle(
                            color: Color(0xffFE5050),
                          ),
                        ),
                      ],
                    ),
                    kHeight5,
                    DropdownButtonFormField<String>(
                      // value: 'a',
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        // constraints: BoxConstraints(minHeight: theHeight),
                        hintText: 'Choose your document type here.',
                        hintStyle: const TextStyle(
                          color: Color(0xff9CA0C1),
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffDEE2E6)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffDEE2E6)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: val.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          identityTypeController.text = value!;
                        });
                      },
                    ),
                    kHeight20,
                    Row(
                      children: const [
                        Text(
                          'Full Name',
                          style: kPurpleText16,
                        ),
                        kWidth10,
                        Text(
                          '*',
                          style: TextStyle(
                            color: Color(0xffFE5050),
                          ),
                        ),
                      ],
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Harry Smith',
                      onSaved: (p0) => setState(() {
                        fullNameController.text = p0!;
                      }),
                    ),
                    kHeight20,
                    Row(
                      children: const [
                        Text(
                          'Identity number',
                          style: kPurpleText16,
                        ),
                        kWidth10,
                        Text(
                          '*',
                          style: TextStyle(
                            color: Color(0xffFE5050),
                          ),
                        ),
                      ],
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: '1321321-121-232323',
                      onSaved: (p0) => setState(() {
                        identityNumberController.text = p0!;
                      }),
                    ),
                    kHeight20,
                    Row(
                      children: const [
                        Text(
                          'Issued',
                          style: kPurpleText16,
                        ),
                        kWidth10,
                        Text(
                          '*',
                          style: TextStyle(
                            color: Color(0xffFE5050),
                          ),
                        ),
                      ],
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Kathmandu',
                      onSaved: (p0) => setState(() {
                        issuedFromController.text = p0!;
                      }),
                    ),
                    kHeight20,
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Issued Date',
                                    style: kPurpleText16,
                                  ),
                                  kWidth10,
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      color: Color(0xffFE5050),
                                    ),
                                  ),
                                ],
                              ),
                              kHeight5,
                              InkWell(
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
                                  hintText:
                                      issuedDate?.toString().substring(0, 10) ??
                                          '1999-06-13',
                                  leadingWidget: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        kWidth20,
                        Flexible(
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Expiry Date',
                                    style: kPurpleText16,
                                  ),
                                  kWidth10,
                                  Text(
                                    '*',
                                    style: TextStyle(
                                      color: Color(0xffFE5050),
                                    ),
                                  ),
                                ],
                              ),
                              kHeight5,
                              InkWell(
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
                                  hintText:
                                      expiryDate?.toString().substring(0, 10) ??
                                          '1999-06-13',
                                  leadingWidget: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    kHeight20,
                    Row(
                      children: const [
                        Text(
                          'Documents',
                          style: kPurpleText16,
                        ),
                        kWidth10,
                        Text(
                          '*',
                          style: TextStyle(
                            color: Color(0xffFE5050),
                          ),
                        ),
                      ],
                    ),
                    kHeight5,
                    Row(
                      children: [
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
                        file = await FilePickHelper.filePicker();
                      },
                      child: const CustomFormContainer(
                        hintText: '+ Select files',
                      ),
                    ),
                    kHeight20,
                  ],
                ),
              ),
            ),
          ),
          kHeight20,
          Center(
            child: BlocConsumer<KycCubit, KycState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () async {
                    _key.currentState!.save();

                    final x = await context.read<KycCubit>().initialKyc({
                      'full_name': fullNameController.text,
                      'is_company': false,
                      'organization_name': 'string',
                      'address': 'string',
                      'extra_data': {
                        'additionalProp1': 'string',
                        'additionalProp2': 'string',
                        'additionalProp3': 'string'
                      },
                      'company': null,
                      'country': 'Nepal'
                    });
                    print(x);

                    // print(identityTypeController.text);
                    // final KycReq kycReq = KycReq(
                    //   kyc: 0,
                    //   documentType: identityTypeController.text,
                    //   isCompany: false,
                    //   documentId: identityNumberController.text,
                    //   issuerOrganization: issuedFromController.text,
                    //   issuedDate: issuedDate,
                    //   validThrough: expiryDate,
                    //   file: file!.readAsStringSync(),
                    // );
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
  }
}
