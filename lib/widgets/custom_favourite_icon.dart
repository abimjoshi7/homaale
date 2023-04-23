import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/saved/data/models/req/saved_add_req.dart';
import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({
    Key? key,
    required this.typeID,
    required this.type,
  }) : super(key: key);

  final String typeID;
  final String type;

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  String? objectId;

  @override
  void initState() {
    super.initState();
    context.read<SavedBloc>().add(SavedListLoaded(type: widget.type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      builder: (context, state) {
        var favItem = state.savedModelRes?.result?.where((element) => element.objectId == widget.typeID).toList();
        return GestureDetector(
          onTap: () {
            if (!CacheHelper.isLoggedIn) {
              notLoggedInPopUp(context);
            }
            context.read<SavedBloc>().add(
                  SavedAdded(
                    savedAddReq: SavedAddReq(
                      model: widget.type,
                      objectId: widget.typeID,
                    ),
                  ),
                );
          },
          child: Icon(
            favItem?.isNotEmpty ?? false ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
