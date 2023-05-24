import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem.event.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../content_client/presentation/pages/terms_of_use.dart';
import '../../bloc/redeem.state.dart';

class RedeemPointsCard extends StatelessWidget {
  const RedeemPointsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RedeemBloc, RedeemState>(
        listener: (context, state) async {
      final error = await CacheHelper.getCachedString(kErrorLog);
      if (state.theState == TheStates.success) {
        await showDialog(
          context: context,
          builder: (context) => CustomToast(
            heading: 'Success',
            content: state.redeemSubmitMessage,
            onTap: () {
              Navigator.pop(context);
            },
            isSuccess: true,
          ),
        );
      }
      if (state.theState == TheStates.failure) {
        await showDialog(
          context: context,
          builder: (context) => CustomToast(
            heading: 'Failure',
            content: error ?? "Please try again.",
            onTap: () {},
            isSuccess: false,
          ),
        );
      }
    }, builder: (context, state) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 1,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          itemCount: state.redeemList.result?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            context.read<RedeemBloc>().add(RedeemItemsDetails(
                redeemId:
                    context.read<RedeemBloc>().state.redeem[index].id ?? 0));
            context.read<RedeemBloc>().add(SubmitRedeemEvent(
                redeemID:
                    context.read<RedeemBloc>().state.redeem[index].id ?? 0));
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 80,
                  width: 160,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.redeemList.result?[index].image ??
                            kServiceImageNImg,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/reward.png'),
                          addHorizontalSpace(10),
                          AutoSizeText(
                            state.redeemList.result?[index].redeemPoints
                                    .toString() ??
                                "",
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
                      Text(
                        state.redeemList.result?[index].description ?? '',
                        style: kLightBlueText14,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                      addVerticalSpace(5),
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: CustomElevatedButton(
                          callback: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialogueOfRedeemItemsDetails(
                                    state: state,
                                  );
                                });
                          },
                          label: 'Redeem Now',
                          textStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      addVerticalSpace(5),
                    ],
                  ),
                ),
              ],
            );
          });
    });
  }
}

class AlertDialogueOfRedeemItemsDetails extends StatefulWidget {
  final RedeemState state;
  const AlertDialogueOfRedeemItemsDetails({Key? key, required this.state})
      : super(key: key);

  @override
  State<AlertDialogueOfRedeemItemsDetails> createState() =>
      _AlertDialogueOfRedeemItemsDetailsState();
}

class _AlertDialogueOfRedeemItemsDetailsState
    extends State<AlertDialogueOfRedeemItemsDetails> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
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
                  widget.state.redeemItemsDetail.image ?? kServiceImageNImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          addVerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.state.redeemItemsDetail.entityServices?.first.title ??
                  ""),
              addHorizontalSpace(30),
              Image.asset('assets/reward.png'),
              addHorizontalSpace(5),
              Text(widget.state.redeemItemsDetail.redeemPoints.toString()),
            ],
          ),
          addVerticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.state.redeemItemsDetail.entityServices?.first.createdBy
                      ?.profileImage !=
                  null)
                Image.network(
                  widget.state.redeemItemsDetail.entityServices?.first.createdBy
                          ?.profileImage
                          .toString() ??
                      kServiceImageNImg,
                  fit: BoxFit.contain,
                  height: 30,
                  width: 30,
                ),
              addHorizontalSpace(5),
              Text(widget.state.redeemItemsDetail.entityServices?.first
                      .createdBy?.fullName ??
                  ""),
            ],
          ),
          addVerticalSpace(10),
          Text(widget.state.redeemItemsDetail.description ?? "",
              style: Theme.of(context).textTheme.bodySmall),
          addVerticalSpace(10),
          RichText(
            text: TextSpan(
              text: 'You are about to redeem your ',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey),
              children: <TextSpan>[
                TextSpan(
                    text:
                        '${widget.state.redeemItemsDetail.entityServices?.first.title} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(text: 'voucher. Please confirm below to proceed.'),
              ],
            ),
          ),
          addVerticalSpace(10),
          if (widget.state.redeemItemsDetail.endDate != null)
            Text(
              getVerboseDateTimeRepresentation(
                  widget.state.redeemItemsDetail.endDate!),
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
                  onTap: () async {
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
          BlocBuilder<RedeemBloc, RedeemState>(builder: (context, state) {
            return CustomElevatedButton(
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
                  context.read<RedeemBloc>().add(SubmitRedeemEvent(
                      redeemID:
                          context.read<RedeemBloc>().state.redeem.first.id ??
                              0));
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => CustomToast(
                        heading: state.redeemSubmitResponse.status == 'success'
                            ? 'Congratulations'
                            : 'Try Again!',
                        content: state.redeemSubmitMessage ?? "",
                        onTap: () {
                          Navigator.pop(context);
                        },
                        isSuccess: true),
                  );
                }
              },
              label: 'Redeem Now',
            );
          }),
        ],
      ),
    );
  }
}
