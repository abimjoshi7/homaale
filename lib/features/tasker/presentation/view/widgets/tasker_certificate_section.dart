import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/text.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerCertificateSection extends StatelessWidget {
  const TaskerCertificateSection({super.key, required this.certificate});

  final List<Certificate> certificate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          elevation: 5,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Certificates',
                  style: kText17,
                ),
                addVerticalSpace(16),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemCount: certificate.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          certificate[index].name.toString(),
                          style: kHeading3seconday,
                        ),
                        kHeight8,
                        Text(
                          certificate[index].issuingOrganization.toString(),
                          style: kSubHeading,
                        ),
                        kHeight8,
                        Text(
                          certificate[index].credentialId.toString(),
                          style: kSubHeading,
                        ),
                        kHeight8,
                        certificate[index].doesExpire ?? false
                            ? Text(
                                '${Jiffy(certificate[index].issuedDate.toString()).yMMMM} - ${certificate[index].expireDate != null ? Jiffy(certificate[index].expireDate.toString()).yMMMM : 'Present'}',
                                style: kInfo,
                              )
                            : Text(
                                '${Jiffy(certificate[index].issuedDate.toString()).yMMMM} ',
                                style: kInfo,
                              ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomHorizontalDivider(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
