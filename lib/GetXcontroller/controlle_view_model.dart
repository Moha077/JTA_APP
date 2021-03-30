import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jta/screens/home.dart';
import 'package:jta/screens/profil.dart';

class ControlleViewModel extends GetxController {
  Widget _currentScreen = Home();
  int _navigatorValue = 0;
  get navigatoreValue => _navigatorValue;
  get currentScreen => _currentScreen;

  void changeSelectedNavigator(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = Home();
          break;
        }
      case 1:
        {
          _currentScreen = Profil();
          break;
        }

        break;
      default:
    }
    update();
  }
}
