import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  Location(
      {required this.locationName,
      required this.latitude,
      required this.longitude});

  String locationName;
  double latitude;
  double longitude;

  Marker toMarker(String markerId, bool originLocation) {
    // markerId could be a uid if its the location of a user.
    return Marker(
        markerId: MarkerId(markerId),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: locationName),
        icon: originLocation
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
            : BitmapDescriptor.defaultMarker);
  }

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }

  CameraPosition toCameraPosition() {
    return CameraPosition(target: LatLng(latitude, longitude), zoom: 8);
  }
}
