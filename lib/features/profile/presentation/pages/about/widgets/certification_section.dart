import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/pages.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationSection extends StatelessWidget {
  const CertificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadSuccess) {
          return state.user.certificates == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: kPadding20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Certification',
                                style: kPurpleText19,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AddCertifications.routeName,
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            state.user.certificates?.length ?? 0,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse(
                                          state.user.certificates?[index]!
                                                  .certificateUrl ??
                                              'www.google.com',
                                        ),
                                      );
                                    },
                                    child: Text(
                                      state.user.certificates?[index]?.name ??
                                          '',
                                      style: kText17,
                                    ),
                                  ),
                                  Text(
                                    state.user.certificates?[index]
                                            ?.description ??
                                        '',
                                    style: kText15,
                                  ),
                                  if (state.user.certificates == null)
                                    const SizedBox.shrink()
                                  else
                                    Text(
                                      '${DateFormat('yyyy-MM-dd').format(state.user.certificates?[index]?.issuedDate ?? DateTime.now())} - ${DateFormat('yyyy-MM-dd').format(state.user.certificates?[index]?.expireDate ?? DateTime.now())}',
                                      style: kHelper13,
                                    ),
                                  const Divider()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }
        return Padding(
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Certification',
                style: kPurpleText19,
              ),
              kHeight10,
              Text('Garden Cleaner'),
              Text(
                'Cagtu. Full-time',
                style: kHelper13,
              ),
              Text(
                'I am excited about helping companies with their product development, management and strategy. I specialize in deep tech and hard analytical problems.',
              ),
              Text(
                'June 2002-Present',
                style: kHelper13,
              )
            ],
          ),
        );
      },
    );
  }
}
