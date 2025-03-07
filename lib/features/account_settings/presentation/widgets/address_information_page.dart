import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
  String? currency;
  List<CountryModel>? countryList = [];
  List<LanguageModel>? languageList = [];
  List<CurrencyModel>? currencyList = [];
  void setInitialValues(TaskerProfile? taskerProfile) => setState(() {
        countryName = taskerProfile?.country?.name ?? '';
        addressLine1 = taskerProfile?.addressLine1 ?? '';
        addressLine2 = taskerProfile?.addressLine2 ?? '';
      });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isEdited == true) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Address information updated successfully',
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   Root.routeName,
                //   (route) => false,
                // );
              },
              isSuccess: true,
            ),
          );
        }
        if (state.theStates == TheStates.failure && state.isEdited == false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: 'Address information update failed',
              onTap: () {},
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          // user = state.taskerProfile?.user;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  addVerticalSpace(10),
                  Text(
                    'Address Information',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  addVerticalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<CountryBloc, CountryState>(
                        builder: (context, countryState) {
                          if (countryState is CountryLoadSuccess) {
                            countryList = countryState.list;
                          }
                          return CustomFormField(
                            label: 'Country',
                            isRequired: true,
                            child: CustomDropDownField(
                              hintText: state.taskerProfile?.country?.name ??
                                  'Specify your country',
                              list: countryList?.map((e) => e.name).toList() ??
                                  [
                                    'Australia',
                                    'Nepal',
                                  ],
                              onChanged: (value) => setState(
                                () {
                                  countryName = value;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      addVerticalSpace(10),
                      CustomFormField(
                        label: 'Address Line 1',
                        isRequired: true,
                        child: CustomTextFormField(
                          validator: (p0) =>
                              p0!.isEmpty ? 'Required Field' : null,
                          hintText: state.taskerProfile?.addressLine1 ?? '',
                          onChanged: (p0) => setState(
                            () {
                              addressLine1 = p0;
                            },
                          ),
                        ),
                      ),
                      addVerticalSpace(10),
                      CustomFormField(
                        label: 'Address Line 2',
                        child: CustomTextFormField(
                          hintText: state.taskerProfile?.addressLine2 ?? '',
                          onChanged: (p0) => setState(
                            () {
                              addressLine2 = p0;
                            },
                          ),
                        ),
                      ),
                      addVerticalSpace(10),
                      BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, languageState) {
                          if (languageState is LanguageLoadSuccess) {
                            languageList = languageState.language;
                          }
                          return CustomFormField(
                            label: 'Languages',
                            isRequired: true,
                            child: CustomDropdownSearch(
                              hintText: state.taskerProfile?.language?.name ??
                                  'Specify your language',
                              list: languageList?.map((e) => e.name).toList() ??
                                  [
                                    'English',
                                    'Nepali',
                                  ],
                              onChanged: (value) => setState(
                                () {
                                  languages = value.toString();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      addVerticalSpace(10),
                      CustomFormField(
                        label: 'Currency',
                        isRequired: true,
                        child: BlocBuilder<CurrencyBloc, CurrencyState>(
                          builder: (context, currencyState) {
                            if (currencyState is CurrencyLoadSuccess) {
                              currencyList = currencyState.currencyListRes;
                            }
                            return CustomDropdownSearch(
                              hintText:
                                  state.taskerProfile?.chargeCurrency?.name ??
                                      'Choose suitable currency',
                              list: currencyList?.map((e) => e.name).toList() ??
                                  [
                                    'NPR',
                                    'AUD',
                                  ],
                              onChanged: (value) => setState(
                                () {
                                  currency = value.toString();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      addVerticalSpace(10),
                    ],
                  ),
                  addVerticalSpace(
                    8,
                  ),
                ],
              ),
              CustomElevatedButton(
                callback: () {
                  String? countryCode;
                  String? languageCode;
                  String? currencyCode;

                  for (final x in countryList!) {
                    if (countryName == x.name) {
                      setState(() {
                        countryCode = x.code;
                      });
                    }
                  }
                  for (final x in languageList!) {
                    if (languages == x.name) {
                      setState(() {
                        languageCode = x.code;
                      });
                    }
                  }
                  for (final x in currencyList!) {
                    if (currency == x.name) {
                      setState(() {
                        currencyCode = x.code;
                      });
                    }
                  }
                  final Map<String, dynamic> map = {
                    "country":
                        countryCode ?? state.taskerProfile?.country?.code,
                    "address_line1":
                        addressLine1 ?? state.taskerProfile?.addressLine1,
                    "address_line2":
                        addressLine2 ?? state.taskerProfile?.addressLine2,
                    "language":
                        languageCode ?? state.taskerProfile?.language?.code,
                    "charge_currency": currencyCode ??
                        state.taskerProfile?.chargeCurrency?.code,
                  };
                  context.read<UserBloc>().add(
                        UserEdited(
                          req: map,
                        ),
                      );
                },
                label: 'Save',
              ),
              kHeight10,
              CustomElevatedButton(
                callback: () async {
                  Navigator.pop(context);
                },
                label: 'Cancel',
                textColor: kColorPrimary,
                mainColor: Colors.white,
                borderColor: kColorPrimary,
              ),
            ]),
          );
        }
        return Center(child: CustomLoader());
      },
    );
  }
}
