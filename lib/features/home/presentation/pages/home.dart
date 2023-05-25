import 'package:cipher/features/categories/presentation/pages/sections/categories_section.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../core/network_info/network_info.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  static const routeName = '/home';
  static final notificationKey = GlobalKey();
  static final string = '';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map _source = {ConnectivityResult.none: false};
  final ConnectivityStatus _connectivity = ConnectivityStatus.instance;
  @override
  void initState() {
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source as Map);
    });
    super.initState();
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String string;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        string = 'Mobile: Online';
        break;
      case ConnectivityResult.wifi:
        string = 'WiFi: Online';
        break;
      case ConnectivityResult.none:
      default:
        string = 'Offline';
    }
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const HomeHeaderSection(),
            string == 'Offline'
                ? NoInternetPage(
                    assetsPath: 'assets/no_internet_connection.png',
                    errorTile: 'Oops, No Internet Connection.',
                    errorDes:
                        "Make sure Wi-Fi or cellular data is turned on and then try again.",
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Column(
                          children: <Widget>[
                            HeaderOfferSection(),
                            // DealsOfTheDaySection(),
                            CategoriesSection(),
                            TrendingServicesSection(),
                            TasksRecommendationSection(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/banners/notable1.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            PopularTaskerSection(),
                            SizedBox(height: 10),
                            NotableBannerSection(),
                            // RecentlyLaunchedServicesSection(),
                            TasksAndServicesNearbySection(),
                            // SizedBox(height: 120),
                            // const PopularTaskerNearbySection(),
                            // const TaskRecommendationSection(),
                            // PopularTaskNearbySection()
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
