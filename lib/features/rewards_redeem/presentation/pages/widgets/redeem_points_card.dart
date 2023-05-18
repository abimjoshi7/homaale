import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../../content_client/presentation/pages/terms_of_use.dart';

class RedeemPointsCard extends StatefulWidget {
  const RedeemPointsCard({
    Key? key,
    this.redeemCount,
    this.imagePath,
    this.description,
    this.rating,
    this.location,
    this.callback,
  }) : super(key: key);

  final String? redeemCount;
  final String? imagePath;
  final String? description;
  final String? rating;
  final String? location;
  final VoidCallback? callback;

  @override
  State<RedeemPointsCard> createState() => _RedeemPointsCardState();
}

class _RedeemPointsCardState extends State<RedeemPointsCard> {
  bool isChecked = false;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 126,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                      kServiceImageNImg,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Makeup Durbar Pvt. Ltd'),
                  addHorizontalSpace(10),
                  Image.asset('assets/reward.png'),
                  Text('500 RP'),
                ],
              ),
              addVerticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    context
                            .read<UserBloc>()
                            .state
                            .taskerProfile
                            ?.profileImage ??
                        "",
                    fit: BoxFit.contain,
                    height: 30,
                    width: 30,
                  ),
                  addHorizontalSpace(5),
                  Text(context.read<UserBloc>().state.taskerProfile?.fullName ??
                      ""),
                ],
              ),
              addVerticalSpace(10),
              Text('Description', style: Theme.of(context).textTheme.bodySmall),
              addVerticalSpace(10),
              Text(
                'You are about to redeem your  ...name voucher. Please confirm below to proceed.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              addVerticalSpace(10),
              Text(
                'Expires On date',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.redAccent),
              ),
              addVerticalSpace(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CustomCheckBox(
                      boxColor: Colors.blue,
                      isChecked: isChecked,
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                  ),
                  addHorizontalSpace(8),
                  Flexible(
                    child: RichText(
                      strutStyle: const StrutStyle(fontFamily: 'Poppins'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'agree to the ',
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: 'terms & Conditions',
                            style: kHeading3.copyWith(
                                color: Colors.blue,
                                letterSpacing: 0.3,
                                fontSize: 12),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(
                                    context,
                                    TermsOfUsePage.routeName,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              CustomElevatedButton(
                callback: () {
                  if (isChecked == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please agree to the terms and policy.',
                        ),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                          heading: 'Congratulations',
                          content: 'You have successfully redeemed Promo-code.',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isSuccess: true),
                    );
                  }
                },
                label: 'Redeem Now',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.callback,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 160,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                  widget.imagePath ?? kServiceImageNImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/reward.png'),
                  addHorizontalSpace(10),
                  AutoSizeText(
                    widget.redeemCount ?? '23',
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  addHorizontalSpace(5),
                  AutoSizeText(
                    'Reward Point',
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ],
              ),
              addHorizontalSpace(5),
              AutoSizeText(
                widget.description ?? 'childAspectRatio',
                style: kLightBlueText14,
                overflow: TextOverflow.ellipsis,
              ),
              addVerticalSpace(5),
              SizedBox(
                height: 30,
                width: 110,
                child: CustomElevatedButton(
                  callback: () {
                    _dialogBuilder(context);
                  },
                  label: 'Redeem Now',
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              addVerticalSpace(5),
            ],
          ),
        ],
      ),
    );
  }
}
