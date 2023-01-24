import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PersonalInformationPage extends StatefulWidget {
  static const routeName = '/personal-information-page';
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  bool isMale = true;
  bool isFemale = false;
  bool isOther = false;
  String? email;
  String? contact;
  DateTime? dob;
  String? bio;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state is userEditSuccess) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              isSuccess: true,
              heading: 'Success',
              content: 'Profile was edited successfully',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Root.routeName,
                (route) => false,
              ),
            ),
          );
        } else if (state is userEditFailure) {
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              isSuccess: false,
              heading: 'Failure',
              content: 'Profile cannot be edited',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Root.routeName,
                (route) => false,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          String getGender() {
            if (state.user.gender == null) {
              if (isMale) {
                return 'Male';
              } else if (isFemale) {
                return 'Female';
              } else {
                return 'Other';
              }
            } else {
              return state.user.gender!;
            }
          }

          email = state.user.user!.email;
          contact = state.user.user!.phone;
          dob = state.user.dateOfBirth;
          bio = state.user.bio;

          return Form(
            key: _key,
            child: Column(
              children: [
                const CustomModalSheetDrawerIcon(),
                kHeight10,
                const Text(
                  'Personal Information',
                  style: kPurpleText19,
                ),
                Padding(
                  padding: kPadding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        label: 'Email',
                        isRequired: false,
                        child: CustomTextFormField(
                          hintText: state.user.user!.email ?? '',
                          onSaved: (p0) => setState(
                            () {
                              email = p0;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Contact',
                        isRequired: false,
                        child: CustomTextFormField(
                          textInputType: TextInputType.number,
                          hintText: state.user.user!.phone ?? '',
                          prefixWidget: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/nepalflag.png'),
                                const Text(
                                  '+977',
                                  style: kBodyText1,
                                ),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          onSaved: (p0) => setState(
                            () {
                              contact = p0;
                            },
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Date of birth',
                        isRequired: false,
                        child: InkWell(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1800),
                              lastDate: DateTime(2080),
                            ).then(
                              (value) => setState(
                                () {
                                  dob = value;
                                },
                              ),
                            );
                          },
                          child: CustomFormContainer(
                            leadingWidget: const Icon(Icons.calendar_month),
                            hintText: DateFormat('yyyy-MM-dd').format(dob!),
                          ),
                        ),
                      ),
                      CustomFormField(
                        label: 'Please specify your gender',
                        isRequired: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChoiceChip(
                              selected: isMale,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffDEE2E6)),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  isMale = value;
                                  isFemale = !value;
                                  isOther = !value;
                                });
                              },
                              label: const Text(
                                'Male',
                                style: kHelper13,
                              ),
                              selectedColor: kColorPrimary,
                            ),
                            ChoiceChip(
                              selected: isFemale,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffDEE2E6)),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  isFemale = value;
                                  isMale = !value;
                                  isOther = !value;
                                });
                              },
                              label: const Text(
                                'Female',
                                style: kHelper13,
                              ),
                              selectedColor: kColorPrimary,
                            ),
                            ChoiceChip(
                              selected: isOther,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffDEE2E6)),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  isOther = value;
                                  isMale = !value;
                                  isFemale = !value;
                                });
                              },
                              label: const Text(
                                'Other',
                                style: kHelper13,
                              ),
                              selectedColor: kColorPrimary,
                            ),
                          ],
                        ),
                      ),
                      CustomFormField(
                        label: 'Bio',
                        isRequired: false,
                        child: CustomTextFormField(
                          maxLines: 3,
                          hintText: bio!,
                          onSaved: (p0) => setState(
                            () {
                              bio = p0;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight20,
                CustomElevatedButton(
                  callback: () async {
                    _key.currentState!.save();

                    final user = {
                      "date_of_birth": DateFormat("yyyy-MM-dd")
                          .format(dob ?? state.user.dateOfBirth!),
                      "bio": bio!.isEmpty ? state.user.bio : bio,
                      "gender": getGender(),
                    };

                    await context.read<UserBloc>().editTaskeruser(user);
                  },
                  label: 'Save',
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
