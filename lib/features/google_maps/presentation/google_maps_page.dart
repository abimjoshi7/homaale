import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
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
  // late GoogleMapController mapController;
  final LatLng _center = const LatLng(27.7172, 85.3240);
  LatLng _location = LatLng(27.7172, 85.3240);
  String kCurrentLocation = "CurrentUserLocation";
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(
    GoogleMapController controller,
  ) async {
    context
        .read<NearbyTaskEntityServiceCubit>()
        .getNearbyTaskEntityService(location: _center);
    setState(() {
      _markers.clear();
    });
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
        setState(
          () => _location = _center,
        );
      }
    });
    return null;
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  @override
  void dispose() {
    // mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NearbyTaskEntityServiceCubit,
        NearbyTaskEntityServiceState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success) {
          for (final taskEntityService in state.nearbyTaskEntityServiceList!) {
            final marker = Marker(
              icon: taskEntityService.isRequested ?? true
                  ? BitmapDescriptor.defaultMarkerWithHue(90)
                  : BitmapDescriptor.defaultMarker,
              markerId: MarkerId(taskEntityService.title.toString()),
              position: LatLng(taskEntityService.city!.latitude!.toDouble(),
                  taskEntityService.city!.longitude!.toDouble()),
              infoWindow: InfoWindow(
                title: "${taskEntityService.title}",
                snippet:
                    "${taskEntityService.city!.name},${taskEntityService.city!.country!.name}",
              ),
            );
            _markers["${taskEntityService.title}"] = marker;
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Task and Services Near Me'),
            elevation: 2,
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _location,
              zoom: 11.8,
            ),
            markers: _markers.values.toSet(),
          ),
        );
      },
    );
  }
}
