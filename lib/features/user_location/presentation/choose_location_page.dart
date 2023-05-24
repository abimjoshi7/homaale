import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/google_maps_constants.dart';
import 'package:cipher/core/constants/user_location_constants.dart';
import 'package:cipher/features/user_location/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  Completer<GoogleMapController> _googleMapController = Completer();
  String _draggedAddress = "";
  late LatLng _defaultLocation;
  late LatLng _draggedLatLng;
  CameraPosition? _cameraPosition;
  Future<void> getUserLocation() async {
    final x = await CacheHelper.getCachedString("CurrentUserLocation");
    if (x != null) {
      setState(() {
        _defaultLocation = LatLng.fromJson(x) ?? kUserLocation;
      });
    }
  }

  _init() async {
    await getUserLocation();
    log("peelo");
    _draggedLatLng = kUserLocation;
    _cameraPosition = CameraPosition(
      target: _defaultLocation,
      zoom: 17.5,
    );
    _goToUserCurrentPosition();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: SizedBox(
            height: 50,
            width: 366.0,
            child: FloatingActionButton(
              backgroundColor: kColorDarkPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "Set Location",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
              onPressed: () async => await cacheUserLocation(_draggedLatLng),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: CustomAppBar(
          appBarTitle: "Choose Your Location",
          trailingWidget: SizedBox.shrink(),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _getMap(),
        CustomPin(),
        DraggedAddressBar(
          draggedAddress: _draggedAddress,
        ),
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Icon(Icons.my_location_rounded),
        )
      ],
    );
  }

//Get Address placemark on camera moved
  Future _getAddress(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0];
    String addressStr =
        "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    setState(() => _draggedAddress = addressStr);
  }

  Widget _getMap() {
    return GoogleMap(
      initialCameraPosition: _cameraPosition!,
      mapType: MapType.normal,
      onCameraIdle: () => _getAddress(_draggedLatLng),
      onCameraMove: (position) => _draggedLatLng = position.target,
      onMapCreated: (GoogleMapController controller) {
        if (!_googleMapController.isCompleted) {
          _googleMapController.complete(controller);
        }
      },
      compassEnabled: true,
      zoomControlsEnabled: false,
    );
  }

//move camera to initial user location
  Future _goToUserCurrentPosition() async {
    Position _currentPosition = await _determineUserCurrentPosition();
    _goToSpecificPosition(LatLng(
      _currentPosition.latitude,
      _currentPosition.longitude,
    ));
  }

  Future _goToSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 17.5,
        ),
      ),
    );
    await _getAddress(position);
  }

  Future<Position> _determineUserCurrentPosition() async {
    bool _isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!_isLocationServiceEnabled) {
      if (!mounted) ;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enable location services.',
          ),
        ),
      );
    }
    final _position = await Geolocator.checkPermission().then((value) async {
      if (value == LocationPermission.denied ||
          value == LocationPermission.deniedForever ||
          value == LocationPermission.unableToDetermine) {
        await Geolocator.requestPermission();
        if (!mounted) ;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please provide location access from app settings.',
            ),
          ),
        );
      }
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    });
    return _position;
  }
}
