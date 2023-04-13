import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});
  static const routeName = '/google-maps-page';
  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController mapController;
  LatLng? _location;
  final LatLng _center = const LatLng(27.7172, 85.3240);
  String kCurrentLocation = "CurrentUserLocation";
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    await CacheHelper.getCachedString(kCurrentLocation).then((value) {
      final Position? position = jsonDecode(value!) as Position;
      if (position != null) return;
      _location = LatLng(position!.latitude, position.longitude);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task and Services Near Me'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _location ?? _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
