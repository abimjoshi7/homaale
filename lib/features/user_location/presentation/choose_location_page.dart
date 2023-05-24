import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/google_maps_constants.dart';
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
  // final LatLng _defaultLatLng = const LatLng(27.7172, 85.3240);
  // LatLng _location = LatLng(27.7172, 85.3240);
  String _draggedAddress = "";
  late LatLng _draggedLatLng;
  CameraPosition? _cameraPosition;

  _init() {
    _draggedLatLng = kUserLocation;
    _cameraPosition = CameraPosition(
      target: kUserLocation,
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
              onPressed: () {
                // _goToUserCurrentPosition();
              },
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
        _getCustomPin(),
        _showDraggedAddress(),
      ],
    );
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        color: Colors.blue,
        child: Text(
          _draggedAddress,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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

  Widget _getCustomPin() {
    return Center(
      child: SizedBox(
        height: 130.0,
        width: 150.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image.asset(
              "assets/logos/pin-msg.png",
              width: 149.0,
              height: 50.0,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              // height: 40.0,
            ),
            Positioned(
              top: 45.0,
              child: Image.asset(
                "assets/logos/map-pin.png",
                filterQuality: FilterQuality.high,
                width: 40.0,
                height: 48.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
