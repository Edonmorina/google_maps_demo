import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/network/google_directions_api/directions_repository.dart';
import 'package:map_demo/models/location.dart';

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
    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: initialLocation,
            ),
            onMapCreated: (GoogleMapController controller) {
              this.controller.complete(controller);
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
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Row(), Row()],
            ),
          )
        ],
      ),
    );
  }
}
