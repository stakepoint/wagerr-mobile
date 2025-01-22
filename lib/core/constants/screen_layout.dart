import 'package:flutter/material.dart';

class ScreenLayout {
  static const double mobileBreakpoint = 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint;
}
