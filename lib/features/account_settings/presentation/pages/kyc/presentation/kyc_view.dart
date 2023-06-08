import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_profile.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class KycView extends StatelessWidget {
  const KycView({super.key});
  static const routeName = "/kyc-view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarTitle: "View KYC Details", trailingWidget: SizedBox()),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocBuilder<KycBloc, KycState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Basic Details',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Visibility(
                        visible: state.kycModel!.isKycVerified == false,
                        child: IconButton(
                          onPressed: () async {
                            await Navigator.pushNamed(
                              context,
                              KycProfile.routeName,
                            );
                          },
                          icon: Icon(
                            Icons.mode_edit_outlined,
                            color: Color(0xff64748B),
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(16.0),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: 84.0,
                          width: 84.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                            state.kycModel?.logo ?? kDefaultAvatarNImg,
                          ))),
                        ),
                      ),
                      addHorizontalSpace(24.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            state.kycModel!.fullName.toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          addVerticalSpace(8.0),
                          Text(
                            "${state.kycModel!.isCompany! ? "Organization" : "Individual"}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          addVerticalSpace(8.0),
                          Text(
                            state.kycModel!.user!.email!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  addVerticalSpace(15.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        size: 20.0,
                      ),
                      Text(
                        state.kycModel!.address!,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Color(0xff868E96)),
                      ),
                    ],
                  ),
                  addVerticalSpace(5.0),
                  RichText(
                    text: TextSpan(
                      text: 'Submitted On: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: DateFormat.yMMMEd()
                              .format(state.kycModel!.createdAt!),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Updated On: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: DateFormat.yMMMEd()
                              .format(state.kycModel!.updatedAt!),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(16.0),
                  CustomHorizontalDivider(),
                  addVerticalSpace(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      KycStatusBox(
                        attributeTitle: "Address",
                        status: state.kycModel!.address.toString(),
                        boxWidth: 84.0,
                      ),
                      KycStatusBox(
                        attributeTitle: 'KYC Verified',
                        status: state.kycModel!.isKycVerified!
                            ? "Verified"
                            : "Pending",
                        hasStatus: true,
                        isVerified: state.kycModel!.isKycVerified!,
                      ),
                      KycStatusBox(
                        attributeTitle: 'Address Verified',
                        status: state.kycModel!.isAddressVerified!
                            ? "Verified"
                            : "Pending",
                        hasStatus: true,
                        isVerified: state.kycModel!.isAddressVerified!,
                      ),
                    ],
                  ),
                  addVerticalSpace(31.0),
                  CustomHorizontalDivider(),
                  addVerticalSpace(10.0),
                  Text(
                    "KYC Documents",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.list!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomKycExpansionTile(
                        kycDoc: state.list![index],
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      onTap: () async {
                        context.read<KycBloc>().add(KycAddNewDocInitiated());
                        await Navigator.pushNamed(
                          context,
                          KycDetails.routeName,
                        );
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.add_circle_outline_rounded,
                        size: 20.0,
                      ),
                      horizontalTitleGap: -10.0,
                      title: Text(
                        "Add New Identity Type",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Color(0xff868E96),
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
