import 'dart:async';
import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/models/location.dart';

class GoogleMapWidget extends StatelessWidget {
  GoogleMapWidget(
      {Key? key, required this.controller, required this.locationData})
      : super(key: key);
  final Completer<GoogleMapController> controller;
  final List locationData;
  final Set<Marker> mapSet = <Marker>{};

  // int calculateDistance(lat1, lon1, lat2, lon2) {
  //   double p = 0.017453292519943295;
  //   var c = cos;
  //   double a = 0.5 -
  //       c((lat2 - lat1) * p) / 2 +
  //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  //   return (12742 * asin(sqrt(a))).toInt();
  // }

  void _convertListToMarkerSet(List list) {
    for (var i = 0; i < list.length; i++) {
      mapSet.add(Location(
              locationName: list[i]["locationName"],
              latitude: list[i]["latitude"],
              longitude: list[i]["longitude"])
          .toMarker(i.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _convertListToMarkerSet(locationData);
    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(42.6593, 20.2887),
        ),
        onMapCreated: (GoogleMapController controller) {
          this.controller.complete(controller);
        },
        markers: mapSet,
      ),
    );
  }
}
