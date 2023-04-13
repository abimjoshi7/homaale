import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/google_maps/presentation/cubit/nearby_task_entity_service_cubit.dart';
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
  final LatLng _center = const LatLng(27.7172, 85.3240);
  late LatLng _location;
  String kCurrentLocation = "CurrentUserLocation";
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
    context
        .read<NearbyTaskEntityServiceCubit>()
        .getNearbyTaskEntityService(location: _center);
  }

  Future<void> getUserLocation() async {
    await CacheHelper.getCachedString(kCurrentLocation).then((value) {
      if (value != null) {
        setState(() {
          final position = Position.fromMap(jsonDecode(value));
          _location = LatLng(position.latitude, position.longitude);
        });
      }
      if (value!.isEmpty) {
        setState(() {
          _location = _center;
        });
      }
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
          target: _location,
          zoom: 11.0,
        ),
      ),
    );
  }
}
