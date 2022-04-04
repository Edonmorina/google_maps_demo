import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/Widgets/google_map_widget.dart';
import 'package:map_demo/models/location.dart';
import 'package:map_demo/providers/google_maps_provider.dart';
import 'package:map_demo/utils/global_variables.dart';
import 'package:map_demo/widgets/you_screen_buttons.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:map_demo/utils/utils.dart';
import 'package:provider/provider.dart';

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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

  @override
  //ignore: must_call_super
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
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: GoogleMapWidget(
              controller: _controller,
              initialLocation: originLatLng,
              originLocationData: _originLocationData,
              mapSet: _markerSet,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: kYouActivityAppBarHeight,
              width: double.infinity,
              color: Colors.white.withOpacity(0.625),
              padding: const EdgeInsets.only(right: 15),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 230, 173, 3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80'),
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu))
                        ],
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 10,
            child: Row(
              children: const [
                YouScreenButton(title: "SOS", iconData: Icons.add_alert),
                YouScreenButton(
                  title: "Add Check In",
                  iconData: Icons.add,
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: InkWell(
              onTap: () {
                Provider.of<GoogleMapsProvider>(context, listen: false)
                    .goToOrigin(_controller, _originLocationData);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// SizedBox(
//                     height: 45,
//                     width: 45,
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80'),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   )