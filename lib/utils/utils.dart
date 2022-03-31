import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:map_demo/models/location.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

int calculateDistance(LatLng originLocation, LatLng destLocation) {
  // These calculations dont take into consideration roads, traffic, hazards etc...
  double p = 0.017453292519943295;
  double a = 0.5 -
      cos((destLocation.latitude - originLocation.latitude) * p) / 2 +
      cos(originLocation.latitude * p) *
          cos(destLocation.latitude * p) *
          (1 - cos((destLocation.longitude - destLocation.longitude) * p)) /
          2;
  return (12742 * asin(sqrt(a))).toInt();
}

Set<Marker> convertListToMarkerSet(
    {required List list, required dynamic originLocation}) {
  Set<Marker> set = <Marker>{};
  if (list.isNotEmpty) {
    for (var i = 0; i < list.length; i++) {
      set.add(Location(
              locationName: list[i]["locationName"],
              latitude: list[i]["latitude"],
              longitude: list[i]["longitude"])
          .toMarker(i.toString(), false));
    }
  }

  if (originLocation != null) {
    set.add(Location(
            locationName: '${originLocation["locationName"]} -> Origin',
            latitude: originLocation["latitude"],
            longitude: originLocation["longitude"])
        .toMarker("Origin", true));
  }
  return set;
}
