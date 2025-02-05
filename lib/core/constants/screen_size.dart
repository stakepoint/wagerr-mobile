import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext? context;
  ScreenSize({this.context});

  // screen height
  double get height => MediaQuery.of(context!).size.height;

  // screen width
  double get width => MediaQuery.of(context!).size.width;

  // size
  Size get size => MediaQuery.of(context!).size;

  // calculated height
  double calculatedHeight({double? height}) =>
      MediaQuery.of(context!).size.height * (height! / 812);
  // calculated width
  double calculatedWidth({double? width}) =>
      MediaQuery.of(context!).size.width * (width! / 375);
}

ScreenSize screenSize(BuildContext context) => ScreenSize(context: context);
