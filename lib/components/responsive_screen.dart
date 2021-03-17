import 'package:flutter/material.dart';

class Screen {
  Size screenSize;
  //Screen._internal();
  Screen(this.screenSize);

  double widthPercent(percentage) {
    return percentage / 100 * screenSize.width;
  }

  double heightPercent(percentage) {
    return percentage / 100 * screenSize.height;
  }

  double getSizeInPx(int pixels) {
    return (pixels / 3.61) / 100 * screenSize.width;
  }
}
