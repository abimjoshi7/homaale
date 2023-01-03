import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account/presentation/pages/account.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(25),
        //   topRight: Radius.circular(25),
        // ),
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff211D4F),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          bottomNavItemName.length,
          (index) => CustomBottomNavigationBarItems(
            selectedColor: const Color(0xffffca6a),
            unSelectedColor: const Color(0xff9ca0c1),
            imagePath: bottomNavItemImagePath[index],
            label: bottomNavItemName[index],
            onTap: () {
              setState(() {
                selectedIndex = index;
                switch (selectedIndex) {
                  case 0:
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Home.routeName,
                      (route) => false,
                    );
                    break;
                  case 4:
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Account.routeName,
                      (route) => false,
                    );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<Widget>(
                    //     builder: (context) => Scaffold(
                    //       body: Center(
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             CustomElevatedButton(
                    //               label: 'Logout',
                    //               callback: () async {
                    //                 await SharedPrefs.clearAll().then(
                    //                   (value) =>
                    //                       Navigator.pushNamedAndRemoveUntil(
                    //                     context,
                    //                     SignInWithPhone.routeName,
                    //                     (route) => false,
                    //                   ),
                    //                 );
                    //               },
                    //             ),
                    //             kHeight50,
                    //             CustomElevatedButton(
                    //               label: 'Cancel',
                    //               callback: () => setState(
                    //                 () async {
                    //                   Navigator.pop(context);
                    //                 },
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
                    break;
                  default:
                    break;
                }
              });
            },
            isSelected: selectedIndex == index,
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItems extends StatelessWidget {
  const CustomBottomNavigationBarItems({
    super.key,
    required this.imagePath,
    required this.label,
    this.isSelected = false,
    required this.onTap,
    required this.selectedColor,
    required this.unSelectedColor,
  });
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            color: isSelected == true ? selectedColor : unSelectedColor,
          ),
          kHeight10,
          Text(
            label,
            style: TextStyle(
              color: isSelected == true ? selectedColor : unSelectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
