import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/cubit/user_data_cubit.dart';
import 'package:cipher/networking/models/response/tasker_profile_retrieve_res.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInformationPage extends StatefulWidget {
  const AddressInformationPage({super.key});

  @override
  State<AddressInformationPage> createState() => _AddressInformationPageState();
}

class _AddressInformationPageState extends State<AddressInformationPage> {
  String? countryName;
  String? addressLine1;
  String? addressLine2;
  String? languages;
  ChargeCurrency? currency;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit, UserDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UserDataLoadSuccess) {
          countryName = state.userData.country as String?;
          addressLine1 = state.userData.addressLine1;
          addressLine2 = state.userData.addressLine2 as String?;
          languages = state.userData.language as String?;
          currency = state.userData.chargeCurrency;

          return Column(
            children: [
              const CustomModalSheetDrawerIcon(),
              kHeight20,
              const Text(
                'Address Information',
                style: kPurpleText19,
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: kPadding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        label: 'Country',
                        isRequired: false,
                        child: CustomDropDownField(
                          hintText: 'Specify your country',
                          list: [
                            'Australia',
                            'Nepal',
                          ],
                          onSaved: (value) => setState(
                            () {
                              countryName = value;
                              print(countryName);
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Address Line 1',
                        isRequired: false,
                        child: CustomTextFormField(
                          hintText: state.userData.addressLine1 ?? 'Baneshwor',
                          onSaved: (p0) => setState(
                            () {
                              addressLine1 = p0;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Address Line 2',
                        isRequired: false,
                        child: CustomTextFormField(
                          hintText: state.userData.addressLine2.toString(),
                          onSaved: (p0) => setState(
                            () {
                              addressLine2 = p0;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Languages',
                        isRequired: false,
                        child: CustomDropDownField(
                          hintText: 'Specify your language',
                          list: [
                            'English',
                            'Nepali',
                          ],
                          onSaved: (value) => setState(
                            () {
                              languages = value;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Currency',
                        isRequired: false,
                        child: CustomDropDownField(
                          hintText: 'Choose suitable currency',
                          list: [
                            'NPR',
                            'AUD',
                          ],
                          onSaved: (value) => setState(
                            () {
                              // currency = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                callback: () async {
                  print(countryName);
                  print(addressLine1);
                  print(addressLine2);
                  print(languages);
                  print(currency);
                  _key.currentState!.save();

                  final userData = {
                    "country": countryName ?? state.userData.country,
                    "address_line1": addressLine1!.isEmpty
                        ? state.userData.addressLine1
                        : addressLine1,
                    "address_line2": addressLine2!.isEmpty
                        ? state.userData.addressLine2
                        : addressLine2,
                    "language": languages ?? state.userData.language,
                    "charge_currency":
                        currency ?? state.userData.chargeCurrency,
                    // "charge_currency": ChargeCurrency(
                    // 	code: 'NPR',
                    // 	name:
                    // ),
                  };
                  // print(userData);

                  await context
                      .read<UserDataCubit>()
                      .editTaskerUserData(userData);
                },
                label: 'Save',
              ),
            ],
          );
        }
        return Column(
          children: [
            const CustomModalSheetDrawerIcon(),
            kHeight20,
            const Text(
              'Address Information',
              style: kPurpleText19,
            ),
            Padding(
              padding: kPadding20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormField(
                    label: 'Country',
                    isRequired: false,
                    child: CustomFormContainer(),
                  ),
                  CustomFormField(
                    label: 'Address Line 1',
                    isRequired: false,
                    child: CustomTextFormField(
                      hintText: 'Baneshwor',
                    ),
                  ),
                  CustomFormField(
                    label: 'Address Line 2',
                    isRequired: false,
                    child: CustomTextFormField(
                      hintText: 'Buddhanagar',
                    ),
                  ),
                  CustomFormField(
                    label: 'Languages',
                    isRequired: false,
                    child: CustomTextFormField(
                      hintText: 'English',
                    ),
                  ),
                  CustomFormField(
                    label: 'Currency',
                    isRequired: false,
                    child: CustomTextFormField(
                      hintText: 'Choose suitable currency',
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              callback: () {},
              label: 'Save',
            ),
          ],
        );
      },
    );
  }
}
