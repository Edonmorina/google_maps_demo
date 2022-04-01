import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:map_demo/models/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:map_demo/utils/utils.dart';
import 'package:flutter/material.dart';

class DirectionRepository {
  assignTravelMode(TravelMode travelMode) {
    switch (travelMode) {
      case TravelMode.walking:
        return "WALKING";
      case TravelMode.bicycling:
        return "BICYCLING";
      case TravelMode.driving:
        return "DRIVING";
      default:
        return "DRIVING";
    }
  }

  Future<void> getDirectionResponse({
    required Location origin,
    required Location destination,
    required TravelMode travelMode,
    required BuildContext context,
  }) async {
    String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
    const String baseScheme = 'https';
    const String baseHost = 'maps.googleapis.com';
    const String basePath = 'maps/api/directions/json';

    Map<String, String> baseQueryParams = {
      "origin": '${origin.latitude},${origin.longitude}',
      "destination": '${destination.latitude}, ${destination.longitude}',
      "mode": assignTravelMode(travelMode),
      "key": googleApiKey
    };

    var url = Uri(
      scheme: baseScheme,
      host: baseHost,
      path: basePath,
      queryParameters: baseQueryParams,
    );

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }
}
