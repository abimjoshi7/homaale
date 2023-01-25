import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          countryName = state.user.country as String?;
          addressLine1 = state.user.addressLine1;
          addressLine2 = state.user.addressLine2 as String?;
          languages = state.user.language as String?;
          currency = state.user.chargeCurrency;

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
                          list: const [
                            'Australia',
                            'Nepal',
                          ],
                          onSaved: (value) => setState(
                            () {
                              countryName = value;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Address Line 1',
                        isRequired: false,
                        child: CustomTextFormField(
                          hintText: state.user.addressLine1 ?? 'Baneshwor',
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
                          hintText: state.user.addressLine2.toString(),
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
                          list: const [
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
                          list: const [
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
                  _key.currentState!.save();

                  // final user = {
                  //   "country": countryName ?? state.user.country,
                  //   "address_line1": addressLine1!.isEmpty
                  //       ? state.user.addressLine1
                  //       : addressLine1,
                  //   "address_line2": addressLine2!.isEmpty
                  //       ? state.user.addressLine2
                  //       : addressLine2,
                  //   "language": languages ?? state.user.language,
                  //   "charge_currency": currency ?? state.user.chargeCurrency,
                  //   "charge_currency":
                  // 	ChargeCurrency(
                  //   	code: 'NPR',
                  //   	name:
                  //   ),
                  // };
                  // print(user);

                  // await context.read<UserBloc>().editTaskeruser(user);
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
                children: const [
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
