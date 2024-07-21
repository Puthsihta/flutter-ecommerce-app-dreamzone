import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

abstract class ResponsiveUtil {
  static bool isMobile(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile;
  }

  static bool isTablet(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isTablet;
  }

  static Widget builder(BuildContext context,
      {required Widget mobile, Widget? tablet}) {
    if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
