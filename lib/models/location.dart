import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  Location(
      {required this.locationName,
      required this.latitude,
      required this.longitude});

  String locationName;
  double latitude;
  double longitude;

  Marker toMarker(
      {required String markerId,
      bool originLocation = false,
      required Uint8List imageByteData}) {
    // markerId could be a uid if its the location of a user.

    return Marker(
        markerId: MarkerId(markerId),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: locationName),
        icon: BitmapDescriptor.fromBytes(imageByteData));
  }

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }

  CameraPosition toCameraPosition() {
    return CameraPosition(target: LatLng(latitude, longitude), zoom: 17);
  }
}
