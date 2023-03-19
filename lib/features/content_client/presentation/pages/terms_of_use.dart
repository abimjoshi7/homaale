import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/presentation/cubit/terms_of_use/terms_of_use_cubit.dart';
import 'package:cipher/features/content_client/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});
  static const String routeName = '/terms-of-use-page';

  @override
  State<TermsOfUsePage> createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  final _contentClientTitle = 'Terms of Use';
  String? _date;
  @override
  void initState() {
    super.initState();

    context.read<TermsOfUseCubit>().getTermsOfUseStatement();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomAppBar(appBarTitle: 'Terms Of Use'),
          const Divider(
            thickness: 0.5,
            color: Color(0xffCED4DA),
          ),
          addVerticalSpace(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.88,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    BlocConsumer<TermsOfUseCubit, TermsOfUseState>(
                      listener: (_, state) async {
                        if (state.theStates == TheStates.failure) {
                          showDialog(
                            context: context,
                            builder: (_) => CustomToast(
                              heading: 'Failure',
                              content: 'Failed to load updated privacy policy.',
                              onTap: () => {},
                              isSuccess: false,
                            ),
                          );
                          if (state.contentClient!.hasdata!) {
                            _date = DateFormat.yMMMEd()
                                .format(state.contentClient!.createdAt!);
                          }
                        }
                      },
                      builder: (_, state) {
                        if (state.theStates == TheStates.success) {
                          return ContentClientWidget(
                              state: state,
                              date: _date,
                              contentClientTitle: _contentClientTitle);
                        }
                        if (state.theStates == TheStates.failure) {
                          return ContentClientWidget(
                              state: state,
                              date: _date,
                              contentClientTitle: _contentClientTitle);
                        }

                        if (state.theStates == TheStates.initial) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
