import 'dart:async';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/google_maps_constants.dart';
import 'package:cipher/features/google_maps/presentation/cubit/user_location_cubit.dart';
import 'package:cipher/features/user_location/presentation/widgets/search_delegate_widget.dart';
import 'package:cipher/features/user_location/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});
  static const routeName = "/choose-location";
  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  Completer<GoogleMapController> _googleMapController = Completer();
  String _draggedAddress = "";
  late LatLng _draggedLatLng;
  // Position? _draggedPos;
  bool _isDragged = false;
  final TextEditingController _searchController = TextEditingController();

  _init() => _draggedLatLng = kUserLocation;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(
          context,
          (route) => route.settings.name == Root.routeName,
        );
        return true;
      },
      child: Scaffold(
          floatingActionButton: SetLocationButton(
              isDragged: _isDragged,
              draggedAddress: _draggedAddress,
              draggedLatLng: _draggedLatLng),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: CustomAppBar(
            appBarTitle: "Choose Your Location",
            trailingWidget: SizedBox.shrink(),
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == Root.routeName,
                );
              },
              icon: Icon(
                Icons.arrow_back_rounded,
              ),
            ),
          ),
          body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _getMap(),
        _buildSearch(),
        CustomPin(
          isDragged: _isDragged,
        ),
        Positioned(
          right: 10.0,
          top: 75.0,
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

  Container _buildSearch() {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomTextFormField(
          readOnly: true,
          controller: _searchController,
          hintText: "Search for Location",
          onTap: () => showSearch(
            context: context,
            delegate: SearchDelegateWidget(),
          ),
          suffixWidget: Icon(
            Icons.search,
          ),
        ),
      ),
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
    return BlocBuilder<UserLocationCubit, UserLocationState>(
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: state.location ?? kUserLocation,
            zoom: 12.5,
          ),
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
              if (state.tempLocation != null) {
                _goToSpecificPosition(state.tempLocation!);
              }
            }
            setState(() => _draggedLatLng = state.location ?? kUserLocation);
          },
          zoomControlsEnabled: false,
        );
      },
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
            color: Colors.white.withOpacity(0.8),
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
            addVerticalSpace(15.0),
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
                onPressed: () => context
                    .read<UserLocationCubit>()
                    .storeUserLocation(_draggedLatLng),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
