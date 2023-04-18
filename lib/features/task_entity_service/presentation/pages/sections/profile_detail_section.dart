// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/saved/data/models/req/saved_add_req.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class ProfileDetailSection extends StatelessWidget {
  final TaskEntityServiceState state;
  const ProfileDetailSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.taskEntityService?.createdBy?.profileImage ?? kDefaultAvatarNImg,
                      ),
                    ),
                  ),
                ),
                addHorizontalSpace(
                  10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        state.taskEntityService?.title ?? '',
                        style: Theme.of(context).textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${state.taskEntityService?.createdBy?.firstName ?? ''}"
                      " ${state.taskEntityService?.createdBy?.lastName ?? ''}",
                      style: kLightBlueText14,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                CustomFavoriteIcon(
                  taskEntityServiceState: state,
                  type: "entityservice",
                ),
                kWidth10,
                GestureDetector(
                  onTap: () {
                    if (!CacheHelper.isLoggedIn) {
                      notLoggedInPopUp(context);
                    }
                    if (!CacheHelper.isLoggedIn) return;
                    final box = context.findRenderObject() as RenderBox?;
                    Share.share(
                      "Share this Hommale with friends.",
                      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                    );
                  },
                  child: const Icon(
                    Icons.share,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconText(
              label: state.taskEntityService?.rating?.first.rating.toString() ?? '4.5',
              iconData: Icons.star_outlined,
              color: kColorAmber,
              size: 18,
            ),
            IconText(
              label:
                  "${state.taskEntityService?.city?.name ?? ''}, ${state.taskEntityService?.city?.country?.name ?? ''}",
              iconData: Icons.location_on_outlined,
              size: 18,
              color: Colors.red,
            ),
          ],
        ),
        addVerticalSpace(10),
        HtmlRemover(
            text: state.taskEntityService?.description ??
                'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.'),
        addHorizontalSpace(10),
      ],
    );
  }
}

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({
    Key? key,
    required this.taskEntityServiceState,
    required this.type,
  }) : super(key: key);

  final TaskEntityServiceState taskEntityServiceState;
  final String type;

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  bool? isFavorite;
  String? objectId;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<SavedBloc>()
        ..add(
          SavedListLoaded(
            type: widget.type,
          ),
        );
    });
    super.initState();
    // context.read<SavedBloc>().add(
    //       SavedListLoaded(
    //         type: widget.type,
    //       ),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      builder: (context, state) {
        if (state.theStates == TheStates.loading)
          return SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(),
          );
        return GestureDetector(
          onTap: () async {
            // if (!CacheHelper.isLoggedIn) {
            //   notLoggedInPopUp(context);
            // }

            context.read<SavedBloc>().add(
                  SavedAdded(
                    savedAddReq: SavedAddReq(
                      model: widget.type,
                      objectId:
                          widget.taskEntityServiceState.taskEntityService?.id,
                    ),
                  ),
                );
            context.read<SavedBloc>().add(
                  SavedListLoaded(
                    type: widget.type,
                  ),
                );
            setState(() {
              isFavorite = state.savedModelRes?.result?.any(
                (element) =>
                    element.objectId! ==
                    widget.taskEntityServiceState.taskEntityService?.id,
              );
            });
            print(isFavorite);
          },
          child: Icon(
            isFavorite == true
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
