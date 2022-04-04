import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/providers/google_maps_provider.dart';
import 'package:provider/provider.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    Key? key,
    required this.controller,
    required this.initialLocation,
    required this.originLocationData,
    required this.mapSet,
  }) : super(key: key);
  final Completer<GoogleMapController> controller;
  final LatLng initialLocation;
  final dynamic originLocationData;
  final Set<Marker> mapSet;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      compassEnabled: false,
      initialCameraPosition: CameraPosition(
        target: initialLocation,
        zoom: 17,
      ),
      onMapCreated: (GoogleMapController controller) {
        this.controller.complete(controller);
        controller.setMapStyle(
            Provider.of<GoogleMapsProvider>(context, listen: false).mapStyle);
      },
      markers: mapSet,
      polylines: <Polyline>{
        const Polyline(
          polylineId: PolylineId("Polyline"),
          color: Colors.red,
          points: [],
          width: 3,
          jointType: JointType.round,
        ),
      },
    );
  }
}
