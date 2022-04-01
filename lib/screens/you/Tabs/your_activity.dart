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

class _YourActivityState extends State<YourActivity>
    with AutomaticKeepAliveClientMixin {
  final Completer<GoogleMapController> _controller = Completer();

  List _locationData = [];

  dynamic _originLocationData;

  @override
  bool get wantKeepAlive => true;

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
  }

  // Future<void> _goToOrigin() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //     Location(
  //             locationName: _originLocationData["locationName"],
  //             latitude: _originLocationData["latitude"],
  //             longitude: _originLocationData["longitude"])
  //         .toCameraPosition(),
  //   ));
  //   controller.showMarkerInfoWindow(const MarkerId("Origin"));
  // }

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
                : 0.0,
            longitude: (_originLocationData != null)
                ? _originLocationData["longitude"]
                : 0.0)
        .toLatLng();
    // LatLng destLatLng = (directionIndex < _locationData.length)
    //     ? Location(
    //             locationName: "DestLatLng",
    //             latitude: _locationData[directionIndex]["latitude"],
    //             longitude: _locationData[directionIndex]["longitude"])
    //         .toLatLng()
    //     : originLatLng;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.blueGrey,
      child: GoogleMapWidget(
        controller: _controller,
        initialLocation: originLatLng,
        originLocationData: _originLocationData,
        mapSet: convertListToMarkerSet(
            list: (_locationData.isNotEmpty)
                ? _locationData
                : [
                    {
                      "locationName": 'Unknown',
                      "latitude": 0.0,
                      "longitude": 0.0
                    }
                  ],
            originLocation: _originLocationData),
      ),
    );
  }
}
