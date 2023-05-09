import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class FollowFollowingWidget extends StatelessWidget {
  const FollowFollowingWidget({
    super.key,
    this.profileImg,
    this.name,
    this.designation,
    this.callBackLabel,
    this.callback,
    this.showCallbackButton,
  });

  final String? profileImg;
  final String? name;
  final String? designation;
  final String? callBackLabel;
  final VoidCallback? callback;
  final bool? showCallbackButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              profileImg ?? kServiceImageNImg,
            ),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.circle,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
            child: Text(
              name ?? 'Name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            designation ?? 'Designation',
            style: textTheme.bodySmall,
          )
        ],
      ),
      trailing: showCallbackButton ?? false
          ? ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.2),
              child: CustomElevatedButton(
                theHeight: 30,
                mainColor: kColorGrey,
                label: callBackLabel ?? 'Remove',
                textColor: Colors.black,
                textStyle: textTheme.bodySmall,
                callback: callback ?? () {},
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
