import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/utils/utils.dart';
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
  dynamic _originLocationData;
  bool isMenuOpen = false;

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

  Future<void> _goToLocation(int index) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      Location(
              locationName: _locationData[index]["locationName"],
              latitude: _locationData[index]["latitude"],
              longitude: _locationData[index]["longitude"])
          .toCameraPosition(),
    ));
    controller.dispose();
  }

  Future<void> _showLocationMarkerLabel(int index) async {
    final GoogleMapController controller = await _controller.future;
    controller.showMarkerInfoWindow(MarkerId(index.toString()));
    controller.dispose();
  }

  int directionIndex = 10000;

  @override
  Widget build(BuildContext context) {
    if (_locationData.isEmpty) {
      showSnackBar("Coudlnt Get The Location List", context);
    }

    if (_originLocationData == null) {
      showSnackBar("Coudlnt Get The Origin Location", context);
    }

    LatLng originLatLng = Location(
            locationName: "OriginLatLng",
            latitude: _originLocationData["latitude"],
            longitude: _originLocationData["longitude"])
        .toLatLng();
    LatLng destLatLng = (directionIndex < _locationData.length)
        ? Location(
                locationName: "DestLatLng",
                latitude: _locationData[directionIndex]["latitude"],
                longitude: _locationData[directionIndex]["longitude"])
            .toLatLng()
        : originLatLng;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.blueGrey,
            child: GoogleMapWidget(
              controller: _controller,
              initialLocation: originLatLng,
              locationData: _locationData,
              originLocationData: _originLocationData,
              mapSet: convertListToMarkerSet(
                  list: _locationData, originLocation: _originLocationData),
              polylinePoints: <LatLng>[originLatLng, destLatLng],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: isMenuOpen ? MediaQuery.of(context).size.width * 0.6 : 0,
              color: Colors.black87.withOpacity(0.5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: List<Container>.generate(
                        _locationData.length,
                        (index) => Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 85,
                          color: Colors.white.withOpacity(0.75),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        _locationData[index]["locationName"],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${calculateDistance(
                                            originLatLng,
                                            LatLng(
                                                _locationData[index]
                                                    ["latitude"],
                                                _locationData[index]
                                                    ["latitude"]),
                                          )}",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "KM",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      directionIndex = index;
                                      isMenuOpen = false;
                                    });

                                    _goToLocation(index);
                                    _showLocationMarkerLabel(index);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black87
                                                .withOpacity(0.25),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text("Get"),
                                          Text("Direction")
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                        onTap: () => _goToOrigin(),
                        iconData: Icons.location_pin,
                        margin: const EdgeInsets.only(right: 20, top: 20),
                      ),
                      MapScreenIconButton(
                        onTap: () {
                          setState(() {
                            isMenuOpen = !isMenuOpen;
                          });
                        },
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
