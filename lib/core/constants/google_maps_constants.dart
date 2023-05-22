import 'dart:ui' as ui;
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Uint8List? markerIcon;
Uint8List? myLocationMarker;
const kUserLocation = LatLng(27.7172, 85.3240);
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

Future<void> setCustomMarkers() async {
  myLocationMarker = await getBytesFromAsset("assets/logos/map-pin.png", 100);
  markerIcon = await getBytesFromAsset("assets/homaale-logo.png", 60);
}

Marker addMyLocationMarker(LatLng location) => Marker(
    markerId: MarkerId("my_location"),
    position: LatLng(location.latitude, location.longitude),
    icon: BitmapDescriptor.fromBytes(myLocationMarker!),
    infoWindow: InfoWindow(
      title: "Me",
    ));
Map<String, Marker> addTaskEntityServiceMarkers(
    List<TaskEntityService> nearbyTaskEntityServiceList, LatLng location) {
  final Map<String, Marker> _markers = {};
  //set location marker
  _markers["my_location"] = addMyLocationMarker(location);
  //set task entity service markers
  for (final taskEntityService in nearbyTaskEntityServiceList) {
    final marker = Marker(
      icon: BitmapDescriptor.fromBytes(markerIcon!),
      markerId: MarkerId(taskEntityService.title.toString()),
      position: LatLng(taskEntityService.city!.latitude!.toDouble(),
          taskEntityService.city!.longitude!.toDouble()),
      infoWindow: InfoWindow(
        title: taskEntityService.isRequested ?? true
            ? "Task:${taskEntityService.title}"
            : "Service:${taskEntityService.title}",
        snippet:
            "${taskEntityService.city!.name},${taskEntityService.city!.country!.name}",
      ),
    );
    _markers["${taskEntityService.title}"] = marker;
  }
  //return the value
  return _markers;
}
