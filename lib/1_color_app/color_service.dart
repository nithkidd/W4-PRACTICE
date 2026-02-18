import 'package:flutter/material.dart';

//this color service class is responsible for tap counts for each card type, and notifying listeners when the state changes
class ColorService extends ChangeNotifier {
  int _redTapCount = 0; // tap count for red card
  int _blueTapCount = 0; // tap count for blue card
  int _greenTapCount = 0; // tap count for green card
  int _yellowTapCount = 0; // tap count for yellow card

  int get redTapCount => _redTapCount;
  int get blueTapCount => _blueTapCount;
  int get greenTapCount => _greenTapCount;
  int get yellowTapCount => _yellowTapCount;


  void incrementRedTapCount() {
    _redTapCount++;
    notifyListeners();
  }

  void incrementBlueTapCount() {
    _blueTapCount++;
    notifyListeners();
  }

  void incrementGreenTapCount() {
    _greenTapCount++;
    notifyListeners();
  }

  void incrementYellowTapCount() {
    _yellowTapCount++;
    notifyListeners();
  }
}
