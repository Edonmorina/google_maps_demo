import 'package:flutter/cupertino.dart';

class GoogleMapsProvder with ChangeNotifier {
  int _directionIndex = 3;

  int get directionIndex => _directionIndex;

  void setDirectionIndex(int index) {
    _directionIndex = index;
    notifyListeners();
  }
}
