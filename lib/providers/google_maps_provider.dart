import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class GoogleMapsProvider with ChangeNotifier {
  String? _mapStyle;

  String? get mapStyle => _mapStyle;

  void setMapStyle() {
    rootBundle
        .loadString('assets/google_maps_style.txt')
        .then((string) => _mapStyle = string);
  }
}
