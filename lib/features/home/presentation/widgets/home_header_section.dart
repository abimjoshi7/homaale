import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xff3D3F7D),
      child: Column(
        children: [
          kHeight50,
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Profile.routeName,
                );
              },
              child: const CircleAvatar(),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi, Sristi'),
                kHeight5,
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined),
                    Text('Buddhanagar, Kathmandu'),
                    Icon(Icons.arrow_drop_down)
                  ],
                )
              ],
            ),
            trailing: IconButton(
              onPressed: () async {
                await NetworkHelper().getTaskerProfile();
              },
              icon: const Icon(
                Icons.notifications_none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: const CustomTextFormField(
                prefixWidget: Icon(Icons.search),
                hintText: 'search here',
              ),
            ),
          )
        ],
      ),
    );
  }
}
