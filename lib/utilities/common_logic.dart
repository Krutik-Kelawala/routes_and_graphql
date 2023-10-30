import 'dart:math';

import 'package:flutter/cupertino.dart';

class CommonLogic {
  static late double height;
  static late double width;
  static late num textSize;

  // TODO get devices height width & responsive text size

  static void initiateHeightWidth(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    textSize = pow((height * height) + (width * width), 1 / 2);
  }
}
