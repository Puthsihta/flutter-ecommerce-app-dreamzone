import 'package:flutter/material.dart';

class RouteProvider extends ChangeNotifier {
  int _seleteIndex = 0;
  int get seleteIndex => _seleteIndex;
  Future<void> setIndex(int index) async {
    _seleteIndex = index;
    notifyListeners();
  }
}
