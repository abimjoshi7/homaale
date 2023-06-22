import 'package:cipher/features/redeem/data/models/redeem_items_detail.dart';
import 'package:cipher/features/redeem/data/models/request_redeem_list.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem.event.dart';
import 'package:cipher/features/redeem/presentation/bloc/redeem_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../../../content_client/presentation/pages/terms_of_use.dart';
import '../../bloc/redeem.state.dart';

class RedeemPointsCard extends StatefulWidget {
  const RedeemPointsCard({Key? key}) : super(key: key);

  @override
  State<RedeemPointsCard> createState() => _RedeemPointsCardState();
}

class _RedeemPointsCardState extends State<RedeemPointsCard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RedeemBloc, RedeemState>(
        listener: (context, state) async {
      context.read<RedeemBloc>().add(RedeemItemsDetails(
          redeemId:
              context.read<RedeemBloc>().state.redeem[currentIndex].id ?? 0));
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
    }, builder: (context, state) {
      return state.status == TheStates.initial
          ? CardLoading(height: 100)
          : state.redeem.length == 0 &&  state.status ==TheStates.success
              ? SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('No Redeem Item Found.'),
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 4,
                    crossAxisCount: 2,
                  ),
                  itemCount: state.hasReachedMax
                      ? state.redeem.length
                      : state.redeem.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.redeem.length
                        ? BottomLoader()
                        : Column(
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
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      state.redeem[index].image ?? kHomaaleImg,
                                    ),
                                    fit: BoxFit.contain,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/reward.png'),
                                        addHorizontalSpace(10),
                                        AutoSizeText(
                                          state.redeem[index].redeemPoints
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        addHorizontalSpace(5),
                                        AutoSizeText(
                                          'Reward Point',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ],
                                    ),
                                    addHorizontalSpace(5),
                                    Text(
                                      state.redeem[index].description ?? '',
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
                                          currentIndex = index;
                                          context.read<RedeemBloc>().add(
                                              SubmitRedeemEvent(
                                                  redeemID: context
                                                          .read<RedeemBloc>()
                                                          .state
                                                          .redeem[index]
                                                          .id ??
                                                      0));
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialogueOfRedeemItemsDetails(
                                                  state: state.redeem,
                                                  entityService:
                                                      state.entityService,
                                                  currentIndex: currentIndex,
                                                );
                                              });
                                        },
                                        label: 'Redeem Now',
                                        textStyle: TextStyle(
                                            fontSize: 12, color: Colors.white),
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
  final List<Result> state;
  final List<EntityService> entityService;
  final int currentIndex;

  const AlertDialogueOfRedeemItemsDetails(
      {Key? key,
      required this.state,
      required this.entityService,
      required this.currentIndex})
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
    var ItemDetails = widget.state[widget.currentIndex];
    var entitySer = widget.entityService.first;
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
                image: NetworkImage(ItemDetails.image ?? kHomaaleImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          addVerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  // widget.state.redeemItemsDetail.entityServices?[widget.index]
                  ItemDetails.title ?? ""),
              addHorizontalSpace(30),
              Image.asset('assets/reward.png'),
              addHorizontalSpace(5),
              Text(ItemDetails.redeemPoints.toString()),
            ],
          ),
          addVerticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (entitySer.createdBy?.profileImage != null)
                Image.network(
                  entitySer.createdBy?.profileImage.toString() ?? kHomaaleImg,
                  fit: BoxFit.contain,
                  height: 30,
                  width: 30,
                ),
              addHorizontalSpace(5),
              Text(entitySer.createdBy?.fullName ?? ""),
            ],
          ),
          addVerticalSpace(10),
          Text(ItemDetails.description ?? "",
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
                    text: '${ItemDetails.title} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(text: 'voucher. Please confirm below to proceed.'),
              ],
            ),
          ),
          addVerticalSpace(10),
          if (ItemDetails.endDate != null)
            Text(
              // getVerboseDateTimeRepresentation(ItemDetails.endDate),
              ItemDetails.endDate!.toString(),
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
                  if (state.redeemSubmitResponse.status == 'success')
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                          heading: state.redeemSubmitResponse.status ?? "",
                          content: state.redeemSubmitMessage,
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
