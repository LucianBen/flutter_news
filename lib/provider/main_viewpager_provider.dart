import 'package:flutter/material.dart';

class MainViewpagerProvider with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
