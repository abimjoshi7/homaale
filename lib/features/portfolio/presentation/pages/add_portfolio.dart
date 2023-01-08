import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/cubit/tasker_portfolio_cubit.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_exprience.dart';
import 'package:cipher/features/sign_in/presentation/pages/cubit/sign_in_cubit.dart';
import 'package:cipher/networking/models/request/tasker_portfolio_req.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class AddPortfolio extends StatefulWidget {
  const AddPortfolio({super.key});
  static const routeName = '/add-portfolio';

  @override
  State<AddPortfolio> createState() => _AddPortfolioState();
}

class _AddPortfolioState extends State<AddPortfolio> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final issuedDateController = TextEditingController();
  final credentialUrlController = TextEditingController();
  DateTime? issuedDate;
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    issuedDateController.dispose();
    credentialUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              child: const Text(
                'Add Portfolio',
              ),
            ),
            const CustomHorizontalDivider(),
            Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Please enter the title',
                      onSaved: (p0) {
                        setState(() {
                          titleController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Description',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      maxLines: 3,
                      hintText: 'Write something...',
                      onSaved: (p0) {
                        setState(() {
                          descriptionController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Issued Date',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      prefixWidget: GestureDetector(
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2012),
                            lastDate: DateTime(2050),
                          ).then((value) {
                            setState(() {
                              issuedDate = value;
                            });
                          });
                        },
                        child: const Icon(
                          Icons.calendar_month,
                          color: kColorPrimary,
                        ),
                      ),
                      hintText: '03/06/1999',
                      onSaved: (p0) async {},
                    ),
                    kHeight20,
                    const Text(
                      'Credential URL',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'URL',
                      onSaved: (p0) {
                        setState(() {
                          credentialUrlController.text = p0!;
                        });
                      },
                    ),
                    kHeight20,
                    const Text(
                      'Gallery',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const Text('Add relevant images or videos'),
                    kHeight5,
                    SizedBox(
                      height: 150,
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images.png'),
                              kHeight20,
                              const Text(
                                'Upload or Browse image',
                              ),
                              kHeight10,
                              const Text(
                                'Maximum Image Size 20 MB',
                                style: kHelper1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    kHeight20,
                    const Text(
                      'Files',
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const Text('Add relevant images or videos'),
                    kHeight5,
                    SizedBox(
                      height: 150,
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/qwe.png'),
                              kHeight20,
                              const Text(
                                'Upload or Browse image',
                              ),
                              kHeight10,
                              const Text(
                                'Maximum Image Size 20 MB',
                                style: kHelper1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<TaskerPortfolioCubit, TaskerPortfolioState>(
              listener: (context, state) async {
                final error = await CacheHelper.getCachedString(kErrorLog);
                if (state is TaskerPortfolioSuccess) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Portfolio created successfully.'),
                    ),
                  );
                  Navigator.pushNamed(
                    context,
                    AddExperience.routeName,
                  );
                } else if (state is TaskerPortfolioFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error!),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Center(
                  child: CustomElevatedButton(
                    callback: () async {
                      _key.currentState!.save();
                      final taskerPortfolioReq = TaskerPortfolioReq(
                        title: titleController.text,
                        description: descriptionController.text,
                        issuedDate: issuedDate,
                        credentialUrl:
                            'https://${credentialUrlController.text}',
                        files: [],
                        images: [],
                      );

                      await context.read<TaskerPortfolioCubit>().addPortfolio(
                            taskerPortfolioReq,
                          );
                    },
                    label: 'Add',
                  ),
                );
              },
            ),
            kHeight50
          ],
        ),
      ),
    );
  }
}
