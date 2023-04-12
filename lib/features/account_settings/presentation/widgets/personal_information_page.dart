import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state.theStates == TheStates.success) {
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
        } else if (state.theStates == TheStates.failure) {
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
        if (state.theStates == TheStates.success) {
          return Column(
            children: [
              const CustomModalSheetDrawerIcon(),
              kHeight10,
               Text(
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
                      child: CustomTextFormField(
                        hintText: state.taskerProfile?.user?.email ?? '',
                        onChanged: (p0) => setState(
                          () {
                            email = p0;
                          },
                        ),
                      ),
                    ),
                    CustomFormField(
                      label: 'Contact',
                      child: CustomTextFormField(
                        textInputType: TextInputType.number,
                        hintText: state.taskerProfile?.user?.phone ?? '',
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
                        onChanged: (p0) => setState(
                          () {
                            contact = p0;
                          },
                        ),
                      ),
                    ),
                    CustomFormField(
                      label: 'Date of birth',
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
                          hintText: DateFormat('yyyy-MM-dd').format(
                            dob ??
                                state.taskerProfile?.dateOfBirth ??
                                DateTime.now(),
                          ),
                        ),
                      ),
                    ),
                    CustomFormField(
                      label: 'Please specify your gender',
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
                      child: CustomTextFormField(
                        maxLines: 3,
                        hintText: bio ?? 'Enter Bio',
                        onChanged: (p0) => setState(
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
                callback: () {
                  final x = {
                    "date_of_birth": DateFormat("yyyy-MM-dd").format(
                      dob ?? state.taskerProfile?.dateOfBirth ?? DateTime.now(),
                    ),
                    "bio": bio ?? state.taskerProfile?.bio ?? 'Bio',
                    // "gender":  getGender(),
                  };
                  context.read<UserBloc>().add(
                        UserEdited(
                          req: x,
                        ),
                      );
                },
                label: 'Save',
              )
            ],
          );
        } else {
          return const Center(
            child: CardLoading(height: 200,),
          );
        }
      },
    );
  }
}
