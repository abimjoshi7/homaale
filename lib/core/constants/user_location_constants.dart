import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> cacheUserLocation(LatLng location) async =>
    await CacheHelper.setCachedString(
      "CurrentUserLocation",
      jsonEncode(
        LatLng(location.latitude, location.longitude),
      ),
    );
		
