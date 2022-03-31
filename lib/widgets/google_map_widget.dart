import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    Key? key,
    required this.controller,
    required this.initialLocation,
    required this.locationData,
    required this.originLocationData,
    required this.mapSet,
    required this.polylinePoints,
  }) : super(key: key);
  final Completer<GoogleMapController> controller;
  final LatLng initialLocation;
  final List locationData;
  final dynamic originLocationData;
  final Set<Marker> mapSet;
  final List<LatLng> polylinePoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: initialLocation,
        ),
        onMapCreated: (GoogleMapController controller) {
          this.controller.complete(controller);
        },
        markers: mapSet,
        polylines: <Polyline>{
          Polyline(
            polylineId: const PolylineId("Polyline"),
            points: polylinePoints,
            width: 3,
            jointType: JointType.round,
          ),
        },
      ),
    );
  }
}
