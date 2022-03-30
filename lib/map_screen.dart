import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/widgets/google_map_widget.dart';
import 'package:map_demo/models/location.dart';
import 'package:map_demo/widgets/map_screen_icon_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  List _locationData = [];
  dynamic _homeLocation;

  @override
  void initState() {
    super.initState();
    readLocationDataJson();
  }

  Future<void> _goHome() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      Location(
              locationName: _homeLocation["locationName"],
              latitude: _homeLocation["latitude"],
              longitude: _homeLocation["longitude"])
          .toCameraPosition(),
    ));
  }

  Future<void> readLocationDataJson() async {
    final String response =
        await rootBundle.loadString('assets/locationData.json');
    final data = await convert.json.decode(response);

    setState(() {
      _locationData = data["locations"];
      _homeLocation = data["homeLocation"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.blueGrey,
            child: GoogleMapWidget(
                controller: _controller, locationData: _locationData),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MapScreenIconButton(
                    iconData: Icons.arrow_back,
                    margin: EdgeInsets.only(left: 20, top: 20),
                  ),
                  Row(
                    children: [
                      MapScreenIconButton(
                        onTap: () => _goHome(),
                        iconData: Icons.location_pin,
                        margin: const EdgeInsets.only(right: 20, top: 20),
                      ),
                      MapScreenIconButton(
                        onTap: () {},
                        iconData: Icons.menu,
                        margin: const EdgeInsets.only(right: 20, top: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
