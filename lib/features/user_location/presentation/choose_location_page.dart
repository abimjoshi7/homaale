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
  // Position? _draggedPos;
  bool _isDragged = false;
  CameraPosition? _cameraPosition;

  _init() {
    // await getUserLocation();
    _defaultLocation = kUserLocation;
    _draggedLatLng = kUserLocation;
    _cameraPosition = CameraPosition(
      target: _defaultLocation,
      zoom: 17.5,
    );
    // _goToUserCurrentPosition();
  }

  Future<void> getUserLocation() async {
    await CacheHelper.getCachedString("CurrentUserLocation").then((value) {
      if (value != null) {
        setState(() {
          final position = LatLng.fromJson(jsonDecode(value)) as LatLng;
          _defaultLocation = position;
        });
      }
      if (value == null) {
        setState(() => _defaultLocation = kUserLocation);
      }
    });

    return null;
  }

  @override
  void initState() {
    getUserLocation();
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SetLocationButton(
            isDragged: _isDragged,
            draggedAddress: _draggedAddress,
            draggedLatLng: _draggedLatLng),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        Positioned(
          right: 10.0,
          top: 20.0,
          child: InkWell(
            onTap: () => _goToUserCurrentPosition(),
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(1, 6),
                  ),
                ],
              ),
              child: Icon(
                Icons.my_location_rounded,
                color: Colors.grey.shade500,
                size: 17.0,
              ),
            ),
          ),
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
      compassEnabled: true,
      mapType: MapType.normal,
      onCameraIdle: () {
        _getAddress(_draggedLatLng);
        setState(() {
          _isDragged = false;
        });
      },
      onCameraMove: (position) {
        setState(() {
          _draggedLatLng = position.target;
          _isDragged = true;
        });
      },
      onMapCreated: (GoogleMapController controller) {
        if (!_googleMapController.isCompleted) {
          _googleMapController.complete(controller);
        }
      },
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

class SetLocationButton extends StatelessWidget {
  const SetLocationButton({
    super.key,
    required bool isDragged,
    required String draggedAddress,
    required LatLng draggedLatLng,
  })  : _isDragged = isDragged,
        _draggedAddress = draggedAddress,
        _draggedLatLng = draggedLatLng;

  final bool _isDragged;
  final String _draggedAddress;
  final LatLng _draggedLatLng;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_isDragged,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 48.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Color(0xffCED4DA),
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            addVerticalSpace(10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                _draggedAddress,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            addVerticalSpace(10.0),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
