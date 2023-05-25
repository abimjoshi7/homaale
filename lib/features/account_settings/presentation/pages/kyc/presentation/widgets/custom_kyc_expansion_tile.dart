import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_list_res.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/widgets/kyc_status_box.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomKycExpansionTile extends StatelessWidget {
  const CustomKycExpansionTile({
    super.key,
    required this.kycDoc,
  });
  final KycListRes kycDoc;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: <Widget>[
          Icon(
            Icons.folder_rounded,
            size: 18.0,
            color: Color(0xff64748B),
          ),
          addHorizontalSpace(13.0),
          Text(
            kycDoc.documentType!.name.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xff5C6096),
                ),
          ),
          addHorizontalSpace(6.0),
          SizedBox(
              height: 17.0,
              width: 17.0,
              child: Image.asset(kycDoc.isVerified!
                  ? "assets/logos/Vector.png"
                  : "assets/logos/tabler-icon-x.png"))
        ],
      ),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          width: 382.0,
          height: 340.0,
          decoration: BoxDecoration(color: Color(0xffF9FAFB)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  KycStatusBox(
                    attributeTitle: "Document ID",
                    status: kycDoc.documentId,
                    hasStatus: false,
                    fontSize: 14.0,
                    removeSpaceBetween: true,
                  ),
                  Visibility(
                    visible: kycDoc.isVerified == false,
                    child: Padding(
                        padding: EdgeInsets.only(right: 3.0),
                        child: IconButton(
                          onPressed: () {
                            context
                                .read<KycBloc>()
                                .add(KycDocEditInitiated(kycId: kycDoc.id));
                            Navigator.pushNamed(
                              context,
                              KycDetails.routeName,
                            );
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 18.0,
                            color: Color(0xff64748B),
                          ),
                        )),
                  ),
                ],
              ),
              addVerticalSpace(8.0),
              KycStatusBox(
                attributeTitle: "Issuing Organization",
                status: kycDoc.issuerOrganization,
                hasStatus: false,
                removeSpaceBetween: true,
                fontSize: 14.0,
                boxWidth: 190.0,
              ),
              addVerticalSpace(8.0),
              KycStatusBox(
                attributeTitle: "Issued Date",
                status: DateFormat.yMd().format(kycDoc.issuedDate!),
                hasStatus: false,
                fontSize: 14.0,
                boxWidth: 90.0,
                removeSpaceBetween: true,
              ),
              KycStatusBox(
                attributeTitle: "Documents",
                status: Image.network(
                  kycDoc.file.toString(),
                  fit: BoxFit.cover,
                ),
                hasFile: true,
                boxHeight: 57.0,
                boxWidth: 60.0,
                removeSpaceBetween: true,
              ),
              kycDoc.comment != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: IconText(
                        label: (kycDoc.comment.toString().toTitleCase()) +
                            ". Please Fill Again.",
                        iconData: Icons.info_outline,
                        size: 20.0,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12.0,
                              color: Color(0xffFF9700),
                            ),
                        color: Color(0xffFF9700),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}
