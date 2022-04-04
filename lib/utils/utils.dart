import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:math' show cos, sqrt, asin;
import 'package:http/http.dart' as http;
import 'package:map_demo/models/location.dart';
//ignore: library_prefixes
import 'package:image/image.dart' as Images;

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// int calculateDistance(LatLng originLocation, LatLng destLocation) {
//   // These calculations dont take into consideration roads, traffic, hazards etc...
//   double p = 0.017453292519943295;
//   double a = 0.5 -
//       cos((destLocation.latitude - originLocation.latitude) * p) / 2 +
//       cos(originLocation.latitude * p) *
//           cos(destLocation.latitude * p) *
//           (1 - cos((destLocation.longitude - destLocation.longitude) * p)) /
//           2;
//   return (12742 * asin(sqrt(a))).toInt();
// }

Uint8List _drawImage({
  required List<int> avatarImageBytes,
  required List<int> markerImageBytes,
}) {
  var decodedAvatarImage = Images.decodeImage(avatarImageBytes);
  var decodedMarkerImage = Images.decodeImage(markerImageBytes);

  // Resize the avatar image to fit inside the marker image
  decodedAvatarImage = Images.copyResize(
    decodedAvatarImage!,
    width: decodedMarkerImage!.width ~/ 1.1,
    height: decodedMarkerImage.height ~/ 1.1,
  );

  int radius = decodedMarkerImage.width ~/ 2 - 20;
  int originX = decodedAvatarImage.width ~/ 2;
  int originY = decodedAvatarImage.height ~/ 2;

  // Draw the avatar image cropped as a circle inside the marker image
  for (int y = -radius; y <= radius; y++) {
    for (int x = -radius; x <= radius; x++) {
      if (x * x + y * y <= radius * radius) {
        decodedMarkerImage.setPixelSafe(
          originX + x + 10,
          originY + y - 12,
          decodedAvatarImage.getPixelSafe(originX + x, originY + y),
        );
      }
    }
  }

  List<int> imageByteList = Images.encodePng(decodedMarkerImage);

  return Uint8List.fromList(imageByteList);
}

Future<Set<Marker>> convertListToMarkerSet({
  required List list,
  required dynamic originLocation,
}) async {
  Set<Marker> set = <Marker>{};

  if (originLocation != null) {
    // Load Avatar Image
    String baseUrl = originLocation["imageUrl"];
    var url = Uri.parse(baseUrl);

    var response = await http.get(url);

    List<int> avatarImageBytes = Uint8List.view(response.bodyBytes.buffer);

    // Load Marker Image
    var imageData = await rootBundle.load('assets/ma.png');
    List<int> markerImageBytes = Uint8List.view(imageData.buffer);

    // Draw new image from avatar image and marker image
    // Output is a .png file as a Uint8List
    Uint8List image = _drawImage(
      avatarImageBytes: avatarImageBytes,
      markerImageBytes: markerImageBytes,
    );

    set.add(
      Location(
              locationName: '${originLocation["locationName"]} -> Origin',
              latitude: originLocation["latitude"],
              longitude: originLocation["longitude"])
          .toMarker(
        markerId: "Origin",
        originLocation: true,
        imageByteData: image,
      ),
    );
  }

  if (list.isNotEmpty) {
    for (var i = 0; i < list.length; i++) {
      // Load Avatar Image
      String baseUrl = list[i]["imageUrl"];
      var url = Uri.parse(baseUrl);

      var response = await http.get(url);

      List<int> avatarImageBytes = Uint8List.view(response.bodyBytes.buffer);

      // Load Marker Image
      var imageData = await rootBundle.load('assets/ma.png');
      List<int> markerImageBytes = Uint8List.view(imageData.buffer);

      // Draw new image from avatar image and marker image
      // Output is a .png file
      Uint8List image = _drawImage(
        avatarImageBytes: avatarImageBytes,
        markerImageBytes: markerImageBytes,
      );

      set.add(
        Location(
                locationName: list[i]["locationName"],
                latitude: list[i]["latitude"],
                longitude: list[i]["longitude"])
            .toMarker(
          markerId: i.toString(),
          originLocation: false,
          imageByteData: image,
        ),
      );
    }
  }

  return set;
}


// Rectangle Image Marker
// for (var i = 0; i < list.length; i++) {
//       String baseUrl = list[i]["imageUrl"];
//       var url = Uri.parse(baseUrl);

//       var response = await http.get(url);

//       Uint8List image = response.bodyBytes.buffer.asUint8List();

//       final Codec markerImageCodec = await instantiateImageCodec(image,
//           targetWidth: targetWidth, targetHeight: targetHeight);

//       final FrameInfo frameInfo = await markerImageCodec.getNextFrame();
//       final ByteData? byteData = await frameInfo.image.toByteData(
//         format: ImageByteFormat.png,
//       );

//       final Uint8List resizedImage = byteData!.buffer.asUint8List();

//       set.add(
//         Location(
//                 locationName: list[i]["locationName"],
//                 latitude: list[i]["latitude"],
//                 longitude: list[i]["longitude"])
//             .toMarker(i.toString(), false, resizedImage),
//       );
//     }