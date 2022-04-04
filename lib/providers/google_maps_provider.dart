import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/models/location.dart';

class GoogleMapsProvider with ChangeNotifier {
  String? _mapStyle;

  String? get mapStyle => _mapStyle;

  void setMapStyle() {
    rootBundle
        .loadString('assets/google_maps_style.txt')
        .then((string) => _mapStyle = string);
  }

  Future<void> goToOrigin(Completer<GoogleMapController> mapController,
      dynamic originLocation) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      Location(
              locationName: originLocation["locationName"],
              latitude: originLocation["latitude"],
              longitude: originLocation["longitude"])
          .toCameraPosition(),
    ));
    controller.showMarkerInfoWindow(const MarkerId("Origin"));
  }
}
