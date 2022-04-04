import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/utils/utils.dart';
import 'package:map_demo/widgets/google_map_widget.dart';
import 'package:map_demo/models/location.dart';

class YourActivity extends StatefulWidget {
  const YourActivity({Key? key}) : super(key: key);

  @override
  State<YourActivity> createState() => _YourActivityState();
}

class _YourActivityState extends State<YourActivity> {
  final Completer<GoogleMapController> _controller = Completer();

  List _locationData = [];
  Set<Marker> _markerSet = {};

  dynamic _originLocationData;

  @override
  void initState() {
    super.initState();
    _readLocationDataJson();
  }

  Future<void> _readLocationDataJson() async {
    final String response =
        await rootBundle.loadString('assets/locationData.json');
    final data = await convert.json.decode(response);

    setState(() {
      _locationData = data["locations"];
      _originLocationData = data["originLocation"];
    });

    var markerSet = await convertListToMarkerSet(
        list: _locationData, originLocation: _originLocationData);

    setState(() {
      _markerSet = markerSet;
    });
  }

  Future<void> _goToOrigin() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      Location(
              locationName: _originLocationData["locationName"],
              latitude: _originLocationData["latitude"],
              longitude: _originLocationData["longitude"])
          .toCameraPosition(),
    ));
    controller.showMarkerInfoWindow(const MarkerId("Origin"));
  }

  // Future<void> _goToLocation(int index) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //     Location(
  //             locationName: _locationData[index]["locationName"],
  //             latitude: _locationData[index]["latitude"],
  //             longitude: _locationData[index]["longitude"])
  //         .toCameraPosition(),
  //   ));
  //   controller.dispose();
  // }

  // Future<void> _showLocationMarkerLabel(int index) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.showMarkerInfoWindow(MarkerId(index.toString()));
  //   controller.dispose();
  // }

  int directionIndex = 3;

  @override
  Widget build(BuildContext context) {
    LatLng originLatLng = Location(
            locationName: "OriginLatLng",
            latitude: (_originLocationData != null)
                ? _originLocationData["latitude"]
                : 40.730449,
            longitude: (_originLocationData != null)
                ? _originLocationData["longitude"]
                : -73.995642)
        .toLatLng();
    // LatLng destLatLng = (directionIndex < _locationData.length)
    //     ? Location(
    //             locationName: "DestLatLng",
    //             latitude: _locationData[directionIndex]["latitude"],
    //             longitude: _locationData[directionIndex]["longitude"])
    //         .toLatLng()
    //     : originLatLng;

    return GoogleMapWidget(
      controller: _controller,
      initialLocation: originLatLng,
      originLocationData: _originLocationData,
      mapSet: _markerSet,
    );
  }
}
