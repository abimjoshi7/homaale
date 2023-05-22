import 'dart:convert';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/google_maps_constants.dart';
import 'package:cipher/features/google_maps/presentation/bloc/nearby_task_entity_service_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({
    super.key,
  });

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  // late GoogleMapController mapController;
  final LatLng _center = const LatLng(27.7172, 85.3240);
  LatLng _location = LatLng(27.7172, 85.3240);
  String kCurrentLocation = "CurrentUserLocation";
  Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(
    GoogleMapController controller,
  ) async {
    context.read<NearbyTaskEntityServiceBloc>().add(
        NearbyTaskEntityServiceSelected(
            location: _location, slug: MapFilterStatus.all));
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
      if (value == null) {
        setState(() => _location = _center);
      }
    });

    return null;
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
    setCustomMarkers();
  }

//if google maps controller is implemented the uncomment this:
  // @override
  // void dispose() {
  // mapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NearbyTaskEntityServiceBloc,
        NearbyTaskEntityServiceState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success) {
          _markers = addTaskEntityServiceMarkers(
            state.activeList!,
            _location,
          );
        }
      },
      builder: (context, state) {
        // if (state.theStates == TheStates.loading) {
        //   return CardLoading(height: 400.0);
        // }
        return GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          // myLocationEnabled: true,
          zoomControlsEnabled: false,
          // myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _location,
            zoom: 11.8,
          ),
          markers: _markers.values.toSet(),
        );

        // return CardLoading(height: 400.0);
      },
    );
  }
}
