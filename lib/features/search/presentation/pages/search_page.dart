import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const String routeName = '/search-page';
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.060,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                  child: CustomTextFormField(
                    hintText: 'Search...',
                    textInputType: TextInputType.text,
                    onSaved: (value) {},
                    prefixWidget: Icon(
                      Icons.search_rounded,
                      size: 30,
                      color: kColorDark,
                    ),
                    suffixWidget: Icon(
                      CupertinoIcons.multiply,
                      size: 22,
                      weight: 400,
                      color: Color(0xff868E96),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.0,
                    vertical: MediaQuery.of(context).size.height * 0.016,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent Searches',
                        style: kText15.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Clear All',
                          style: kLightBlueText14,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: ListTile(
                          minLeadingWidth: MediaQuery.of(context).size.width,
                          leading: Text(
                            'Gardening',
                            style: kText13,
                          ),
                          trailing: Icon(
                            CupertinoIcons.multiply,
                            size: 20,
                            color: kColorLightGrey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
