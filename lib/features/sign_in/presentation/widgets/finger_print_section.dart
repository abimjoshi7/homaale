import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FingerPrintSection extends StatelessWidget {
  const FingerPrintSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            // await showModalBottomSheet<Widget>(
            //   context: context,
            //   builder: (context) => Column(
            //     children: [
            //       kHeight5,
            //       const Icon(
            //         Icons.maximize,
            //         size: 40,
            //         color: Color(0xffCED4DA),
            //       ),
            //       Expanded(
            //         child: Column(
            //           children: [
            //             kHeight50,
            //             Container(
            //               color: Colors.black12,
            //               height: 100,
            //               width: 100,
            //             ),
            //             kHeight20,
            //             const Text("Verify it's you"),
            //             kHeight10,
            //             const Text('or'),
            //             kHeight10,
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 const Text('Use'),
            //                 kWidth10,
            //                 GestureDetector(
            //                   onTap: () {},
            //                   child: const Text(
            //                     'MPIN',
            //                     style: TextStyle(color: Color(0xff3EAEFF)),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       CustomElevatedButton(
            //         callback: () {
            //           Navigator.pop(context);
            //         },
            //         mainColor: Colors.white,
            //         textColor: const Color(0xff3D3F7D),
            //         label: 'Cancel',
            //       ),
            //       kHeight20
            //     ],
            //   ),
            // );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.fingerprint_rounded),
              kWidth5,
              Text(
                'Tap to login with fingerprint',
                style: kBodyText1,
              )
            ],
          ),
        );
      },
    );
  }
}
