import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dio/dio.dart';
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
  String? currency;
  TaskerProfileRetrieveRes? user;
  List<CountryModel>? countryList = [];
  List<LanguageModel>? languageList = [];
  List<CurrencyModel>? currencyList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserEditSuccess) {
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
        if (state is UserEditFailure) {
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
        if (state is UserLoadSuccess) {
          user = state.user;

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
                    BlocBuilder<CountryBloc, CountryState>(
                      builder: (context, countryState) {
                        if (countryState is CountryLoadSuccess) {
                          countryList = countryState.list;
                        }
                        return CustomFormField(
                          label: 'Country',
                          isRequired: false,
                          child: CustomDropDownField(
                            hintText:
                                (state.user.country?['name'] as String?) ??

                                    // (state.user.country as String?) ??
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
                    CustomFormField(
                      label: 'Address Line 1',
                      isRequired: false,
                      child: CustomTextFormField(
                        hintText: state.user.addressLine1 ?? 'Baneshwor',
                        onChanged: (p0) => setState(
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
                        onChanged: (p0) => setState(
                          () {
                            addressLine2 = p0;
                          },
                        ),
                      ),
                    ),
                    BlocBuilder<LanguageBloc, LanguageState>(
                      builder: (context, languageState) {
                        if (languageState is LanguageLoadSuccess) {
                          languageList = languageState.language;
                        }
                        return CustomFormField(
                          label: 'Languages',
                          isRequired: false,
                          child: CustomDropDownField(
                            hintText:
                                (state.user.language?['name'] as String?) ??
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
                    CustomFormField(
                      label: 'Currency',
                      isRequired: false,
                      child: BlocBuilder<CurrencyBloc, CurrencyState>(
                        builder: (context, currencyState) {
                          if (currencyState is CurrencyLoadSuccess) {
                            currencyList = currencyState.currencyListRes;
                          }
                          return CustomDropDownField(
                            hintText:
                                (state.user.chargeCurrency?.name as String?) ??
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
                  ],
                ),
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
                    "country": countryCode ?? user?.country,
                    "address_line1": addressLine1 ?? user!.addressLine1,
                    "address_line2": addressLine2 ?? user!.addressLine2,
                    "language": languageCode ?? user!.language,
                    "charge_currency":
                        currencyCode ?? user!.chargeCurrency!.code,
                  };

                  context.read<UserBloc>().add(
                        UserEdited(
                          req: map,
                        ),
                      );
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
