import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Address information updated successfully',
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
        if (state.theStates == TheStates.failure) {
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
                            child: CustomDropDownField(
                              hintText: state.taskerProfile?.country?.name ??
                                  'Specify your country',
                              list: countryList?.map((e) => e.name).toList() ??
                                  [
                                    'Australia',
                                    'Nepal',
                                  ],
                              onChanged: (value) {
                                setState(
                                  () async {
                                    countryName = value;
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                      addVerticalSpace(10),
                      CustomFormField(
                        label: 'Address Line 1',
                        child: CustomTextFormField(
                          hintText:
                              state.taskerProfile?.addressLine1 ?? 'Baneshwor',
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
                            child: CustomDropDownField(
                              hintText: state.taskerProfile?.language?.name ??
                                  'Specify your language',
                              list: languageList?.map((e) => e.name).toList() ??
                                  [
                                    'English',
                                    'Nepali',
                                  ],
                              onChanged: (value) => setState(
                                () {
                                  languages = value;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      addVerticalSpace(10),
                      CustomFormField(
                        label: 'Currency',
                        child: BlocBuilder<CurrencyBloc, CurrencyState>(
                          builder: (context, currencyState) {
                            if (currencyState is CurrencyLoadSuccess) {
                              currencyList = currencyState.currencyListRes;
                            }
                            return CustomDropDownField(
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
                                  currency = value;
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
                callback: () async {
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
                  final map = {
                    "country": countryCode ?? state.taskerProfile?.country,
                    "address_line1":
                        addressLine1 ?? state.taskerProfile?.addressLine1,
                    "address_line2":
                        addressLine2 ?? state.taskerProfile?.addressLine2,
                    "language": languageCode ?? state.taskerProfile?.language,
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
                callback: () {
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
        return Column(
          children: [
            const CustomModalSheetDrawerIcon(),
            kHeight20,
            Text(
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
                    child: CustomFormContainer(),
                  ),
                  CustomFormField(
                    label: 'Address Line 1',
                    child: CustomTextFormField(
                      hintText: 'Baneshwor',
                    ),
                  ),
                  CustomFormField(
                    label: 'Address Line 2',
                    child: CustomTextFormField(
                      hintText: 'Buddhanagar',
                    ),
                  ),
                  CustomFormField(
                    label: 'Languages',
                    child: CustomTextFormField(
                      hintText: 'English',
                    ),
                  ),
                  CustomFormField(
                    label: 'Currency',
                    child: CustomTextFormField(
                      hintText: 'Choose suitable currency',
                    ),
                  ),
                ],
              ),
            ),
            // CustomElevatedButton(
            //   callback: () {},
            //   label: 'Save',
            // ),
          ],
        );
      },
    );
  }
}
