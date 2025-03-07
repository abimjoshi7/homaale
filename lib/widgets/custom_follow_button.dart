// import 'package:cipher/core/app/root.dart';
// import 'package:cipher/core/cache/cache_helper.dart';
// import 'package:cipher/core/constants/constants.dart';
// import 'package:cipher/features/saved/data/models/req/saved_add_req.dart';
// import 'package:cipher/features/saved/presentation/bloc/saved_bloc.dart';
// import 'package:cipher/locator.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';

// class CustomFollowButton extends StatefulWidget {
//   const CustomFollowButton({
//     Key? key,
//     required this.typeID,
//     this.followed = false,
//   }) : super(key: key);

//   final String typeID;
//   final bool followed;

//   @override
//   State<CustomFollowButton> createState() => _CustomFollowButtonState();
// }

// class _CustomFollowButtonState extends State<CustomFollowButton> {
//   String? objectId;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => locator<SavedBloc>(),
//       child: BlocBuilder<SavedBloc, SavedState>(
//         builder: (context, state) {
//           switch (state.theStates) {
//             case TheStates.initial:
//               return InkWell(
//                 onTap: () {
//                   if (!CacheHelper.isLoggedIn) {
//                     notLoggedInPopUp(context);
//                   }
//                   context.read<SavedBloc>().add(
//                         SavedAdded(
//                           savedAddReq: SavedAddReq(
//                             model: widget.type.name,
//                             objectId: widget.typeID,
//                           ),
//                         ),
//                       );
//                 },
//                 child: Icon(
//                   widget.followed ? Icons.bookmark : Icons.bookmark_outline,
//                   color: Colors.red,
//                 ),
//               );
//             case TheStates.loading:
//               return context.watch<SavedBloc>().state.idToBeSaved == widget.typeID
//                   ? SizedBox(
//                       height: 15,
//                       width: 20,
//                       child: CircularProgressIndicator(strokeWidth: 1),
//                     )
//                   : Icon(
//                       widget.followed ? Icons.bookmark : Icons.bookmark_outline,
//                       color: Colors.red,
//                     );
//             case TheStates.success:
//               return InkWell(
//                 onTap: () {
//                   if (!CacheHelper.isLoggedIn) {
//                     notLoggedInPopUp(context);
//                   }
//                   context.read<SavedBloc>().add(
//                         SavedAdded(
//                           savedAddReq: SavedAddReq(
//                             model: widget.type.name,
//                             objectId: widget.typeID,
//                           ),
//                         ),
//                       );
//                 },
//                 child: Icon(
//                   state.savedAddRes?.status == 'add' ? Icons.bookmark : Icons.bookmark_border_outlined,
//                   color: Colors.red,
//                 ),
//               );
//             default:
//               return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
