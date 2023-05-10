import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/widgets/kyc_status_box.dart';
import 'package:flutter/material.dart';

class CustomKycExpansionTile extends StatelessWidget {
  const CustomKycExpansionTile({super.key});

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
            "Citizenship",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xff5C6096),
                ),
          ),
        ],
      ),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          width: 382.0,
          height: 306.0,
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
                    status: "1234567",
                    hasStatus: false,
                    fontSize: 14.0,
                    removeSpaceBetween: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 3.0),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 18.0,
                      color: Color(0xff64748B),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(8.0),
              KycStatusBox(
                attributeTitle: "Issuing Organization",
                status: "Department of Joe mama",
                hasStatus: false,
                removeSpaceBetween: true,
                fontSize: 14.0,
                boxWidth: 190.0,
              ),
              addVerticalSpace(8.0),
              KycStatusBox(
                attributeTitle: "Issued Date",
                status: "2023-01-09",
                hasStatus: false,
                fontSize: 14.0,
                boxWidth: 90.0,
                removeSpaceBetween: true,
              ),
              KycStatusBox(
                attributeTitle: "Documents",
                status: Text("hello"),
                hasFile: true,
                boxHeight: 57.0,
                boxWidth: 60.0,
                removeSpaceBetween: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
